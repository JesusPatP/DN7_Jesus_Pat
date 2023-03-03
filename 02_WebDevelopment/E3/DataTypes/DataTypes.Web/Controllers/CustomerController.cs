using Microsoft.AspNetCore.Mvc;

namespace DataTypes.Web.Controllers
{
    public class CustomerController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
