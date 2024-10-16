﻿// <auto-generated />
using System;
using DataAccessLayer.Concrete;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace DataAccessLayer.Migrations
{
    [DbContext(typeof(Context))]
    partial class ContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.35")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("EntityLayer.Concrete.Carrier", b =>
                {
                    b.Property<int>("CarrierId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CarrierId"), 1L, 1);

                    b.Property<int>("CarrierConfigurationId")
                        .HasColumnType("int");

                    b.Property<bool>("CarrierIsActive")
                        .HasColumnType("bit");

                    b.Property<string>("CarrierName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<int>("CarrierPlusDesiCost")
                        .HasColumnType("int");

                    b.HasKey("CarrierId");

                    b.HasIndex("CarrierConfigurationId")
                        .IsUnique();

                    b.ToTable("Carriers");
                });

            modelBuilder.Entity("EntityLayer.Concrete.CarrierConfiguration", b =>
                {
                    b.Property<int>("CarrierConfigurationId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CarrierConfigurationId"), 1L, 1);

                    b.Property<decimal>("CarrierCost")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int>("CarrierId")
                        .HasColumnType("int");

                    b.Property<int>("CarrierMaxDesi")
                        .HasColumnType("int");

                    b.Property<int>("CarrierMinDesi")
                        .HasColumnType("int");

                    b.HasKey("CarrierConfigurationId");

                    b.ToTable("CarrierConfigurations");
                });

            modelBuilder.Entity("EntityLayer.Concrete.CarrierReport", b =>
                {
                    b.Property<int>("CarrierReportId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CarrierReportId"), 1L, 1);

                    b.Property<decimal>("CarrierCost")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int>("CarrierId")
                        .HasColumnType("int");

                    b.Property<DateTime>("CarrierReportDate")
                        .HasColumnType("datetime2");

                    b.HasKey("CarrierReportId");

                    b.HasIndex("CarrierId");

                    b.ToTable("CarrierReports");
                });

            modelBuilder.Entity("EntityLayer.Concrete.Order", b =>
                {
                    b.Property<int>("OrderId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("OrderId"), 1L, 1);

                    b.Property<int>("CarrierId")
                        .HasColumnType("int");

                    b.Property<decimal>("OrderCarrierCost")
                        .HasColumnType("decimal(18,2)");

                    b.Property<DateTime>("OrderDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("OrderDesi")
                        .HasColumnType("int");

                    b.HasKey("OrderId");

                    b.HasIndex("CarrierId");

                    b.ToTable("Orders");
                });

            modelBuilder.Entity("EntityLayer.Concrete.Carrier", b =>
                {
                    b.HasOne("EntityLayer.Concrete.CarrierConfiguration", "CarrierConfiguration")
                        .WithOne("Carrier")
                        .HasForeignKey("EntityLayer.Concrete.Carrier", "CarrierConfigurationId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("CarrierConfiguration");
                });

            modelBuilder.Entity("EntityLayer.Concrete.CarrierReport", b =>
                {
                    b.HasOne("EntityLayer.Concrete.Carrier", "Carrier")
                        .WithMany("CarrierReports")
                        .HasForeignKey("CarrierId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Carrier");
                });

            modelBuilder.Entity("EntityLayer.Concrete.Order", b =>
                {
                    b.HasOne("EntityLayer.Concrete.Carrier", "Carrier")
                        .WithMany("Orders")
                        .HasForeignKey("CarrierId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Carrier");
                });

            modelBuilder.Entity("EntityLayer.Concrete.Carrier", b =>
                {
                    b.Navigation("CarrierReports");

                    b.Navigation("Orders");
                });

            modelBuilder.Entity("EntityLayer.Concrete.CarrierConfiguration", b =>
                {
                    b.Navigation("Carrier")
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
