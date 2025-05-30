using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AkinatorApi.Data;
using AkinatorApi.Models;
using System.Linq;
using System.Collections.Generic;

namespace AkinatorApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly AkinatorContext _context;

        public UsersController(AkinatorContext context)
        {
            _context = context;
        }

        // POST: api/users/register
        [HttpPost("register")]
        public IActionResult Register([FromBody] User user)
        {
            // Проверка: имя уже занято?
            if (_context.Users.Any(u => u.Username == user.Username))
            {
                return Conflict("Такой пользователь уже существует.");
            }

            // Тут можно добавить хэш пароля (упрощённо пока оставим так)
            _context.Users.Add(user);
            _context.SaveChanges();

            return Ok(new { message = "Пользователь создан", id = user.Id });
        }

        // GET: api/users
        [HttpGet]
        public IActionResult GetAllUsers()
        {
            var users = _context.Users.ToList();
            return Ok(users);
        }
    }
}
