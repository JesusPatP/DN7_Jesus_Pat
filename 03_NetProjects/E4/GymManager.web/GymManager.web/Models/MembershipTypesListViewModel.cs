using GymManager.Core.MembershipTypes;

namespace GymManager.web.Models
{
    public class MembershipTypesListViewModel
    {
        public int NewMembersCount { get; set; }

        public List<MembershipType> Membership { get; set; }
    }
}
