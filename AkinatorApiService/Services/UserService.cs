using AkinatorDbLib;
using AkinatorWeb.Models;
using AkinatorWeb.DTOs;
using AutoMapper;
using System.Security.Cryptography;
using System.Text;
using Microsoft.FSharp.Core;

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
        bool Register(AkinatorWeb.Models.User user);
        string? Login(LoginModel credentials);
        
        // Новые методы для Razor Pages
        Task<bool> RegisterUserAsync(RegisterRequest request);
        Task<LoginResponse?> LoginUserAsync(LoginRequest request);
        Task<IEnumerable<UserDto>> GetAllUsersAsync();
    }

    public class UserService : IUserService
    {
        private readonly IMapper _mapper;

        public UserService(IMapper mapper)
        {
            _mapper = mapper;
        }

        public async Task<UserDto?> GetByIdAsync(int id)
        {
            var userOption = UserRepositoryWrapper.GetUserById(id);
            if (FSharpOption<AkinatorDbLib.User>.get_IsNone(userOption))
                return null;
            
            var user = userOption.Value;
            return _mapper.Map<UserDto>(user);
        }

        public async Task<UserDto?> GetByUsernameAsync(string username)
        {
            var userOption = UserRepositoryWrapper.GetUserByUsername(username);
            if (FSharpOption<AkinatorDbLib.User>.get_IsNone(userOption))
                return null;
            
            var user = userOption.Value;
            return _mapper.Map<UserDto>(user);
        }

        public async Task<IEnumerable<UserDto>> GetAllAsync()
        {
            var users = UserRepositoryWrapper.GetAllUsers();
            return _mapper.Map<IEnumerable<UserDto>>(users);
        }

        public async Task<UserDto> CreateAsync(CreateUserDto createUserDto)
        {
            var userOption = UserRepositoryWrapper.CreateUser(createUserDto.Username, createUserDto.PasswordHash, DateTime.UtcNow);
            if (FSharpOption<AkinatorDbLib.User>.get_IsNone(userOption))
                throw new InvalidOperationException("Failed to create user");
            
            var user = userOption.Value;
            return _mapper.Map<UserDto>(user);
        }

        public async Task<UserDto?> UpdateAsync(int id, UpdateUserDto updateUserDto)
        {
            var userOption = UserRepositoryWrapper.UpdateUser(id, updateUserDto.Username ?? "", updateUserDto.PasswordHash ?? "");
            if (FSharpOption<AkinatorDbLib.User>.get_IsNone(userOption))
                return null;
            
            var user = userOption.Value;
            return _mapper.Map<UserDto>(user);
        }

        public async Task<bool> DeleteAsync(int id)
        {
            return UserRepositoryWrapper.DeleteUser(id);
        }

        public bool Register(AkinatorWeb.Models.User user)
        {
            return UserRepositoryWrapper.RegisterUser(user.Username, user.Password);
        }

        public string? Login(LoginModel credentials)
        {
            var result = UserRepositoryWrapper.LoginUser(credentials.Username, credentials.Password);
            return FSharpOption<string>.get_IsNone(result) ? null : result.Value;
        }

        // Новые методы для Razor Pages
        public async Task<bool> RegisterUserAsync(RegisterRequest request)
        {
            return UserRepositoryWrapper.RegisterUser(request.Username, request.Password);
        }

        public async Task<LoginResponse?> LoginUserAsync(LoginRequest request)
        {
            var result = UserRepositoryWrapper.LoginUser(request.Username, request.Password);
            if (FSharpOption<string>.get_IsNone(result))
                return null;
            
            return new LoginResponse 
            { 
                Token = result.Value,
                Message = "Login successful" 
            };
        }

        public async Task<IEnumerable<UserDto>> GetAllUsersAsync()
        {
            return await GetAllAsync();
        }
    }
} 