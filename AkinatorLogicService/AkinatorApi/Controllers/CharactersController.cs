using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AkinatorApi.Models;
using AkinatorApi.Data;

namespace AkinatorApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CharactersController : ControllerBase
    {
        private readonly AkinatorContext _context;

        public CharactersController(AkinatorContext context)
        {
            _context = context;
        }

        // POST: api/characters
        [HttpPost]
        public IActionResult AddCharacter([FromBody] Character character)
        {
            _context.Characters.Add(character);
            _context.SaveChanges();

            return Ok(new { message = "Персонаж добавлен", id = character.Id });
        }

        // GET: api/characters
        [HttpGet]
        public IActionResult GetAllCharacters()
        {
            return Ok(_context.Characters.ToList());
        }
    }
}
