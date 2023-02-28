var builder = WebApplication.CreateBuilder(args);

//method services
builder.Services.AddControllersWithViews();

//
builder.Services.AddRazorPages().AddRazorRuntimeCompilation();


var app = builder.Build();

//
app.UseStaticFiles();
app.UseRouting();
app.UseHttpsRedirection();
app.UseAuthorization();

//Configuring a conventional route
app.MapControllerRoute(name: "default", pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
