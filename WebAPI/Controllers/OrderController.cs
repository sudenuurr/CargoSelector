using AutoMapper;
using BusinessLayer.Abstract;
using DtoLayer.Dtos.OrderDtos;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase

    {
        private readonly IOrderService _orderService;
        private readonly ICarrierConfigurationService _carrierConfigurationService;
        private readonly IMapper _mapper;

        public OrderController(IOrderService orderService, ICarrierConfigurationService carrierConfigurationService, IMapper mapper)
        {
            _orderService = orderService;
            _carrierConfigurationService = carrierConfigurationService;
            _mapper = mapper;
        }



        // Tüm Siparişleri Listeleme
        [HttpGet]
        public async Task<IActionResult> OrderList()
        {
            var orders = await _orderService.TGetAllAsync();
            return Ok(orders);
        }

        // Yeni Sipariş Oluşturma

        public async Task<IActionResult> CreateOrder([FromBody] CreateOrderDto createOrderDto)
        {
            // Model doğrulama kontrolü
            if (!ModelState.IsValid)
                return BadRequest(ModelState); // Hatalı model durumu

            int orderDesi = createOrderDto.OrderDesi; // Sipariş desisi

            // Tüm kargo firmalarını al
            var carriers = await _carrierConfigurationService.TGetAllAsync();
            decimal carrierCost = 0; // Kargo ücreti

            // Kargo firmalarının MinDesi-MaxDesi aralıklarını kontrol et
            foreach (var carrier in carriers)
            {
                // Eğer sipariş desisi kargo firmasının aralığına uyuyorsa
                if (orderDesi >= carrier.CarrierConfiguration.CarrierMinDesi && orderDesi <= carrier.CarrierConfiguration.CarrierMaxDesi)
                {
                    // Eğer ilk kargo firması, kargo ücretini ayarla
                    if (carrierCost == 0 || carrier.CarrierConfiguration.CarrierCost < carrierCost)
                    {
                        carrierCost = carrier.CarrierConfiguration.CarrierCost; // En düşük kargo ücreti
                    }
                }
            }

            // Eğer uygun bir kargo firması bulunamadıysa
            if (carrierCost == 0)
            {
                // En yakın kargo firmasını bul
                CarrierConfiguration closestCarrier = null;
                int closestDifference = int.MaxValue;

                foreach (var carrier in carriers)
                {
                    // MinDesi ile sipariş desisi arasındaki farkı hesapla
                    int difference = Math.Abs(carrier.CarrierConfiguration.CarrierMinDesi - orderDesi);

                    // Eğer bu fark daha küçükse, en yakın kargo firmasını güncelle
                    if (difference < closestDifference)
                    {
                        closestDifference = difference;
                        closestCarrier = carrier;
                    }
                }

                // Kargo ücreti hesaplama
                if (closestCarrier != null)
                {
                    int extraDesi = orderDesi - closestCarrier.CarrierConfiguration.CarrierMinDesi;
                    carrierCost = closestCarrier.CarrierConfiguration.CarrierCost + (extraDesi * closestCarrier.CarrierPlusDesiCost);
                }
            }

            // Siparişi oluştur
            var order = _mapper.Map<Order>(createOrderDto);
            order.OrderCarrierCost = carrierCost; // Kargo ücreti olarak hesaplanan değeri ata

            await _orderService.TInsertAsync(order); // Asenkron olarak siparişi ekle

            return Ok("Sipariş başarıyla oluşturuldu.");
        }
   

        // Sipariş Silme
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrder(int id)
        {
            var order = await _orderService.TGetByIdAsync(id);
            if (order == null)
                return NotFound($"ID'si {id} olan sipariş bulunamadı.");

            await _orderService.TDeleteAsync(id);
            return Ok($"{id} ID'li sipariş başarıyla silindi.");
        }

        // Sipariş Güncelleme
        [HttpPut]
        public async Task<IActionResult> UpdateOrder(UpdateOrderDto updateOrderDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var existingOrder = await _orderService.TGetByIdAsync(updateOrderDto.OrderId);
            if (existingOrder == null)
                return NotFound($"ID'si {updateOrderDto.OrderId} olan sipariş bulunamadı.");

            var updatedOrder = _mapper.Map(updateOrderDto, existingOrder);
            await _orderService.TUpdateAsync(updatedOrder);

            return Ok("Sipariş başarıyla güncellendi.");
        }
    }
}
