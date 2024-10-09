using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Carrier
    {
        public int CarrierId { get; set; }
        [Required]
        [MaxLength(50)]
        public string CarrierName { get; set; }
        public bool CarrierIsActive { get; set; }

        [Range(0, int.MaxValue)]
        public int CarrierPlusDesiCost { get; set; }
        public int CarrierConfigurationId { get; set; }
        public CarrierConfiguration CarrierConfiguration { get; set; }
        public ICollection<Order> Orders { get; set; }
    }
}
