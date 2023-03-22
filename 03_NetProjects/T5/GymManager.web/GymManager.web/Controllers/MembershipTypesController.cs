
using GymManager.ApplicationServices.MembershipTypes;
using GymManager.Core.MembershipTypes;
using GymManager.web.Models;
using Microsoft.AspNetCore.Mvc;

namespace GymManager.web.Controllers
{
    public class MembershipTypesController : Controller
    {

        //Varaible to IMmebership
        private readonly IMembershipTypesAppService _membershipTypeAppService;

        //To reference the 
        public MembershipTypesController(IMembershipTypesAppService membershipAppService)
        {
            _membershipTypeAppService = membershipAppService;
        }

        public IActionResult Index()
        {
            List<MembershipType> members = _membershipTypeAppService.GetMembershipTypes();
            MembershipTypesListViewModel viewModel = new MembershipTypesListViewModel();
            //viewModel.NewMembersCount = 2;
            viewModel.Membership = members;

            return View(viewModel);
        }

        public IActionResult Create()
        {
            return View();
        }

        public IActionResult Delete(int memberId)
        {
            _membershipTypeAppService.DeleteMembershipType(memberId);
            return RedirectToAction("Index");
        }
        public IActionResult Edit(int memberId)
        {
            MembershipType member = _membershipTypeAppService.GetMembershipType(memberId);

            return View(member);
        }

        [HttpPost]
        public IActionResult Edit(MembershipType member)
        {
            _membershipTypeAppService.EditMembershipType(member);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult Create(MembershipType member)
        {
            _membershipTypeAppService.AddMembershipType(member);
            return RedirectToAction("Index");
        }

        //}
    }
}
