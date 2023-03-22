using GymManager.ApplicationServices.Navigation;
using GymManager.web.Models;
using Microsoft.AspNetCore.Mvc;
using System.Globalization;

namespace GymManager.web.Views.Shared.Components.AppMenu
{
    public class AppMenuViewComponent : ViewComponent
    {
        private readonly IMenuAppService _menuAppService;
        public AppMenuViewComponent(IMenuAppService menuAppService) 
        { 
            _menuAppService = menuAppService;
        }

        public async Task<IViewComponentResult> InvokeAsync(String currentPageName)
        {
            var model = new MenuViewModel
            {
                CurrentPageName = currentPageName,
                Menu = _menuAppService.GetMenu()
            };

            return View("Default",model);
        }
    }
}
