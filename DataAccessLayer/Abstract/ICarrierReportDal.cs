using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Abstract
{
    public interface ICarrierReportDal: IGenericDal<CarrierReport>
    {
        //Tetiklemede rapor ekleme için gerekli olan metot
        Task AddRangeAsync(List<CarrierReport> reports);
    }
}
