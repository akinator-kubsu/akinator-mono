using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AkinatorApi.Models;
using AkinatorApi.Data;

namespace AkinatorApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SessionsController : ControllerBase
    {
        private readonly AkinatorContext _context;

        public SessionsController(AkinatorContext context)
        {
            _context = context;
        }

        // POST: api/sessions/start
        [HttpPost("start")]
        public IActionResult StartSession([FromBody] Session session)
        {
            _context.Sessions.Add(session);
            _context.SaveChanges();

            return Ok(new { message = "Сессия начата", id = session.Id });
        }

        // GET: api/sessions
        [HttpGet]
        public IActionResult GetAll()
        {
            var sessions = _context.Sessions.ToList();
            return Ok(sessions);
        }

    }
}
