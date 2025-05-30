using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using AkinatorWeb.Controllers;
using AkinatorWeb.Services;

namespace AkinatorWeb.Pages
{
    public class StatsModel : PageModel
    {
        private readonly ILogger<StatsModel> _logger;

        public int UserCount { get; set; }
        public int SessionCount { get; set; }

        public StatsModel(ILogger<StatsModel> logger)
        {
            _logger = logger;
        }

        public async Task OnGetAsync()
        {
            try
            {
                _logger.LogInformation("Получаем статистику через F# библиотеку");

                // Создаем контроллер статистики
                var statsController = new StatsController();

                // Получаем количество пользователей
                var usersResult = await statsController.GetUsersCount();
                if (usersResult is OkObjectResult usersOk && usersOk.Value != null)
                {
                    var usersData = System.Text.Json.JsonSerializer.Serialize(usersOk.Value);
                    _logger.LogInformation("Получили данные пользователей: {Data}", usersData);
                    
                    var usersDoc = System.Text.Json.JsonDocument.Parse(usersData);
                    UserCount = usersDoc.RootElement.GetProperty("userCount").GetInt32();
                    _logger.LogInformation("Количество пользователей: {Count}", UserCount);
                }

                // Получаем количество сессий
                var sessionsResult = await statsController.GetSessionsCount();
                if (sessionsResult is OkObjectResult sessionsOk && sessionsOk.Value != null)
                {
                    var sessionsData = System.Text.Json.JsonSerializer.Serialize(sessionsOk.Value);
                    _logger.LogInformation("Получили данные сессий: {Data}", sessionsData);
                    
                    var sessionsDoc = System.Text.Json.JsonDocument.Parse(sessionsData);
                    SessionCount = sessionsDoc.RootElement.GetProperty("sessionCount").GetInt32();
                    _logger.LogInformation("Количество сессий: {Count}", SessionCount);
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Ошибка при получении статистики");
                UserCount = 0;
                SessionCount = 0;
            }
        }
    }
}
