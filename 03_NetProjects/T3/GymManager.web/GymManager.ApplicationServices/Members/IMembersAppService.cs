﻿using GymManager.Core.Members;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GymManager.ApplicationServices.Members
{
    public interface IMembersAppService
    {
        List<Member> GetMembers();

        int AddMember(Member member);

    }
}
