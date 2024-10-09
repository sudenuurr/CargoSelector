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
            var values = await _carrierService.TGetAllAsync(); // Asenkron olarak kargo firmalarını al
            return Ok(values);
        }

        // Yeni kargo firması oluşturma
        [HttpPost]
        public async Task<IActionResult> CreateCarrier(CreateCarrierDto createCarrierDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState); // Model doğrulama hatası durumunda

            var carrier = _mapper.Map<Carrier>(createCarrierDto); // DTO'dan entity'ye dönüşüm
            await _carrierService.TInsertAsync(carrier); // Asenkron olarak kargo firmasını ekle

            return Ok("Kargo başarıyla oluşturuldu.");
        }

        // Kargo silme
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCarrier(int id)
        {
            var carrier = await _carrierService.TGetByIdAsync(id); // Asenkron olarak kargo firmasını bul
            if (carrier == null)
                return NotFound($"ID'si {id} olan kargo bulunamadı."); // Kargo yoksa hata mesajı döndür

            await _carrierService.TDeleteAsync(id); // Asenkron olarak kargo firmasını sil
            return Ok($"{id} ID'li kargo başarıyla silindi.");
        }

        // Kargo güncelleme
        [HttpPut]
        public async Task<IActionResult> UpdateCarrier( UpdateCarrierDto updateCarrierDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState); // Model doğrulama hatası durumunda

            var existingCarrier = await _carrierService.TGetByIdAsync(updateCarrierDto.CarrierId); // Asenkron olarak mevcut kargo firmasını bul
            if (existingCarrier == null)
                return NotFound($"ID'si {updateCarrierDto.CarrierId} olan kargo bulunamadı."); // Kargo yoksa hata mesajı döndür

            var carrier = _mapper.Map(updateCarrierDto, existingCarrier); // DTO'dan mevcut entity'ye dönüşüm
            await _carrierService.TUpdateAsync(carrier); // Asenkron olarak kargo firmasını güncelle

            return Ok("Kargo başarıyla güncellendi.");
        }
    }
}
