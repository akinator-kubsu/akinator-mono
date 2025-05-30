using AkinatorWeb.DTOs;

namespace AkinatorWeb.Models
{
    public class StatsViewModel
    {
        public int TotalGames { get; set; }
        public List<SessionDto> RecentSessions { get; set; } = new();
    }
} 