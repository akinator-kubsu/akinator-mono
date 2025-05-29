namespace AkinatorWeb.Models
{
    public class Session
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string CharacterName { get; set; } = string.Empty;
        public DateTime StartedAt { get; set; }
        public DateTime? EndedAt { get; set; }
        public User? User { get; set; }
    }
} 