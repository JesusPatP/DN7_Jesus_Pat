using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GymManager.Core.Navigation
{
    public static class UserMenuItemExtensions
    {
        public static bool IsMenuActive(this UserMenuItem menuItem,string currentPageName)
        {
            if(menuItem.Name == currentPageName)
            {
                return true;
            }

            if (menuItem.Items != null)
            {
                foreach(var subMenutem in menuItem.Items)
                {
                    if (subMenutem.IsMenuActive(currentPageName))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}
