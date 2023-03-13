using GymManager.ApplicationServices.Members;

var builder = WebApplication.CreateBuilder(args);

//method services
builder.Services.AddControllersWithViews();

builder.Services.AddRazorPages().AddRazorRuntimeCompilation();

//builder.Services.AddSingleton<IMembersAppService, MembersAppService>();
builder.Services.AddTransient<IMembersAppService, MembersAppService>();
//builder.Services.AddScoped<IMembersAppService, MembersAppService>();

var app = builder.Build();


//Tells the web service the source path.
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseHttpsRedirection();


//Configuring a conventional route
app.MapControllerRoute(name: "default", pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
