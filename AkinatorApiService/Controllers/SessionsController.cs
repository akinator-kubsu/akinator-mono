using Microsoft.AspNetCore.Mvc;
using AkinatorWeb.Services;
using AkinatorWeb.DTOs;

namespace AkinatorWeb.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SessionsController : ControllerBase
    {
        private readonly ISessionService _sessionService;

        public SessionsController(ISessionService sessionService)
        {
            _sessionService = sessionService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateSession([FromBody] CreateSessionDto createSessionDto)
        {
            try
            {
                var session = await _sessionService.CreateAsync(createSessionDto);
                return Ok(session);
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet]
        public async Task<IActionResult> GetAllSessions()
        {
            try
            {
                var sessions = await _sessionService.GetAllAsync();
                return Ok(sessions);
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetUserSessions(int userId)
        {
            try
            {
                var sessions = await _sessionService.GetByUserIdAsync(userId);
                return Ok(sessions);
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }
    }
} 