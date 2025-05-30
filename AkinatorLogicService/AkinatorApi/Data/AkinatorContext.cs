using Microsoft.EntityFrameworkCore;
using AkinatorApi.Models;

namespace AkinatorApi.Data
{
    public class AkinatorContext : DbContext
    {
        public AkinatorContext(DbContextOptions<AkinatorContext> options)
            : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Session> Sessions { get; set; }

        public DbSet<Answer> Answers { get; set; }
        public DbSet<Character> Characters { get; set; }

    }
}