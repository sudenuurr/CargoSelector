﻿using BusinessLayer.Abstract;
using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class CarrierReportManager : ICarrierReportService
    {
        private readonly ICarrierReportDal _carrierReportDal;
        private readonly Context _context;

        public CarrierReportManager(ICarrierReportDal carrierReportDal, Context context)
        {
            _carrierReportDal = carrierReportDal;
            _context = context;
        }

        public async Task TDeleteAsync(int id)
        {
            await _carrierReportDal.DeleteAsync(id);
        }

        public async Task<List<CarrierReport>> TGetAllAsync()
        {
            return await _carrierReportDal.GetAllAsync();
        }

        public async Task<CarrierReport> TGetByIdAsync(int id)
        {
            return await _carrierReportDal.GetByIdAsync(id);
        }

        public async Task TInsertAsync(CarrierReport entity)
        {
            await _carrierReportDal.InsertAsync(entity);
        }

        public async Task TUpdateAsync(CarrierReport entity)
        {
            await _carrierReportDal.UpdateAsync(entity);
        }

        public async Task TAddRangeAsync()
        {
            var reportData = await _context.Orders
                .GroupBy(o => new { o.CarrierId, o.OrderDate.Date })
                .Select(g => new
                {
                    CarrierId = g.Key.CarrierId,
                    ReportDate = DateTime.Now,
                    TotalCost = g.Sum(o => o.OrderCarrierCost)
                })
                .ToListAsync();

            var carrierReports = reportData.Select(r => new CarrierReport
            {
                CarrierId = r.CarrierId,
                CarrierReportDate = r.ReportDate,
                CarrierCost = r.TotalCost
            }).ToList();

            await _carrierReportDal.AddRangeAsync(carrierReports);
        }
        public async Task GenerateCarrierReport()
        {
            await TAddRangeAsync();
        }
    }
}
