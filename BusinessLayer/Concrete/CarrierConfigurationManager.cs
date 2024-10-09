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
    public class CarrierConfigurationManager : ICarrierConfigurationService
    {
        private readonly ICarrierConfigurationDal _carrierConfigurationDal;

        public CarrierConfigurationManager(ICarrierConfigurationDal carrierConfigurationDal)
        {
            _carrierConfigurationDal = carrierConfigurationDal;
        }

        public async Task TDeleteAsync(int id)
        {
            await _carrierConfigurationDal.DeleteAsync(id);
        }

        public async Task<List<CarrierConfiguration>> TGetAllAsync()
        {
            return await _carrierConfigurationDal.GetAllAsync();
        }

        public async Task<CarrierConfiguration> TGetByIdAsync(int id)
        {
            return await _carrierConfigurationDal.GetByIdAsync(id);
        }

        public async Task TInsertAsync(CarrierConfiguration entity)
        {
            await _carrierConfigurationDal.InsertAsync(entity);
        }

        public async Task TUpdateAsync(CarrierConfiguration entity)
        {
            await _carrierConfigurationDal.UpdateAsync(entity);
        }
    }

}
