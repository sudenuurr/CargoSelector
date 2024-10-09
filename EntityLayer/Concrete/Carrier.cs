using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Carrier
    {
        [Key]
        public int CarrierId { get; set; }
        [Required]
        [MaxLength(50)]
        public string CarrierName { get; set; }
        public bool CarrierIsActive { get; set; }

        [Range(0, int.MaxValue)]
        public int CarrierPlusDesiCost { get; set; }
        public int CarrierConfigurationId { get; set; }
        [JsonIgnore]
        public CarrierConfiguration CarrierConfiguration { get; set; }
        [JsonIgnore]
        public ICollection<Order> Orders { get; set; }
        [JsonIgnore]
        public ICollection<CarrierReport> CarrierReports { get; set; }
    }
}
