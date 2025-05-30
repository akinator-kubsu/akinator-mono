using Npgsql;
using Microsoft.Extensions.Configuration;

namespace AkinatorWeb.Services
{
    public interface IDatabaseService
    {
        NpgsqlConnection GetConnection();
    }

    public class DatabaseService : IDatabaseService
    {
        private readonly string _connectionString;

        public DatabaseService(IConfiguration configuration)
        {
            _connectionString = Environment.GetEnvironmentVariable("POSTGRES_CONNECTION_STRING") 
                ?? "Host=localhost;Database=akinator_db;Username=akinator_user;Password=akinator_password";
            InitializeDatabase();
        }

        public NpgsqlConnection GetConnection()
        {
            return new NpgsqlConnection(_connectionString);
        }

        private void InitializeDatabase()
        {
            using var conn = GetConnection();
            conn.Open();

            using var cmd = conn.CreateCommand();
            cmd.CommandText = @"
                CREATE TABLE IF NOT EXISTS users (
                    id SERIAL PRIMARY KEY,
                    username VARCHAR(255) NOT NULL UNIQUE,
                    password_hash VARCHAR(255) NOT NULL,
                    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
                    last_login_at TIMESTAMP
                );

                CREATE TABLE IF NOT EXISTS sessions (
                    id SERIAL PRIMARY KEY,
                    user_id INTEGER NOT NULL,
                    character_name VARCHAR(500) NOT NULL,
                    started_at TIMESTAMP NOT NULL DEFAULT NOW(),
                    ended_at TIMESTAMP,
                    FOREIGN KEY (user_id) REFERENCES users(id)
                );";

            cmd.ExecuteNonQuery();
        }
    }
} 