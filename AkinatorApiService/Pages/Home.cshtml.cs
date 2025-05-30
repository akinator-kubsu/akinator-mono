using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using AkinatorWeb.Services;
using AkinatorWeb.DTOs;

namespace AkinatorWeb.Pages
{
    public class HomeModel : PageModel
    {
        private readonly IUserService _userService;
        private readonly ISessionService _sessionService;

        public string Username { get; set; } = string.Empty;
        public List<SessionDto> PreviousSessions { get; set; } = new();

        public HomeModel(IUserService userService, ISessionService sessionService)
        {
            _userService = userService;
            _sessionService = sessionService;
        }

        public async Task<IActionResult> OnGetAsync()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null)
                return RedirectToPage("/Login");

            var user = await _userService.GetByIdAsync(userId.Value);
            if (user == null)
                return RedirectToPage("/Login");

            Username = user.Username;
            PreviousSessions = (await _sessionService.GetByUserIdAsync(userId.Value)).ToList();

            return Page();
        }
    }
}
