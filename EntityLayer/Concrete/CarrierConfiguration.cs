using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class CarrierConfiguration
    {
        public int CarrierConfigurationId { get; set; }

        [Range(1, int.MaxValue)]
        public int CarrierMaxDesi { get; set; }
        
        [Range(1, int.MaxValue)]
        public int CarrierMinDesi { get; set; }

        [Range(0, double.MaxValue)]
        public decimal CarrierCost { get; set; }
        public int CarrierId { get; set; }
        [JsonIgnore]
        public Carrier Carrier { get; set; }
    }
}
