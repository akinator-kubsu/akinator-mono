using AutoMapper;
using AkinatorWeb.Models;
using AkinatorWeb.DTOs;

namespace AkinatorWeb.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<User, UserDto>();
            CreateMap<CreateUserDto, User>();
            CreateMap<UpdateUserDto, User>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            CreateMap<Session, SessionDto>()
                .ForMember(dest => dest.Username, opt => opt.MapFrom(src => src.User!.Username));
            CreateMap<CreateSessionDto, Session>();
            CreateMap<UpdateSessionDto, Session>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));
        }
    }
} 