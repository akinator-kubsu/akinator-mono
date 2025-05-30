using System;

namespace AkinatorApi.Models
{
    public class Session
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string? CharacterName { get; set; }
        public DateTime StartedAt { get; set; } = DateTime.UtcNow;
    }
}
