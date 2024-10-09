using BusinessLayer.Abstract;
using BusinessLayer.Concrete;
using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using WebAPI.Mapping.AutoMapperProfile;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<Context>();

builder.Services.AddScoped<IOrderService, OrderManager>();
builder.Services.AddScoped<ICarrierService, CarrierManager>();
builder.Services.AddScoped<ICarrierConfigurationService, CarrierConfigurationManager>();

builder.Services.AddScoped<ICarrierDal, EfCarrierDal>();
builder.Services.AddScoped<IOrderDal, EfOrderDal>();
builder.Services.AddScoped<ICarrierConfigurationDal, EfCarrierConfigurationDal>();

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

app.UseAuthorization();

app.MapControllers();

app.Run();
