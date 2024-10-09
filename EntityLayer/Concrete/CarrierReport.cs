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
        public int ReportId { get; set; }

        public int CarrierId { get; set; }

        [Required]
        [MaxLength(100)]
        public string ReportName { get; set; }

        public DateTime ReportDate { get; set; }

        [MaxLength(500)]
        public string ReportDetails { get; set; }

        // Carrier ile ilişki
        [JsonIgnore]
        public Carrier Carrier { get; set; }
    }
}
