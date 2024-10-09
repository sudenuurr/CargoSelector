using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DtoLayer.Dtos.OrderDtos
{
    public class CreateOrderDto
    {
        [Range(1, int.MaxValue)]
        public int OrderDesi { get; set; }  
        public int CarrierId { get; set; }

    }
}
