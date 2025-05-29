using Microsoft.Data.Sqlite;
using AkinatorWeb.Models;
using AkinatorWeb.DTOs;
using AutoMapper;

namespace AkinatorWeb.Services
{
    public interface IUserService
    {
        Task<UserDto?> GetByIdAsync(int id);
        Task<UserDto?> GetByUsernameAsync(string username);
        Task<IEnumerable<UserDto>> GetAllAsync();
        Task<UserDto> CreateAsync(CreateUserDto createUserDto);
        Task<UserDto?> UpdateAsync(int id, UpdateUserDto updateUserDto);
        Task<bool> DeleteAsync(int id);
    }

    public class UserService : IUserService
    {
        private readonly IDatabaseService _databaseService;
        private readonly IMapper _mapper;

        public UserService(IDatabaseService databaseService, IMapper mapper)
        {
            _databaseService = databaseService;
            _mapper = mapper;
        }

        public async Task<UserDto?> GetByIdAsync(int id)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT Id, Username, PasswordHash, CreatedAt, LastLoginAt FROM Users WHERE Id = @Id";
            cmd.Parameters.AddWithValue("@Id", id);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                var user = new User
                {
                    Id = reader.GetInt32(0),
                    Username = reader.GetString(1),
                    PasswordHash = reader.GetString(2),
                    CreatedAt = reader.GetDateTime(3),
                    LastLoginAt = reader.IsDBNull(4) ? null : reader.GetDateTime(4)
                };
                return _mapper.Map<UserDto>(user);
            }
            return null;
        }

        public async Task<UserDto?> GetByUsernameAsync(string username)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT Id, Username, PasswordHash, CreatedAt, LastLoginAt FROM Users WHERE Username = @Username";
            cmd.Parameters.AddWithValue("@Username", username);

            using var reader = await cmd.ExecuteReaderAsync();
            if (await reader.ReadAsync())
            {
                var user = new User
                {
                    Id = reader.GetInt32(0),
                    Username = reader.GetString(1),
                    PasswordHash = reader.GetString(2),
                    CreatedAt = reader.GetDateTime(3),
                    LastLoginAt = reader.IsDBNull(4) ? null : reader.GetDateTime(4)
                };
                return _mapper.Map<UserDto>(user);
            }
            return null;
        }

        public async Task<IEnumerable<UserDto>> GetAllAsync()
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            using var cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT Id, Username, PasswordHash, CreatedAt, LastLoginAt FROM Users";
            using var reader = await cmd.ExecuteReaderAsync();

            var users = new List<User>();
            while (await reader.ReadAsync())
            {
                users.Add(new User
                {
                    Id = reader.GetInt32(0),
                    Username = reader.GetString(1),
                    PasswordHash = reader.GetString(2),
                    CreatedAt = reader.GetDateTime(3),
                    LastLoginAt = reader.IsDBNull(4) ? null : reader.GetDateTime(4)
                });
            }
            return _mapper.Map<IEnumerable<UserDto>>(users);
        }

        public async Task<UserDto> CreateAsync(CreateUserDto createUserDto)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            var command = conn.CreateCommand();
            command.CommandText = @"
                INSERT INTO Users (Username, PasswordHash, CreatedAt)
                VALUES (@Username, @PasswordHash, @CreatedAt);
                SELECT last_insert_rowid();";

            command.Parameters.AddWithValue("@Username", createUserDto.Username);
            command.Parameters.AddWithValue("@PasswordHash", createUserDto.PasswordHash);
            command.Parameters.AddWithValue("@CreatedAt", DateTime.UtcNow);

            var userId = Convert.ToInt32(await command.ExecuteScalarAsync());

            return new UserDto
            {
                Id = userId,
                Username = createUserDto.Username,
                CreatedAt = DateTime.UtcNow
            };
        }

        public async Task<UserDto?> UpdateAsync(int id, UpdateUserDto updateUserDto)
        {
            using var conn = _databaseService.GetConnection();
            await conn.OpenAsync();

            var updates = new List<string>();
            var parameters = new Dictionary<string, object> { { "@Id", id } };

            if (updateUserDto.Username != null)
            {
                updates.Add("Username = @Username");
                parameters["@Username"] = updateUserDto.Username;
            }

            if (updateUserDto.PasswordHash != null)
            {
                updates.Add("PasswordHash = @PasswordHash");
                parameters["@PasswordHash"] = updateUserDto.PasswordHash;
            }

            if (!updates.Any())
                return await GetByIdAsync(id);

            var sql = $"UPDATE Users SET {string.Join(", ", updates)} WHERE Id = @Id";
            using var cmd = conn.CreateCommand();
            cmd.CommandText = sql;

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

            using var cmd = conn.CreateCommand();
            cmd.CommandText = "DELETE FROM Users WHERE Id = @Id";
            cmd.Parameters.AddWithValue("@Id", id);

            return await cmd.ExecuteNonQueryAsync() > 0;
        }
    }
} 