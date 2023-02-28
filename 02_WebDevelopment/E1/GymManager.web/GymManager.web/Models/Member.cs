namespace GymManager.web.Models
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
