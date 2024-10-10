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
        //Sipariş Ekleme
        [HttpPost]
        public async Task<IActionResult> CreateOrder(CreateOrderDto createOrderDto)
        {
            if (!ModelState.IsValid)
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

            // CreateOrderDto'dan Order nesnesi oluştur
            var order = new Order
            {
                OrderDesi = createOrderDto.OrderDesi,
                OrderDate=DateTime.Now
            };

            // Siparişi oluştur
            var createdOrder = await _orderService.TCreateOrderAsync(order); 

            return Ok(new { Message = "Siparişiniz başarıyla eklendi.", Order = createdOrder });
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
