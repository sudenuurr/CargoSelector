﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Order
    {
        public int OrderId { get; set; }

        [Range(1, int.MaxValue)]
        public int OrderDesi { get; set; }
        public DateTime OrderDate { get; set; }

        [Range(0, double.MaxValue)]
        public decimal OrderCarrierCost { get; set; }
        public int CarrierId { get; set; }
        public Carrier Carrier { get; set; }
    }
}
