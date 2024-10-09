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
        //[HttpPost]
        //public async Task<IActionResult> CreateOrder(CreateOrderDto createOrderDto)
        //{
        //    // Sipariş desisini al
        //    int orderDesi = createOrderDto.OrderDesi;

        //    // Kargo firmalarını al
        //    var carriers = await _carrierConfigurationService.TGetAllAsync();

        //    // MinDesi-MaxDesi aralıklarına uyan kargo firmalarını bul
        //    var applicableCarriers = carriers.Where(c => orderDesi >= c.CarrierMinDesi && orderDesi <= c.CarrierMaxDesi).ToList();

        //    decimal carrierCost;

        //    if (applicableCarriers.Any())
        //    {
        //        // Uyan kargo firmaları arasından en düşük ücreti seç
        //        var cheapestCarrier = applicableCarriers.OrderBy(c => c.CarrierCost).First();
        //        carrierCost = cheapestCarrier.CarrierCost; // Kargo ücreti
        //    }
        //    else
        //    {
        //        // MinDesi-MaxDesi aralıklarına uymayan durum için en yakın kargo firmasını bul
        //        var closestCarrier = carriers.OrderBy(c => Math.Abs(c.CarrierMinDesi - orderDesi)).First();

        //        // Kargo +1 desi fiyatı
        //        decimal plusOneDesiCost = closestCarrier.CarrierPlusDesiCost;

        //        // Farkı hesapla
        //        int difference = orderDesi - closestCarrier.CarrierMinDesi;

        //        // Toplam kargo fiyatını hesapla
        //        carrierCost = closestCarrier.CarrierCost + (difference * plusOneDesiCost);
        //    }

        //    // Siparişi oluştur
        //    var order = _mapper.Map<Order>(createOrderDto);
        //    order.OrderCarrierCost = carrierCost; // Kargo ücreti olarak hesaplanan değeri ata

        //    await _orderService.TInsertAsync(order); // Asenkron olarak siparişi ekle

        //    return Ok("Sipariş başarıyla oluşturuldu.");
        //}

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
