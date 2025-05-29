using Microsoft.Data.Sqlite;
using Microsoft.Extensions.Configuration;

namespace AkinatorWeb.Services
{
    public interface IDatabaseService
    {
        SqliteConnection GetConnection();
    }

    public class DatabaseService : IDatabaseService
    {
        private readonly string _connectionString;

        public DatabaseService(IConfiguration configuration)
        {
            var dbPath = configuration["Database:Path"] ?? "akinator.db";
            _connectionString = $"Data Source={dbPath};";
            InitializeDatabase();
        }

        public SqliteConnection GetConnection()
        {
            return new SqliteConnection(_connectionString);
        }

        private void InitializeDatabase()
        {
            using var conn = GetConnection();
            conn.Open();

            using var cmd = conn.CreateCommand();
            cmd.CommandText = @"
                CREATE TABLE IF NOT EXISTS Users (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    Username TEXT NOT NULL UNIQUE,
                    PasswordHash TEXT NOT NULL,
                    CreatedAt DATETIME NOT NULL,
                    LastLoginAt DATETIME
                );

                CREATE TABLE IF NOT EXISTS Sessions (
                    Id INTEGER PRIMARY KEY AUTOINCREMENT,
                    UserId INTEGER NOT NULL,
                    CharacterName TEXT NOT NULL,
                    StartedAt DATETIME NOT NULL,
                    EndedAt DATETIME,
                    FOREIGN KEY (UserId) REFERENCES Users(Id)
                );";

            cmd.ExecuteNonQuery();
        }
    }
} 