using GymManager.Core.MembershipTypes;


namespace GymManager.ApplicationServices.MembershipTypes
{
    public interface IMembershipTypesAppService
    {
        List<MembershipType> GetMembershipTypes();

        //Add a entity in the list
        int AddMembershipType(MembershipType member);

        //Delete a specific entity
        void DeleteMembershipType(int memberId);

        //Get a specific entity
        MembershipType GetMembershipType(int memberId);

        //Edit a specific entity
        void EditMembershipType(MembershipType member);
    }
}
