using GymManager.Core.MembershipTypes;

namespace GymManager.ApplicationServices.MembershipTypes
{
    public class MembershipTypesAppService : IMembershipTypesAppService
    {
        //Membership list
        private static List<MembershipType> MembershipList = new List<MembershipType>();

        //To add a nuew memebership
        public int AddMembershipType(MembershipType member)
        {
            member.Id = new Random().Next();

            MembershipList.Add(member);

            return member.Id;
        }

        //To delete a specific member
        public void DeleteMembershipType(int memberId)
        {
            var specificMember = MembershipList.Where(MembershipList => MembershipList.Id == memberId).FirstOrDefault();
            MembershipList.Remove(specificMember);
        }

        //To edit the values ​​of a member
        public void EditMembershipType(MembershipType member)
        {
            var specificMember = MembershipList.Where(MembershipList => MembershipList.Id == member.Id).FirstOrDefault();
            specificMember.Name = member.Name;
            specificMember.Duration = member.Duration;
            specificMember.Cost = member.Cost;
        }

        //To fill the list
        public List<MembershipType> GetMembershipTypes()
        {
            return MembershipList;
        }

        //To get a specific member
        public MembershipType GetMembershipType(int memberId)
        {
            var specificMember = MembershipList.Where(MembershipList => MembershipList.Id == memberId).FirstOrDefault();
            return specificMember;
        }
    }
    
}
