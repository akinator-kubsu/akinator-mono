using Microsoft.AspNetCore.Mvc;
using AkinatorWeb.Models;
using AkinatorWeb.Services;

namespace AkinatorWeb.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("register")]
        public IActionResult Register([FromBody] User user)
        {
            var result = _userService.Register(user);
            if (result)
                return Ok();
            return BadRequest("User already exists");
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginModel credentials)
        {
            var token = _userService.Login(credentials);
            if (token != null)
                return Ok(new { token });
            return Unauthorized();
        }
    }
} 