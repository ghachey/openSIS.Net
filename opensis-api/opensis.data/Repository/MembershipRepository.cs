﻿using opensis.data.Interface;
using opensis.data.Models;
using opensis.data.ViewModels.Membership;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace opensis.data.Repository
{
    public class MembershipRepository : IMembershipRepository
    {
        private CRMContext context;
        private static readonly string NORECORDFOUND = "NO RECORD FOUND";
        public MembershipRepository(IDbContextFactory dbContextFactory)
        {
            this.context = dbContextFactory.Create();
        }

        /// <summary>
        /// Get All Members
        /// </summary>
        /// <returns></returns>
        public GetAllMembersList GetAllMemberList()
        {
            GetAllMembersList getAllMembersList = new GetAllMembersList();
            try
            {
                var noticeRepository = this.context?.TableMembership.ToList();

                var query = (from o in noticeRepository
                             select new GetAllMembers()
                             {
                                 Membership_id = o.MembershipId,
                                 Profile = o.Profile
                             }).ToList();


                getAllMembersList.GetAllMemberList = query;

                return getAllMembersList;
            }
            catch (Exception ex)
            {
                getAllMembersList = null;
                getAllMembersList._failure = true;
                getAllMembersList._message = NORECORDFOUND;
                return getAllMembersList;
            }
        }

    }
}