using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Abstract
{
    public interface ICarrierReportService : IGenericService<CarrierReport>
    {
        Task TAddRangeAsync(List<CarrierReport> reports);
        Task GenerateCarrierReport();
    }
}
