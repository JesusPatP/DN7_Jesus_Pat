using Microsoft.AspNetCore.Mvc;

namespace DataTypes.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
