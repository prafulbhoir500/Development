using SSO.Application;
using SSO.Infrastructure;

namespace SSO.Web.Extensions
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddAppDI(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddApplicationDI().AddInfrastructureDI(configuration);
            //services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));
            //services.AddScoped<IUnitOfWork, UnitOfWork>();
            //services.AddScoped<IAccountService, AccountService>();


            return services;
        }
    }
}
