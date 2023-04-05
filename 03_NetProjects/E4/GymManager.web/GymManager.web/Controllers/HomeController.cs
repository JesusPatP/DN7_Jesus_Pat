using GymManager.ApplicationServices.Members;
using GymManager.Core.Members;
using Microsoft.AspNetCore.Mvc;
using Serilog;

namespace GymManager.web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IMembersAppService _membersAppService;
        public HomeController(IMembersAppService membersAppService)
        {
            _membersAppService = membersAppService;
        }
        public IActionResult Index()
        {
            
            List<Member> members = _membersAppService.GetMembers();
            return View(members);
        }

    }
}
