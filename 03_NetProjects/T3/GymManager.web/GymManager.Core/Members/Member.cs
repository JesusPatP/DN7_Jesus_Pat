using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GymManager.Core.Members
{
    public class Member
    {

        //Model Properties
        public string Name { get; set; }

        public string LastName { get; set; }
        public DateTime BirthDay { get; set; }

        public int CityId { get; set; }

        public string Email { get; set; }

        public Boolean AllowNewsletter { get; set; }
    }
}
