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
    public class CarrierManager : ICarrierService
    {
        private readonly ICarrierDal _carrierDal;

        public CarrierManager(ICarrierDal carrierDal)
        {
            _carrierDal = carrierDal;
        }

        public async Task TDeleteAsync(int id)
        {
            await _carrierDal.DeleteAsync(id);
        }

        public async Task<List<Carrier>> TGetAllAsync()
        {
            return await _carrierDal.GetAllAsync();
        }

        public async Task<Carrier> TGetByIdAsync(int id)
        {
            return await _carrierDal.GetByIdAsync(id);
        }

        public async Task TInsertAsync(Carrier entity)
        {
            await _carrierDal.InsertAsync(entity);
        }

        public async Task TUpdateAsync(Carrier entity)
        {
            await _carrierDal.UpdateAsync(entity);
        }
    }

}
