using GymManager.ApplicationServices.Members;
using GymManager.Core.Members;
using GymManager.web.Models;
using Microsoft.AspNetCore.Mvc;

namespace GymManager.web.Controllers
{
    public class MembersController : Controller
    {
        private readonly IMembersAppService _membersAppService;
        public MembersController(IMembersAppService membersAppService) {
            _membersAppService = membersAppService;
        }
        public IActionResult Index()
        {
            List<Member> members = _membersAppService.GetMembers();
            MemberListViewModel viewModel = new MemberListViewModel();
            viewModel.NewMembersCount = 2;
            viewModel.Members = members;
            return View(viewModel);
        }

        public IActionResult Test()
        {
            return View();
        }

    }
}
