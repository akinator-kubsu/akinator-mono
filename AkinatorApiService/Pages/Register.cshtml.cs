using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using AkinatorWeb.Services;
using AkinatorWeb.DTOs;
using System.ComponentModel.DataAnnotations;

namespace AkinatorWeb.Pages
{
    public class RegisterModel : PageModel
    {
        private readonly IUserService _userService;
        private readonly ILogger<RegisterModel> _logger;

        public RegisterModel(IUserService userService, ILogger<RegisterModel> logger)
        {
            _userService = userService;
            _logger = logger;
        }

        [BindProperty]
        [Required(ErrorMessage = "Имя пользователя обязательно")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Имя пользователя должно быть от 3 до 50 символов")]
        public string Username { get; set; } = string.Empty;

        [BindProperty]
        [Required(ErrorMessage = "Пароль обязателен")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Пароль должен быть не менее 6 символов")]
        [DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;

        [BindProperty]
        [Required(ErrorMessage = "Подтверждение пароля обязательно")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Пароли не совпадают")]
        public string ConfirmPassword { get; set; } = string.Empty;

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
                var registerRequest = new RegisterRequest
                {
                    Username = Username,
                    Password = Password
                };

                var success = await _userService.RegisterUserAsync(registerRequest);

                if (success)
                {
                    TempData["SuccessMessage"] = "Регистрация прошла успешно! Теперь вы можете войти.";
                    return RedirectToPage("/Login");
                }
                else
                {
                    ErrorMessage = "Пользователь с таким именем уже существует";
                    return Page();
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Ошибка при регистрации пользователя {Username}", Username);
                ErrorMessage = "Произошла ошибка при регистрации. Попробуйте снова.";
                return Page();
            }
        }
    }
}
