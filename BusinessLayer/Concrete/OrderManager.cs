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

        public OrderManager(IOrderDal orderDal)
        {
            _orderDal = orderDal;
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
