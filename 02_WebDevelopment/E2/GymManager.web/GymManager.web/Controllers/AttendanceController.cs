using Microsoft.AspNetCore.Mvc;

namespace GymManager.web.Controllers
{
    public class AttendanceController : Controller
    {
        public IActionResult MemberIn()
        {
            return View();
        }

        public IActionResult MemberOut()
        {
            return View();
        }
    }
}
