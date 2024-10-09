using BusinessLayer.Abstract;
using DataAccessLayer.Abstract;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class CarrierReportManager : ICarrierReportService
    {
        private readonly EfCarrierReportDal _carrierReportDal;

        public CarrierReportManager(EfCarrierReportDal carrierReportDal)
        {
            _carrierReportDal = carrierReportDal;
        }

        public async Task TDeleteAsync(int id)
        {
            await _carrierReportDal.DeleteAsync(id);
        }

        public async Task<List<CarrierReport>> TGetAllAsync()
        {
            return await _carrierReportDal.GetAllAsync();
        }

        public async Task<CarrierReport> TGetByIdAsync(int id)
        {
            return await _carrierReportDal.GetByIdAsync(id);
        }

        public async Task TInsertAsync(CarrierReport entity)
        {
            await _carrierReportDal.InsertAsync(entity);
        }

        public async Task TUpdateAsync(CarrierReport entity)
        {
            await _carrierReportDal.UpdateAsync(entity);
        }
    }
}
