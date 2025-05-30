using System;

namespace AkinatorApi.Models
{
    public class Answer
    {
        public int Id { get; set; }
        public int SessionId { get; set; }
        public int QuestionNumber { get; set; }
        public string AnswerText { get; set; } = "";
        public DateTime AnsweredAt { get; set; } = DateTime.UtcNow;
    }
}
