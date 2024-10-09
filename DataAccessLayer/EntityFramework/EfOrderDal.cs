using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.Repositories;
using EntityLayer.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.EntityFramework
{
    public class EfOrderDal:GenericRepository<Order>,IOrderDal
    { 
        public EfOrderDal(Context context):base(context)
        {
            
        }

        public async Task<Order> CreateOrderAsync(Order order)
        {
            await _context.Orders.AddAsync(order); // Asenkron olarak siparişi ekle
            await _context.SaveChangesAsync(); // Değişiklikleri kaydet
            return order; // Eklenen siparişi döndür
        }
    }
}
