namespace Api.Entities
{
    public class ZoneWeatherForecast
    {
        public Zone zone { get; set; }

        public IEnumerable<WeatherForecast> WeatherForecast { get; set; }
    }
}
