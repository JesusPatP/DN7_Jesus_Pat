﻿using GymManager.Core.Navigation;

namespace GymManager.web.Models
{
    public class UserMenuItemViewModel
    {
        public UserMenuItem MenuItem { get; set; }
        public string CurrentPage { get; set; }
        public int ItemDepth { get; set; }
        public bool RootLevel { get; set; } 

    }
}
