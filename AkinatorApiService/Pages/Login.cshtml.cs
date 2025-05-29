using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using AkinatorWeb.Services;
using AkinatorWeb.DTOs;

namespace AkinatorWeb.Pages
{
    public class LoginModel : PageModel
    {
        private readonly IUserService _userService;

        public LoginModel(IUserService userService)
        {
            _userService = userService;
        }

        [BindProperty]
        public string Username { get; set; } = string.Empty;

        public string Message { get; set; } = string.Empty;

        public async Task<IActionResult> OnPostAsync()
        {
            if (string.IsNullOrWhiteSpace(Username))
            {
                Message = "Нельзя оставить поле пустым!";
                return Page();
            }

            var user = await _userService.GetByUsernameAsync(Username);

            if (user == null)
            {
                var createUserDto = new CreateUserDto
                {
                    Username = Username,
                    PasswordHash = "none"
                };

                user = await _userService.CreateAsync(createUserDto);
                if (user == null)
                {
                    Message = "Ошибка при создании пользователя.";
                    return Page();
                }
            }

            HttpContext.Session.SetInt32("UserId", user.Id);
            HttpContext.Session.SetString("Username", user.Username);
            return RedirectToPage("/Home");
        }
    }
}
