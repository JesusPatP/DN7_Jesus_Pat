using GymManager.ApplicationServices.Members;
using GymManager.ApplicationServices.MembershipTypes;
using System.Globalization;

var builder = WebApplication.CreateBuilder(args);

//method services
builder.Services.AddControllersWithViews();

builder.Services.AddRazorPages().AddRazorRuntimeCompilation();

//builder.Services.AddSingleton<IMembersAppService, MembersAppService>();
//builder.Services.AddSingleton<IMembershipTypesAppService, MembershipTypesAppService>();

builder.Services.AddTransient<IMembersAppService, MembersAppService>();
builder.Services.AddTransient<IMembershipTypesAppService, MembershipTypesAppService>();
//builder.Services.AddScoped<IMembersAppService, MembersAppService>();

var app = builder.Build();

//Configure the localization middleware
var defaultDateCulture = "es-Mx";
var ci =  new CultureInfo(defaultDateCulture); 

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

app.UseAuthorization();

app.UseHttpsRedirection();


//Configuring a conventional route
app.MapControllerRoute(name: "default", pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
