using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Text.Json;

namespace AkinatorApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AkinatorController : ControllerBase
    {
       
        [HttpPost("answer")]
        public IActionResult Answer([FromBody] AkinatorAnswerRequest request)
        {
            if (request.Attributes == null || request.Attributes.Count == 0)
            {
                return BadRequest(new { error = "Не передан список атрибутов." });
            }

            
            var attrList = "[" + string.Join(",", request.Attributes) + "]";
            var query = $"guess_once({attrList}, Result)";
            var result = RunProlog(query);

            
            if (string.IsNullOrWhiteSpace(result) || result == "not_found")
                return Ok(new { result = "Персонаж не угадан" });

            if (result == "too_many")
                return Ok(new { result = "too_many" });

            return Ok(new { result = $"Ваш персонаж: {result}" });

        }

        [HttpPost("add")]
        public IActionResult AddCharacter([FromBody] NewCharacterRequest request)
        {
            
            return Ok(new
            {
                message = $"Добавление персонажа '{request.Name}' с атрибутами: {string.Join(", ", request.Attributes)} (в заглушке)"
            });
        }

        
        private string RunProlog(string query)
        {
            var process = new Process();
            process.StartInfo.FileName = "swipl";
            process.StartInfo.Arguments = $"-q -f akinator.pl -- \"{query}\"";
            process.StartInfo.RedirectStandardOutput = true;
            process.StartInfo.RedirectStandardError = true;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.CreateNoWindow = true;

            process.Start();
            string output = process.StandardOutput.ReadToEnd().Trim();
            process.WaitForExit();

            return output;
        }

        
        public class AkinatorAnswerRequest
        {
            public List<string> Attributes { get; set; }
        }

        
        public class NewCharacterRequest
        {
            public string Name { get; set; }
            public List<string> Attributes { get; set; }
        }
    }
}
