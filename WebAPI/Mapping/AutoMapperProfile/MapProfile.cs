using AutoMapper;
using DtoLayer.Dtos.CarrierConfiguratioDtos;
using DtoLayer.Dtos.CarrierConfigurationDtos;
using DtoLayer.Dtos.CarrierDtos;
using DtoLayer.Dtos.OrderDtos;
using EntityLayer.Concrete;

namespace WebAPI.Mapping.AutoMapperProfile
{
    public class MapProfile:Profile
    {
        public MapProfile()
        {
            CreateMap<CreateCarrierDto, Carrier>().ReverseMap();
            CreateMap<UpdateCarrierDto, Carrier>().ReverseMap();  

            CreateMap<CreateCarrierConfigurationDto, CarrierConfiguration>().ReverseMap();
            CreateMap<UpdateCarrierConfigurationDto, CarrierConfiguration>().ReverseMap();

            CreateMap<CreateOrderDto, Order>().ReverseMap();
            CreateMap<UpdateOrderDto , Order >().ReverseMap();
        }
    }
}
