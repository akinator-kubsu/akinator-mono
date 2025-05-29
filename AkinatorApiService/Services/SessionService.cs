using Microsoft.Data.Sqlite;
using AkinatorWeb.Models;
using AkinatorWeb.DTOs;
using AutoMapper;

namespace AkinatorWeb.Services
{
    public interface ISessionService
    {
        Task<SessionDto?> GetByIdAsync(int id);
        Task<IEnumerable<SessionDto>> GetByUserIdAsync(int userId);
        Task<IEnumerable<SessionDto>> GetAllAsync();
        Task<SessionDto> CreateAsync(CreateSessionDto createSessionDto);
        Task<SessionDto?> UpdateAsync(int id, UpdateSessionDto updateSessionDto);
        Task<bool> DeleteAsync(int id);
        Task<int> GetSessionsCountAsync();
    }

    public class SessionService : ISessionService
    {
        private readonly IDatabaseService _databaseService;
        private readonly IMapper _mapper;

        public SessionService(IDatabaseService databaseService, IMapper mapper)
        {
            _databaseService = databaseService;
            _mapper = mapper;
        }

        public async Task<SessionDto?> GetByIdAsync(int id)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = new SqliteCommand(@"
                SELECT s.*, u.Username 
                FROM Sessions s
                JOIN Users u ON s.UserId = u.Id
                WHERE s.Id = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", id);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                var session = new Session
                {
                    Id = reader.GetInt32(0),
                    UserId = reader.GetInt32(1),
                    CharacterName = reader.GetString(2),
                    StartedAt = reader.GetDateTime(3),
                    EndedAt = reader.IsDBNull(4) ? null : reader.GetDateTime(4),
                    User = new User { Username = reader.GetString(5) }
                };
                return _mapper.Map<SessionDto>(session);
            }
            return null;
        }

        public async Task<IEnumerable<SessionDto>> GetByUserIdAsync(int userId)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = new SqliteCommand(@"
                SELECT s.*, u.Username 
                FROM Sessions s
                JOIN Users u ON s.UserId = u.Id
                WHERE s.UserId = @UserId
                ORDER BY s.StartedAt DESC", conn);
            cmd.Parameters.AddWithValue("@UserId", userId);

            using var reader = await cmd.ExecuteReaderAsync();
            var sessions = new List<Session>();
            while (await reader.ReadAsync())
            {
                sessions.Add(new Session
                {
                    Id = reader.GetInt32(0),
                    UserId = reader.GetInt32(1),
                    CharacterName = reader.GetString(2),
                    StartedAt = reader.GetDateTime(3),
                    EndedAt = reader.IsDBNull(4) ? null : reader.GetDateTime(4),
                    User = new User { Username = reader.GetString(5) }
                });
            }
            return _mapper.Map<IEnumerable<SessionDto>>(sessions);
        }

        public async Task<IEnumerable<SessionDto>> GetAllAsync()
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = new SqliteCommand(@"
                SELECT s.*, u.Username 
                FROM Sessions s
                JOIN Users u ON s.UserId = u.Id
                ORDER BY s.StartedAt DESC", conn);

            using var reader = await cmd.ExecuteReaderAsync();
            var sessions = new List<Session>();
            while (await reader.ReadAsync())
            {
                sessions.Add(new Session
                {
                    Id = reader.GetInt32(0),
                    UserId = reader.GetInt32(1),
                    CharacterName = reader.GetString(2),
                    StartedAt = reader.GetDateTime(3),
                    EndedAt = reader.IsDBNull(4) ? null : reader.GetDateTime(4),
                    User = new User { Username = reader.GetString(5) }
                });
            }
            return _mapper.Map<IEnumerable<SessionDto>>(sessions);
        }

        public async Task<SessionDto> CreateAsync(CreateSessionDto createSessionDto)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = new SqliteCommand(@"
                INSERT INTO Sessions (UserId, CharacterName, StartedAt)
                VALUES (@UserId, @CharacterName, @StartedAt);
                SELECT last_insert_rowid();", conn);

            var now = DateTime.UtcNow;
            cmd.Parameters.AddWithValue("@UserId", createSessionDto.UserId);
            cmd.Parameters.AddWithValue("@CharacterName", createSessionDto.CharacterName);
            cmd.Parameters.AddWithValue("@StartedAt", now);

            var id = Convert.ToInt32(await cmd.ExecuteScalarAsync());
            return await GetByIdAsync(id) ?? throw new Exception("Failed to create session");
        }

        public async Task<SessionDto?> UpdateAsync(int id, UpdateSessionDto updateSessionDto)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            var updates = new List<string>();
            var parameters = new Dictionary<string, object> { { "@Id", id } };

            if (updateSessionDto.CharacterName != null)
            {
                updates.Add("CharacterName = @CharacterName");
                parameters["@CharacterName"] = updateSessionDto.CharacterName;
            }

            if (updateSessionDto.EndedAt != null)
            {
                updates.Add("EndedAt = @EndedAt");
                parameters["@EndedAt"] = updateSessionDto.EndedAt;
            }

            if (!updates.Any())
                return await GetByIdAsync(id);

            var sql = $"UPDATE Sessions SET {string.Join(", ", updates)} WHERE Id = @Id";
            using var cmd = new SqliteCommand(sql, conn);

            foreach (var param in parameters)
            {
                cmd.Parameters.AddWithValue(param.Key, param.Value);
            }

            await cmd.ExecuteNonQueryAsync();
            return await GetByIdAsync(id);
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = new SqliteCommand("DELETE FROM Sessions WHERE Id = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", id);

            return await cmd.ExecuteNonQueryAsync() > 0;
        }

        public async Task<int> GetSessionsCountAsync()
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = new SqliteCommand("SELECT COUNT(*) FROM Sessions", conn);
            return Convert.ToInt32(await cmd.ExecuteScalarAsync());
        }
    }
} 