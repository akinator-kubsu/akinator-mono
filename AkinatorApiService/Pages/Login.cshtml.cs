using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using AkinatorWeb.Services;
using AkinatorWeb.DTOs;
using System.ComponentModel.DataAnnotations;

namespace AkinatorWeb.Pages
{
    public class LoginModel : PageModel
    {
        private readonly IUserService _userService;
        private readonly ILogger<LoginModel> _logger;

        public LoginModel(IUserService userService, ILogger<LoginModel> logger)
        {
            _userService = userService;
            _logger = logger;
        }

        [BindProperty]
        [Required(ErrorMessage = "Имя пользователя обязательно")]
        public string Username { get; set; } = string.Empty;

        [BindProperty]
        [Required(ErrorMessage = "Пароль обязателен")]
        [DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;

        public string? ErrorMessage { get; set; }

        public void OnGet()
        {
            // Если пользователь уже вошёл, перенаправляем на главную
            var currentUser = HttpContext.Session.GetString("Username");
            if (!string.IsNullOrEmpty(currentUser))
            {
                Response.Redirect("/Home");
            }
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            try
            {
                var loginRequest = new LoginRequest
                {
                    Username = Username,
                    Password = Password
                };

                var result = await _userService.LoginUserAsync(loginRequest);

                if (result != null && !string.IsNullOrEmpty(result.Token))
                {
                    // Успешная авторизация
                    HttpContext.Session.SetString("AuthToken", result.Token);
                    HttpContext.Session.SetString("Username", Username);
                    
                    // Получаем данные пользователя для сохранения ID
                    var user = await _userService.GetByUsernameAsync(Username);
                    if (user != null)
                    {
                        HttpContext.Session.SetInt32("UserId", user.Id);
                    }

                    TempData["SuccessMessage"] = "Добро пожаловать!";
                    return RedirectToPage("/Home");
                }
                else
                {
                    ErrorMessage = "Неверное имя пользователя или пароль";
                    return Page();
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Ошибка при входе пользователя {Username}", Username);
                ErrorMessage = "Произошла ошибка при входе. Попробуйте снова.";
                return Page();
            }
        }
    }
}
