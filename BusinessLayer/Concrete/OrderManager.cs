using BusinessLayer.Abstract;
using DataAccessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class OrderManager : IOrderService
    {
        private readonly IOrderDal _orderDal;
        private readonly ICarrierDal _carrierDal;
        private readonly ICarrierConfigurationDal _carrierConfigurationDal;

        public OrderManager(IOrderDal orderDal, ICarrierDal carrierDal, ICarrierConfigurationDal carrierConfigurationDal)
        {
            _orderDal = orderDal;
            _carrierDal = carrierDal;
            _carrierConfigurationDal = carrierConfigurationDal;
        }

        public async Task<Order> TCreateOrderAsync(Order order)
        {
            int orderDesi = order.OrderDesi; // Sipariş desisi

            // Tüm kargo konfigürasyonlarını ve kargo firmalarını al
            List<CarrierConfiguration> carrierConfigurations = await _carrierConfigurationDal.GetAllAsync();
            List<Carrier> carriers = await _carrierDal.GetAllAsync();

            bool foundMatchingConfiguration = false;
            decimal minCarrierCost = decimal.MaxValue;
            int selectedCarrierId = 0;

            // Uygun kargo konfigürasyonlarını bul
            foreach (Carrier carrier in carriers)
            {
                if (carrier.CarrierIsActive)
                {
                    foreach (CarrierConfiguration configuration in carrierConfigurations)
                    {
                        if (configuration.CarrierId == carrier.CarrierId &&
                            orderDesi >= configuration.CarrierMinDesi &&
                            orderDesi <= configuration.CarrierMaxDesi)
                        {
                            foundMatchingConfiguration = true;

                            // En düşük maliyetli kargo firmasını seç
                            if (configuration.CarrierCost < minCarrierCost)
                            {
                                minCarrierCost = configuration.CarrierCost;
                                selectedCarrierId = configuration.CarrierId;
                            }
                        }
                    }
                }
            }

            if (foundMatchingConfiguration)
            {
                // Siparişi oluştur
                order.OrderCarrierCost = minCarrierCost; 
                await _orderDal.CreateOrderAsync(order); 
                return order;
            }

            // Uygun bir kargo firması bulunamadıysa en yakın kargo konfigürasyonunu bul
            decimal carrierCost = 0;
            int plusDesiCost = 0;
            int carrierId = 0;
            decimal closestDesiDifference = decimal.MaxValue;

            foreach (CarrierConfiguration configuration in carrierConfigurations)
            {
                // En yakın desi değerini bul
                decimal desiDifference = Math.Abs(orderDesi - configuration.CarrierMaxDesi);

                if (desiDifference < closestDesiDifference)
                {
                    closestDesiDifference = desiDifference;

                    // İlgili kargo firmasıyla eşleştir
                    Carrier carrier = carriers.FirstOrDefault(c => c.CarrierId == configuration.CarrierId && c.CarrierIsActive);
                    if (carrier != null)
                    {
                        plusDesiCost = carrier.CarrierPlusDesiCost; // +1 desi fiyatı
                        carrierId = carrier.CarrierId;
                    }

                    // Kargo maliyetini hesapla
                    carrierCost = configuration.CarrierCost + (plusDesiCost * closestDesiDifference);
                }
            }

            // siparişi oluştur
            order.OrderCarrierCost = carrierCost; 
            order.CarrierId = carrierId; 
            await _orderDal.CreateOrderAsync(order); 

            return order; // Oluşturulan siparişi döndür
        }



        public async Task TDeleteAsync(int id)
        {
            await _orderDal.DeleteAsync(id); 
        }

        public async Task<List<Order>> TGetAllAsync()
        {
            return await _orderDal.GetAllAsync(); 
        }

        public async Task<Order> TGetByIdAsync(int id)
        {
            return await _orderDal.GetByIdAsync(id);
        }

        public async Task TInsertAsync(Order entity)
        {
            await _orderDal.InsertAsync(entity); 
        }

        public async Task TUpdateAsync(Order entity)
        {
            await _orderDal.UpdateAsync(entity); 
        }
    }

}
