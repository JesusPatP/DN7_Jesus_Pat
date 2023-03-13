using GymManager.Core.Members;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GymManager.ApplicationServices.Members
{
    public class MembersAppService : IMembersAppService
    {
        public List<Member> GetMembers()
        {
            List<Member> members = new List<Member>();
            members.Add(new Member
            {
                Name = "Israel",
                LastName = "Perez",
                BirthDay = new DateTime(1986, 9, 24),
                AllowNewsletter = true,
                CityId = 1,
                Email = "isra@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Edgar",
                LastName = "Garcia",
                BirthDay = new DateTime(2000, 10, 11),
                AllowNewsletter = false,
                CityId = 2,
                Email = "edgar@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Jaime",
                LastName = "Perez",
                BirthDay = new DateTime(1986, 9, 24),
                AllowNewsletter = true,
                CityId = 2,
                Email = "jaime@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Juan",
                LastName = "Lopez",
                BirthDay = new DateTime(1996, 9, 24),
                AllowNewsletter = true,
                CityId = 1,
                Email = "juan@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Elon",
                LastName = "Musk",
                BirthDay = new DateTime(2000, 12, 2),
                AllowNewsletter = false,
                CityId = 2,
                Email = "elon@tesla.com"
            });

            members.Add(new Member
            {
                Name = "Bart",
                LastName = "Simpson",
                BirthDay = new DateTime(1982, 4, 20),
                AllowNewsletter = true,
                CityId = 3,
                Email = "bart@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Homero",
                LastName = "Simpson",
                BirthDay = new DateTime(1966, 2, 22),
                AllowNewsletter = false,
                CityId = 3,
                Email = "homer@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Rick",
                LastName = "Sanchez",
                BirthDay = new DateTime(1960, 2, 10),
                AllowNewsletter = true,
                CityId = 6,
                Email = "rick@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Summer",
                LastName = "Smith",
                BirthDay = new DateTime(2003, 1, 3),
                AllowNewsletter = true,
                CityId = 6,
                Email = "summer@prueba.com"
            });

            members.Add(new Member
            {
                Name = "Morty",
                LastName = "Smith",
                BirthDay = new DateTime(2008, 5, 1),
                AllowNewsletter = true,
                CityId = 6,
                Email = "morty@prueba.com"
            });

            return members;

        }
    }
}
