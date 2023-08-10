using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using SipayData; // Veritabanı context sınıfı için gerekli using
using Microsoft.AspNetCore.Identity; // ASP.NET Identity için gerekli using
using Microsoft.OpenApi.Models;
using SipayData.Domain;
using SipayBussiness;

namespace SipayServis;

public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }
   
    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {
        

        // Veritabanı bağlantısını ekleyin (appsettings.json dosyasında connection string tanımlamalıdır)
        services.AddDbContext<sipDbContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

        // ASP.NET Identity yapılandırması
        services.AddDefaultIdentity<IdentityUser>(options =>
        {
            // Şifre gereksinimleri (opsiyonel, projeye uygun şekilde değiştirebilirsiniz)
            options.Password.RequireDigit = true;
            options.Password.RequireLowercase = true;
            options.Password.RequireUppercase = true;
            options.Password.RequireNonAlphanumeric = false;
            options.Password.RequiredLength = 8;
        })
        .AddEntityFrameworkStores<sipDbContext>();


        services.AddControllers();
        services.AddSwaggerGen(c =>
        {
            c.SwaggerDoc("v1", new OpenApiInfo { Title = "Sipay Collection", Version = "v1" });
        });
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env, sipDbContext dbContext)
    {


        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
            app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Sipay v1"));
        }



        app.UseStaticFiles();

        app.UseRouting();

        app.UseAuthentication();
        app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapControllers();
        });
    }
}