using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class CarrierReport
    {

        [Key]
        public int CarrierReportId { get; set; }

        public int CarrierId { get; set; }

        public decimal CarrierCost { get; set; }

        public DateTime CarrierReportDate { get; set; }

        // Carrier ile ilişki
        [JsonIgnore]
        public Carrier Carrier { get; set; }
    }
}
