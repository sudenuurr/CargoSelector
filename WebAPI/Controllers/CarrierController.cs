using AutoMapper;
using BusinessLayer.Abstract;
using DtoLayer.Dtos.CarrierDtos;
using DtoLayer.Dtos.OrderDtos;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarrierController : ControllerBase
    {
        private readonly ICarrierService _carrierService;
        private readonly IMapper _mapper;

        public CarrierController(ICarrierService carrierService, IMapper mapper)
        {
            _carrierService = carrierService;
            _mapper = mapper;
        }


        // Tüm kargo firmalarını listeleme
        [HttpGet]
        public async Task<IActionResult> CarrierList()
        {
            var values = await _carrierService.TGetAllAsync(); 
            return Ok(values);
        }

        // Yeni kargo firması oluşturma
        [HttpPost]
        public async Task<IActionResult> CreateCarrier(CreateCarrierDto createCarrierDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState); 

            var carrier = _mapper.Map<Carrier>(createCarrierDto); // DTO'dan entity'ye dönüşüm
            await _carrierService.TInsertAsync(carrier); 

            return Ok("Kargo firması başarıyla oluşturuldu.");
        }

        // Kargo firması silme
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCarrier(int id)
        {
            var carrier = await _carrierService.TGetByIdAsync(id);
            if (carrier == null)
                return NotFound($"ID'si {id} olan kargo firması bulunamadı.");

            await _carrierService.TDeleteAsync(id); 
            return Ok($"{id} ID'li kargo firması başarıyla silindi.");
        }

        // Kargo firması güncelleme
        [HttpPut]
        public async Task<IActionResult> UpdateCarrier( UpdateCarrierDto updateCarrierDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var existingCarrier = await _carrierService.TGetByIdAsync(updateCarrierDto.CarrierId);
            if (existingCarrier == null)
                return NotFound($"ID'si {updateCarrierDto.CarrierId} olan kargo firması bulunamadı."); 

            var carrier = _mapper.Map(updateCarrierDto, existingCarrier); // DTO'dan entity'ye dönüşüm
            await _carrierService.TUpdateAsync(carrier); 

            return Ok("Kargo firması başarıyla güncellendi.");
        }
    }
}
