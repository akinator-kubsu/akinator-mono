using Xunit;
using Microsoft.AspNetCore.Mvc;
using AkinatorWeb.Controllers;
using AkinatorWeb.Models;
using AkinatorWeb.Services;
using Moq;
using AutoMapper;

namespace AkinatorWeb.Tests
{
    public class UserControllerTests
    {
        private readonly UserController _controller;
        private readonly IUserService _userService;

        public UserControllerTests()
        {
            var dbStub = new Mock<IDatabaseService>().Object;
            var mapperStub = new Mock<IMapper>().Object;
            _userService = new UserService(dbStub, mapperStub);
            _controller = new UserController(_userService);
        }

        [Fact]
        public void Register_ValidUser_ReturnsOkResult()
        {
            var user = new User { Username = "test", Password = "test123" };
            var result = _controller.Register(user);
            Assert.IsType<OkResult>(result);
        }

        [Fact]
        public void Login_ValidCredentials_ReturnsToken()
        {
            var credentials = new LoginModel { Username = "test", Password = "test123" };
            var result = _controller.Login(credentials);
            Assert.IsType<OkObjectResult>(result);
        }
    }
} 