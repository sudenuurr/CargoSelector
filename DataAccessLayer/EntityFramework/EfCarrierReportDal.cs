using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.Repositories;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.EntityFramework
{
    public class EfCarrierReportDal : GenericRepository<CarrierReport>, ICarrierReportDal
    {
        public EfCarrierReportDal(Context context) : base(context)
        {
        }

        public async Task AddRangeAsync(List<CarrierReport> reports)
        {
            await _context.CarrierReports.AddRangeAsync(reports);
            await _context.SaveChangesAsync();
        }
    }
}
