using BusinessLayer.Abstract;
using EntityLayer.Concrete;
using Hangfire;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarrierReportController : ControllerBase
    {
        private readonly ICarrierReportService _carrierReportService;

        public CarrierReportController(ICarrierReportService carrierReportService)
        {
            _carrierReportService = carrierReportService;
        }

        // Raporu manuel olarak tetiklemek için
        [HttpGet("generate-report")]
        public async Task<IActionResult> GenerateReport()
        {
            try
            {
                await _carrierReportService.GenerateCarrierReport();
                return Ok("Rapor başarıyla oluşturuldu.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Bir hata oluştu: {ex.Message}");
            }
        }
    }

}
