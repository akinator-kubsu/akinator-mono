using Microsoft.AspNetCore.Mvc;
using AkinatorWeb.Models;
using AkinatorWeb.Services;
using AkinatorWeb.DTOs;

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

        /// <summary>
        /// Регистрация нового пользователя
        /// </summary>
        [HttpPost("register")]
        public IActionResult Register([FromBody] User user)
        {
            if (string.IsNullOrEmpty(user.Username) || string.IsNullOrEmpty(user.Password))
            {
                return BadRequest("Username and password are required");
            }

            var result = _userService.Register(user);
            if (result)
                return Ok(new { message = "User registered successfully" });
            return BadRequest("User already exists");
        }

        /// <summary>
        /// Авторизация пользователя
        /// </summary>
        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginModel credentials)
        {
            if (string.IsNullOrEmpty(credentials.Username) || string.IsNullOrEmpty(credentials.Password))
            {
                return BadRequest("Username and password are required");
            }

            var token = _userService.Login(credentials);
            if (token != null)
                return Ok(new { token, message = "Login successful" });
            return Unauthorized(new { message = "Invalid credentials" });
        }

        /// <summary>
        /// Получить пользователя по ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var user = await _userService.GetByIdAsync(id);
            if (user == null)
                return NotFound(new { message = "User not found" });
            return Ok(user);
        }

        /// <summary>
        /// Получить пользователя по имени
        /// </summary>
        [HttpGet("username/{username}")]
        public async Task<IActionResult> GetByUsername(string username)
        {
            var user = await _userService.GetByUsernameAsync(username);
            if (user == null)
                return NotFound(new { message = "User not found" });
            return Ok(user);
        }

        /// <summary>
        /// Получить всех пользователей
        /// </summary>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var users = await _userService.GetAllAsync();
            return Ok(users);
        }

        /// <summary>
        /// Создать нового пользователя (администраторская функция)
        /// </summary>
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateUserDto createUserDto)
        {
            if (string.IsNullOrEmpty(createUserDto.Username) || string.IsNullOrEmpty(createUserDto.PasswordHash))
            {
                return BadRequest("Username and password hash are required");
            }

            try
            {
                var user = await _userService.CreateAsync(createUserDto);
                return CreatedAtAction(nameof(GetById), new { id = user.Id }, user);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        /// <summary>
        /// Обновить пользователя
        /// </summary>
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateUserDto updateUserDto)
        {
            if (string.IsNullOrEmpty(updateUserDto.Username) || string.IsNullOrEmpty(updateUserDto.PasswordHash))
            {
                return BadRequest("Username and password hash are required");
            }

            var user = await _userService.UpdateAsync(id, updateUserDto);
            if (user == null)
                return NotFound(new { message = "User not found" });
            return Ok(user);
        }

        /// <summary>
        /// Удалить пользователя
        /// </summary>
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var result = await _userService.DeleteAsync(id);
            if (!result)
                return NotFound(new { message = "User not found" });
            return Ok(new { message = "User deleted successfully" });
        }
    }
} 