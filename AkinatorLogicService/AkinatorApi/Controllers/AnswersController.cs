using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AkinatorApi.Models;
using AkinatorApi.Data;

namespace AkinatorApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AnswersController : ControllerBase
    {
        private readonly AkinatorContext _context;

        public AnswersController(AkinatorContext context)
        {
            _context = context;
        }

        // POST: api/answers
        [HttpPost]
        public IActionResult AddAnswer([FromBody] Answer answer)
        {
            _context.Answers.Add(answer);
            _context.SaveChanges();

            return Ok(new { message = "Ответ сохранён", id = answer.Id });
        }

        // GET: api/answers
        [HttpGet]
        public IActionResult GetAllAnswers()
        {
            return Ok(_context.Answers.ToList());
        }
    }
}

