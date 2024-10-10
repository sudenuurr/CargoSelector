using BusinessLayer.Abstract;
using BusinessLayer.Concrete;
using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Hangfire;
using WebAPI.Mapping.AutoMapperProfile;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<Context>();
builder.Services.AddScoped<ICarrierDal, EfCarrierDal>();
builder.Services.AddScoped<IOrderDal, EfOrderDal>();
builder.Services.AddScoped<ICarrierConfigurationDal, EfCarrierConfigurationDal>();
builder.Services.AddScoped<ICarrierReportDal, EfCarrierReportDal>();

builder.Services.AddScoped<IOrderService, OrderManager>();
builder.Services.AddScoped<ICarrierService, CarrierManager>();
builder.Services.AddScoped<ICarrierConfigurationService, CarrierConfigurationManager>();
builder.Services.AddScoped<ICarrierReportService, CarrierReportManager>();

builder.Services.AddHangfire(config =>
        config.UseSqlServerStorage("Server=DESKTOP-MDRTU7J\\SQLEXPRESS; Database=CargoSelectorDB; Integrated Security=True"));
builder.Services.AddHangfireServer();

builder.Services.AddControllers();

// Add services to the container.
builder.Services.AddAutoMapper(typeof(MapProfile));
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHangfireDashboard();
app.UseHangfireServer();

RecurringJob.AddOrUpdate<ICarrierReportService>(
      "GenerateCarrierReportJob", // Job için benzersiz bir ad
      service => service.GenerateCarrierReport(), // Job'un çaðýracaðý metot
      Cron.Hourly);

app.UseAuthorization();

app.MapControllers();

app.Run();
