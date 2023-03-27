using Api.Entities;
using System.Text;
using WebApi.WindowsClient;

internal class Program
{
    static void Main(string[] args)
    {
        //GetIp();
        System.Threading.Thread.Sleep(5000);

        var forecast = GetWeatherForecastAsync(new Zone
        {
            City = "Acapulco",
            Date = new DateTime(2023, 03, 24)
        }).Result;

        Console.WriteLine("Ciudad: " + forecast.zone.City);
        Console.WriteLine("Fecha: " + forecast.zone.Date);

        foreach (var item in forecast.WeatherForecast)
        {
            Console.WriteLine();
            Console.WriteLine("Summary: " + item.Summary);
            Console.WriteLine("TemperatureC: " + item.TemperatureC);
            Console.WriteLine("TemperatureF: " + item.TemperatureF);

        }

        Console.ReadKey();

    }

    private static async Task<ZoneWeatherForecast> GetWeatherForecastAsync(Zone zone)
    {
        string jsonContent = Newtonsoft.Json.JsonConvert.SerializeObject(zone);

        HttpClient client = new HttpClient();

        HttpResponseMessage response = await client.PostAsync("https://localhost:7020/weatherforecast/byzone", new StringContent(jsonContent, Encoding.UTF8, "application/json"));
        response.EnsureSuccessStatusCode();

        string responseBody = await response.Content.ReadAsStringAsync();

        ZoneWeatherForecast forecast = Newtonsoft.Json.JsonConvert.DeserializeObject<ZoneWeatherForecast>(responseBody);

        //Console.WriteLine("My current Ip Address is: " + ip.Ip);

        //var info = await GetIpInfo(ip.Ip);

        //Console.WriteLine("Country: " + info.Country);

        //Console.WriteLine("City: " + info.City);

        //Console.WriteLine("TimeZone: " + info.TimeZone);

        return forecast;
    }

    private static async Task<IpAddress> GetIp()
    {
        HttpClient client = new HttpClient();

        HttpResponseMessage response = await client.GetAsync("https://api.ipify.org/?format=json");
        response.EnsureSuccessStatusCode();

        string responseBody = await response.Content.ReadAsStringAsync();

        IpAddress ip = Newtonsoft.Json.JsonConvert.DeserializeObject<IpAddress>(responseBody);

        Console.WriteLine("My current Ip Address is: " + ip.Ip);

        var info = await GetIpInfo(ip.Ip);

        Console.WriteLine("Country: " + info.Country);

        Console.WriteLine("City: " + info.City);

        Console.WriteLine("TimeZone: " + info.TimeZone);

        return ip;
    }

    private static async Task<IpInfo> GetIpInfo(string ipAddress)
    {
        HttpClient client = new HttpClient();

        HttpResponseMessage response = await client.GetAsync($"https://ipinfo.io/{ipAddress}/geo");
        response.EnsureSuccessStatusCode();

        string responseBody = await response.Content.ReadAsStringAsync();

        IpInfo info = Newtonsoft.Json.JsonConvert.DeserializeObject<IpInfo>(responseBody);

        return info;
    }



}