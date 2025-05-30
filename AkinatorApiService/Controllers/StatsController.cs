using Microsoft.AspNetCore.Mvc;
using AkinatorWeb.Services;
using AkinatorStats;

namespace AkinatorWeb.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StatsController : ControllerBase
    {
        public StatsController()
        {
        }

        [HttpGet("users-count")]
        public async Task<IActionResult> GetUsersCount()
        {
            try
            {
                var count = Stats.getUserCount();
                return Ok(new { userCount = count });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка получения количества пользователей: {ex.Message}");
                return Ok(new { userCount = 0 });
            }
        }

        [HttpGet("sessions-count")]
        public async Task<IActionResult> GetSessionsCount()
        {
            try
            {
                var count = Stats.getSessionCount();
                return Ok(new { sessionCount = count });
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Ошибка получения количества сессий: {ex.Message}");
                return Ok(new { sessionCount = 0 });
            }
        }
    }
} 