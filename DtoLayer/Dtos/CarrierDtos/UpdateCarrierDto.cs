using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DtoLayer.Dtos.CarrierDtos
{
    public class UpdateCarrierDto
    {
        public int CarrierId { get; set; }

        [Required]
        [MaxLength(50)]
        public string CarrierName { get; set; }
        public bool CarrierIsActive { get; set; }

        [Range(0, int.MaxValue)]
        public int CarrierPlusDesiCost { get; set; }
        public int CarrierConfigurationId { get; set; }
    }
}
