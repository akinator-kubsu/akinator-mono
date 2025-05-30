namespace AkinatorWeb.DTOs
{
    public class SessionDto
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string CharacterName { get; set; } = string.Empty;
        public DateTime StartedAt { get; set; }
        public DateTime? EndedAt { get; set; }
        public string Username { get; set; } = string.Empty;
    }

    public class CreateSessionDto
    {
        public int UserId { get; set; }
        public string CharacterName { get; set; } = string.Empty;
    }

    public class UpdateSessionDto
    {
        public string? CharacterName { get; set; }
        public DateTime? EndedAt { get; set; }
    }
} 