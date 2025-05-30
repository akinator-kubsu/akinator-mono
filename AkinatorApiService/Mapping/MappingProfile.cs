using AutoMapper;
using AkinatorWeb.Models;
using AkinatorWeb.DTOs;
using AkinatorDbLib;

namespace AkinatorWeb.Mapping
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // Маппинг для C# User модели (веб-формы)
            CreateMap<AkinatorWeb.Models.User, UserDto>();
            CreateMap<CreateUserDto, AkinatorWeb.Models.User>();
            CreateMap<UpdateUserDto, AkinatorWeb.Models.User>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));

            // Маппинг для F# User типа (база данных)
            CreateMap<AkinatorDbLib.User, UserDto>()
                .ForMember(dest => dest.LastLoginAt, opt => opt.MapFrom(src => 
                    Microsoft.FSharp.Core.FSharpOption<DateTime>.get_IsNone(src.LastLoginAt) 
                        ? (DateTime?)null 
                        : src.LastLoginAt.Value));

            CreateMap<Session, SessionDto>()
                .ForMember(dest => dest.Username, opt => opt.MapFrom(src => src.User!.Username));
            CreateMap<CreateSessionDto, Session>();
            CreateMap<UpdateSessionDto, Session>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => srcMember != null));
        }
    }
} 