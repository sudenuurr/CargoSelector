using EntityLayer.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Concrete
{
    public class Context:DbContext
    {
        public DbSet<Carrier> Carriers { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<CarrierConfiguration> CarrierConfigurations { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=DESKTOP-MDRTU7J\\SQLEXPRESS; database=CargoSelectorDB; integrated security=true");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Carrier Configuration
            modelBuilder.Entity<Carrier>()
                .HasOne(c => c.CarrierConfiguration)
                .WithOne(cc => cc.Carrier)
                .HasForeignKey<Carrier>(c => c.CarrierConfigurationId);

            // Order Configuration
            modelBuilder.Entity<Order>()
                .HasOne(o => o.Carrier)
                .WithMany(c => c.Orders)
                .HasForeignKey(o => o.CarrierId);
        }
    }
}
