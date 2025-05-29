using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AkinatorStats;

namespace AkinatorApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StatsController : ControllerBase
    {
        [HttpGet("users-count")]
        public IActionResult GetUserCount()
        {
            var count = Stats.getUserCount();
            return Ok(new { userCount = count });
        }

        [HttpGet("sessions-count")]
        public IActionResult GetSessionCount()
        {
            var count = Stats.getSessionCount();
            return Ok(new { sessionCount = count });
        }
    }
}
