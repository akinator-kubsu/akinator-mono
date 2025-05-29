using System;

namespace AkinatorApi.Models
{
    public class Character
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public int? AddedByUserId { get; set; } 
        public DateTime AddedAt { get; set; } = DateTime.UtcNow;
    }
}
