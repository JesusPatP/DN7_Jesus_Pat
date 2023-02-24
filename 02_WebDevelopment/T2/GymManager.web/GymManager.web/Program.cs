var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();


app.MapGet("/", () => "Hello World!");

//End point
//app.MapGet("/File1.html", () => "Test content of File1.html");

//Dinamic File
app.MapGet("/File1.html", () => DateTime.Now.ToString());

//Tells the web service the source path.
app.UseStaticFiles();

app.Run();
