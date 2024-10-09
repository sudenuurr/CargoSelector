using AutoMapper;
using BusinessLayer.Abstract;
using DtoLayer.Dtos.CarrierConfiguratioDtos;
using DtoLayer.Dtos.CarrierConfigurationDtos;
using DtoLayer.Dtos.CarrierDtos;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarrierConfigurationController : ControllerBase
    {
        private readonly ICarrierConfigurationService _carrierConfigurationService;
        private readonly IMapper _mapper;

        public CarrierConfigurationController(ICarrierConfigurationService carrierConfigurationService, IMapper mapper)
        {
            _carrierConfigurationService = carrierConfigurationService;
            _mapper = mapper;
        }

        // Tüm kargo firma konfigürasyonlarını listeleme
        [HttpGet]
        public async Task<IActionResult> CarrierConfigurationList()
        {
            var values = await _carrierConfigurationService.TGetAllAsync(); // Asenkron olarak kargo konfigürasyonlarını al
            return Ok(values);
        }

        // Yeni kargo firma konfigürasyonu oluşturma
        [HttpPost]
        public async Task<IActionResult> CreateCarrierConfiguration(CreateCarrierConfigurationDto createCarrierConfigurationDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState); // Model doğrulama hatası durumunda

            var carrierConfiguration = _mapper.Map<CarrierConfiguration>(createCarrierConfigurationDto); // DTO'dan entity'ye dönüşüm
            await _carrierConfigurationService.TInsertAsync(carrierConfiguration); // Asenkron olarak kargo konfigürasyonunu ekle

            return Ok("Kargo firma konfigürasyonu başarıyla oluşturuldu.");
        }

        // Kargo firma konfigürasyonunu silme
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCarrierConfiguration(int id)
        {
            var existingConfig = await _carrierConfigurationService.TGetByIdAsync(id); // Asenkron olarak kargo konfigürasyonunu bul
            if (existingConfig == null)
                return NotFound($"ID'si {id} olan kargo firma konfigürasyonu bulunamadı."); // Kargo konfigürasyonu yoksa hata mesajı döndür

            await _carrierConfigurationService.TDeleteAsync(id); // Asenkron olarak kargo konfigürasyonunu sil
            return Ok($"{id} ID'li kargo firma konfigürasyonu başarıyla silindi.");
        }

        // Kargo firma konfigürasyonunu güncelleme
        [HttpPut]
        public async Task<IActionResult> UpdateCarrierConfiguration(UpdateCarrierConfigurationDto updateCarrierConfigurationDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState); // Model doğrulama hatası durumunda

            var existingConfig = await _carrierConfigurationService.TGetByIdAsync(updateCarrierConfigurationDto.CarrierConfigurationId); // Asenkron olarak mevcut kargo konfigürasyonunu bul
            if (existingConfig == null)
                return NotFound($"ID'si {updateCarrierConfigurationDto.CarrierConfigurationId} olan kargo firma konfigürasyonu bulunamadı."); // Kargo konfigürasyonu yoksa hata mesajı döndür

            var carrierConfiguration = _mapper.Map(updateCarrierConfigurationDto, existingConfig); // DTO'dan mevcut entity'ye dönüşüm
            await _carrierConfigurationService.TUpdateAsync(carrierConfiguration); // Asenkron olarak kargo konfigürasyonunu güncelle

            return Ok("Kargo firma konfigürasyonu başarıyla güncellendi.");
        }
    }
}
