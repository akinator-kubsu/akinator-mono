namespace AkinatorWeb.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string PasswordHash { get; set; } = string.Empty;
        public DateTime CreatedAt { get; set; }
        public DateTime? LastLoginAt { get; set; }
        public string Password { get; set; } = string.Empty; // [NotMapped] для EF, если потребуется
    }
} 