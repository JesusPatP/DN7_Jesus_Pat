using GymManager.ApplicationServices.Members;
using GymManager.ApplicationServices.MembershipTypes;
using GymManager.ApplicationServices.Navigation;
using GymManager.DataAccess;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using System.Security.Cryptography.X509Certificates;

internal class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        //method services
        builder.Services.AddControllersWithViews();

        builder.Services.AddRazorPages().AddRazorRuntimeCompilation();

        //builder.Services.AddSingleton<IMembersAppService, MembersAppService>();
        //builder.Services.AddSingleton<IMembershipTypesAppService, MembershipTypesAppService>();

        

        builder.Services.AddTransient<IMembersAppService, MembersAppService>();
        builder.Services.AddTransient<IMembershipTypesAppService, MembershipTypesAppService>();
        builder.Services.AddTransient<IMenuAppService, MenuAppService>();
        //builder.Services.AddScoped<IMembersAppService, MembersAppService>();

        //Data base conection
        string connectionString = builder.Configuration.GetConnectionString("Default");

        builder.Services.AddDbContext<GymManagerContext>(options =>
        options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));

        //asociar a los servicios de entidad de usuario
        builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
            .AddEntityFrameworkStores<GymManagerContext>();

        builder.Services.ConfigureApplicationCookie(options => options.LoginPath = "/Account/LogIn");


        var app = builder.Build();

        //Configure the localization middleware
        var defaultDateCulture = "es-Mx";
        var ci = new CultureInfo(defaultDateCulture);

        app.UseRequestLocalization(new RequestLocalizationOptions
        {
            DefaultRequestCulture = new Microsoft.AspNetCore.Localization.RequestCulture(ci),
            SupportedCultures = new List<CultureInfo>{
    ci,
    },
            SupportedUICultures = new List<CultureInfo>{
    ci,
    },

        });

        //Tells the web service the source path.
        app.UseStaticFiles();

        app.UseRouting();

        app.UseAuthentication();

        app.UseAuthorization();

        app.UseHttpsRedirection();


        //Configuring a conventional route
        app.MapControllerRoute(name: "default", pattern: "{controller=Home}/{action=Index}/{id?}");

        app.Run();
    }

}