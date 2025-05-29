using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net.Http;
using System.Text.Json;

namespace AkinatorWeb.Pages
{
    public class StatsModel : PageModel
    {
        private readonly IHttpClientFactory _clientFactory;

        public int UserCount { get; set; }
        public int SessionCount { get; set; }

        public StatsModel(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
        }

        public async Task OnGetAsync()
        {
            var client = _clientFactory.CreateClient();

            // Получение количества пользователей
            var usersResponse = await client.GetAsync("https://localhost:7025/api/stats/users-count");
            if (usersResponse.IsSuccessStatusCode)
            {
                var json = await usersResponse.Content.ReadAsStringAsync();
                var doc = JsonDocument.Parse(json);
                UserCount = doc.RootElement.GetProperty("userCount").GetInt32();
            }

            // Получение количества сессий
            var sessionsResponse = await client.GetAsync("https://localhost:7025/api/stats/sessions-count");
            if (sessionsResponse.IsSuccessStatusCode)
            {
                var json = await sessionsResponse.Content.ReadAsStringAsync();
                var doc = JsonDocument.Parse(json);
                SessionCount = doc.RootElement.GetProperty("sessionCount").GetInt32();
            }
        }
    }
}
