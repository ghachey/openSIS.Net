﻿using Microsoft.EntityFrameworkCore;
using opensis.data.Helper;
using opensis.data.Interface;
using opensis.data.Models;
using opensis.data.ViewModels.ParentInfos;
using opensis.data.ViewModels.Student;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace opensis.data.Repository
{
    public class ParentInfoRepository : IParentInfoRepository
    {
        private CRMContext context;
        private static readonly string NORECORDFOUND = "NO RECORD FOUND";
        public ParentInfoRepository(IDbContextFactory dbContextFactory)
        {
            this.context = dbContextFactory.Create();
        }

        /// <summary>
        /// Add Parent For Student
        /// </summary>
        /// <param name="parentInfoAddViewModel"></param>
        /// <returns></returns>
        public ParentInfoAddViewModel AddParentForStudent(ParentInfoAddViewModel parentInfoAddViewModel)
        {
            using (var transaction = this.context.Database.BeginTransaction())
            {
                try
                {
                    if (parentInfoAddViewModel.parentInfo.ParentId > 0)
                    {
                        var parentInfo = this.context?.ParentInfo.FirstOrDefault(x => x.ParentId == parentInfoAddViewModel.parentInfo.ParentId);
                        if (parentInfo != null)
                        {
                            var parentAssociationship = new ParentAssociationship { TenantId = parentInfoAddViewModel.parentInfo.TenantId, SchoolId = parentInfoAddViewModel.parentInfo.SchoolId, ParentId = parentInfoAddViewModel.parentInfo.ParentId, StudentId = parentInfoAddViewModel.parentAssociationship.StudentId, Associationship = true, LastUpdated = DateTime.UtcNow, UpdatedBy = parentInfoAddViewModel.parentInfo.UpdatedBy, IsCustodian = parentInfoAddViewModel.parentAssociationship.IsCustodian, Relationship = parentInfoAddViewModel.parentAssociationship.Relationship };
                            this.context?.ParentAssociationship.Add(parentAssociationship);
                        }
                    }
                    else
                    {
                        int? ParentId = Utility.GetMaxPK(this.context, new Func<ParentInfo, int>(x => x.ParentId));
                        parentInfoAddViewModel.parentInfo.ParentId = (int)ParentId;
                        parentInfoAddViewModel.parentInfo.LastUpdated = DateTime.UtcNow;

                        //Add Parent Portal Access
                        if (!string.IsNullOrWhiteSpace(parentInfoAddViewModel.PasswordHash) && !string.IsNullOrWhiteSpace(parentInfoAddViewModel.parentInfo.LoginEmail))
                        {
                            UserMaster userMaster = new UserMaster();

                            var decrypted = Utility.Decrypt(parentInfoAddViewModel.PasswordHash);
                            string passwordHash = Utility.GetHashedPassword(decrypted);

                            var loginInfo = this.context?.UserMaster.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.EmailAddress == parentInfoAddViewModel.parentInfo.LoginEmail);

                            if (loginInfo == null)
                            {
                                var membership = this.context?.Membership.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.SchoolId == parentInfoAddViewModel.parentInfo.SchoolId && x.Profile == "Parent");

                                userMaster.SchoolId = parentInfoAddViewModel.parentInfo.SchoolId;
                                userMaster.TenantId = parentInfoAddViewModel.parentInfo.TenantId;
                                userMaster.UserId = parentInfoAddViewModel.parentInfo.ParentId;
                                userMaster.LangId = 1;
                                userMaster.MembershipId = membership.MembershipId;
                                userMaster.EmailAddress = parentInfoAddViewModel.parentInfo.LoginEmail;
                                userMaster.PasswordHash = passwordHash;
                                userMaster.Name = parentInfoAddViewModel.parentInfo.Firstname;
                                userMaster.IsActive = parentInfoAddViewModel.parentInfo.IsPortalUser;

                                parentInfoAddViewModel.parentInfo.LoginEmail = parentInfoAddViewModel.parentInfo.LoginEmail;

                                this.context?.UserMaster.Add(userMaster);
                                this.context?.SaveChanges();
                            }
                            else
                            {
                                parentInfoAddViewModel.parentInfo = null;
                                parentInfoAddViewModel._failure = true;
                                parentInfoAddViewModel._message = "Parent Login Email Already Exist";
                                return parentInfoAddViewModel;
                            }
                        }

                        this.context?.ParentInfo.Add(parentInfoAddViewModel.parentInfo);
                        var parentAssociationship = new ParentAssociationship { TenantId = parentInfoAddViewModel.parentInfo.TenantId, SchoolId = parentInfoAddViewModel.parentInfo.SchoolId, ParentId = parentInfoAddViewModel.parentInfo.ParentId, StudentId = parentInfoAddViewModel.parentAssociationship.StudentId, Associationship = true, LastUpdated = DateTime.UtcNow, UpdatedBy = parentInfoAddViewModel.parentInfo.UpdatedBy, IsCustodian = parentInfoAddViewModel.parentAssociationship.IsCustodian, Relationship = parentInfoAddViewModel.parentAssociationship.Relationship };
                        this.context?.ParentAssociationship.Add(parentAssociationship);

                    }
                    this.context?.SaveChanges();                
                    transaction.Commit();
                    parentInfoAddViewModel._failure = false;
                }
                catch (Exception es)
                {
                    transaction.Rollback();
                    parentInfoAddViewModel._message = es.Message;
                    parentInfoAddViewModel._failure = true;
                    parentInfoAddViewModel._tenantName = parentInfoAddViewModel._tenantName;
                    parentInfoAddViewModel._token = parentInfoAddViewModel._token;
                }
            }
            return parentInfoAddViewModel;
        }
        /// <summary>
        /// View Parent List For Student
        /// </summary>
        /// <param name="parentInfoList"></param>
        /// <returns></returns>
        public ParentInfoListModel ViewParentListForStudent(ParentInfoListModel parentInfoList)
        {
            ParentInfoListModel parentInfoListViewModel = new ParentInfoListModel();
            try
            {
                var parentAssociationship = this.context?.ParentAssociationship.Where(x => x.StudentId == parentInfoList.StudentId && x.SchoolId == parentInfoList.SchoolId && x.TenantId == parentInfoList.TenantId && x.Associationship == true).ToList();
                if(parentAssociationship.Count() > 0)
                {
                    foreach(var parent in parentAssociationship)
                    {
                        var parentData = this.context?.ParentInfo.Include(x => x.ParentAddress).FirstOrDefault(x => x.ParentId == parent.ParentId);
                        if(parentData != null)
                        {
                            if(parentData.ParentAddress.FirstOrDefault().StudentAddressSame == true)
                            {
                                var parentAddress = this.context?.StudentMaster.FirstOrDefault(x => x.StudentId == parentData.ParentAddress.FirstOrDefault().StudentId);
                                parentData.ParentAddress.FirstOrDefault().AddressLineOne = parentAddress.HomeAddressLineOne;
                                parentData.ParentAddress.FirstOrDefault().AddressLineTwo = parentAddress.HomeAddressLineTwo;
                                parentData.ParentAddress.FirstOrDefault().Country = parentAddress.HomeAddressCountry;
                                parentData.ParentAddress.FirstOrDefault().State = parentAddress.HomeAddressState;
                                parentData.ParentAddress.FirstOrDefault().City = parentAddress.HomeAddressCity;
                                parentData.ParentAddress.FirstOrDefault().Zip = parentAddress.HomeAddressZip;
                            }
                        }
                        var parentInfoListData = new ParentInfoListForView
                        {
                            TenantId= parentData.TenantId,
                            SchoolId= parentData.SchoolId,
                            ParentId= parentData.ParentId,
                            Firstname = parentData.Firstname,
                            Lastname = parentData.Lastname,
                            HomePhone = parentData.HomePhone,
                            WorkPhone = parentData.WorkPhone,
                            Mobile = parentData.Mobile,
                            IsPortalUser = parentData.IsPortalUser,
                            BusPickup = parentData.BusPickup,
                            BusDropoff = parentData.BusDropoff,
                            ContactType = parentData.ContactType,
                            LastUpdated = parentData.LastUpdated,
                            UpdatedBy = parentData.UpdatedBy,
                            BusNo = parentData.BusNo,
                            Middlename = parentData.Middlename,
                            PersonalEmail = parentData.PersonalEmail,
                            Salutation = parentData.Salutation,
                            Suffix = parentData.Suffix,
                            UserProfile = parentData.UserProfile,
                            WorkEmail = parentData.WorkEmail,
                            ParentPhoto = parentData.ParentPhoto,
                            IsCustodian = parent.IsCustodian,
                            Relationship = parent.Relationship,
                            ParentAddress=parentData.ParentAddress.FirstOrDefault(),
                        };
                        parentInfoListViewModel.parentInfoListForView.Add(parentInfoListData);
                    }                 
                    parentInfoListViewModel._tenantName = parentInfoList._tenantName;
                    parentInfoListViewModel._token = parentInfoList._token;
                    parentInfoListViewModel._failure = false;
                }
                else
                {
                    parentInfoListViewModel._failure = true;
                    parentInfoListViewModel._message = NORECORDFOUND;
                    return parentInfoListViewModel;
                }
            }
            catch (Exception es)
            {
                parentInfoListViewModel._failure = true;
                parentInfoListViewModel._message = es.Message;
            }
            return parentInfoListViewModel;
        }
        /// <summary>
        /// Update Parent Info
        /// </summary>
        /// <param name="parentInfoAddViewModel"></param>
        /// <returns></returns>
        public ParentInfoAddViewModel UpdateParentInfo(ParentInfoAddViewModel parentInfoAddViewModel)
        {
            using (var transaction = this.context.Database.BeginTransaction())
            {
                try
                {
                    var parentInfoUpdate = this.context?.ParentInfo.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.SchoolId == parentInfoAddViewModel.parentInfo.SchoolId && x.ParentId == parentInfoAddViewModel.parentInfo.ParentId);

                    //Add or Update parent portal access
                    if (parentInfoUpdate.LoginEmail != null)
                    {
                        if (!string.IsNullOrWhiteSpace(parentInfoAddViewModel.parentInfo.LoginEmail))
                        {
                            if (parentInfoUpdate.LoginEmail != parentInfoAddViewModel.parentInfo.LoginEmail)
                            {
                                var loginInfo = this.context?.UserMaster.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.EmailAddress == parentInfoAddViewModel.parentInfo.LoginEmail);

                                if (loginInfo != null)
                                {
                                    parentInfoAddViewModel.parentInfo = null;
                                    parentInfoAddViewModel._failure = true;
                                    parentInfoAddViewModel._message = "Parent Login Email Already Exist";
                                    return parentInfoAddViewModel;
                                }
                                else
                                {
                                    var loginInfoData = this.context?.UserMaster.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.EmailAddress == parentInfoAddViewModel.parentInfo.LoginEmail);

                                    loginInfoData.EmailAddress = parentInfoAddViewModel.parentInfo.LoginEmail;
                                    loginInfoData.IsActive = parentInfoAddViewModel.parentInfo.IsPortalUser;

                                    this.context?.UserMaster.Add(loginInfoData);
                                    this.context?.SaveChanges();

                                    //Update Parent Login in ParentInfo table.
                                    parentInfoUpdate.LoginEmail = parentInfoAddViewModel.parentInfo.LoginEmail;
                                }
                            }
                            else
                            {
                                var loginInfo = this.context?.UserMaster.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.EmailAddress == parentInfoAddViewModel.parentInfo.LoginEmail);

                                loginInfo.IsActive = parentInfoAddViewModel.parentInfo.IsPortalUser;

                                this.context?.SaveChanges();
                            }
                        }
                    }
                    else
                    {
                        if (!string.IsNullOrWhiteSpace(parentInfoAddViewModel.parentInfo.LoginEmail) && !string.IsNullOrWhiteSpace(parentInfoAddViewModel.PasswordHash))
                        {
                            var decrypted = Utility.Decrypt(parentInfoAddViewModel.PasswordHash);
                            string passwordHash = Utility.GetHashedPassword(decrypted);

                            UserMaster userMaster = new UserMaster();

                            var loginInfo = this.context?.UserMaster.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.EmailAddress == parentInfoAddViewModel.parentInfo.LoginEmail);

                            if (loginInfo == null)
                            {
                                var membership = this.context?.Membership.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.SchoolId == parentInfoAddViewModel.parentInfo.SchoolId && x.Profile == "Parent");

                                userMaster.SchoolId = parentInfoAddViewModel.parentInfo.SchoolId;
                                userMaster.TenantId = parentInfoAddViewModel.parentInfo.TenantId;
                                userMaster.UserId = parentInfoAddViewModel.parentInfo.ParentId;
                                userMaster.LangId = 1;
                                userMaster.MembershipId = membership.MembershipId;
                                userMaster.EmailAddress = parentInfoAddViewModel.parentInfo.LoginEmail;
                                userMaster.PasswordHash = passwordHash;
                                userMaster.Name = parentInfoAddViewModel.parentInfo.Firstname;
                                userMaster.LastUpdated = DateTime.UtcNow;
                                userMaster.IsActive = parentInfoAddViewModel.parentInfo.IsPortalUser;

                                this.context?.UserMaster.Add(userMaster);
                                this.context?.SaveChanges();


                                //Update LoginEmail in ParentInfo table.
                                parentInfoUpdate.LoginEmail = parentInfoAddViewModel.parentInfo.LoginEmail;
                            }
                            else
                            {
                                parentInfoAddViewModel.parentInfo = null;
                                parentInfoAddViewModel._failure = true;
                                parentInfoAddViewModel._message = "Parent Login Email Already Exist";
                                return parentInfoAddViewModel;
                            }
                        }
                    }
                    parentInfoUpdate.Salutation = parentInfoAddViewModel.parentInfo.Salutation;
                    parentInfoUpdate.Firstname = parentInfoAddViewModel.parentInfo.Firstname;
                    parentInfoUpdate.Middlename = parentInfoAddViewModel.parentInfo.Middlename;
                    parentInfoUpdate.Lastname = parentInfoAddViewModel.parentInfo.Lastname;
                    parentInfoUpdate.HomePhone = parentInfoAddViewModel.parentInfo.HomePhone;
                    parentInfoUpdate.WorkPhone = parentInfoAddViewModel.parentInfo.WorkPhone;
                    parentInfoUpdate.Mobile = parentInfoAddViewModel.parentInfo.Mobile;
                    parentInfoUpdate.PersonalEmail = parentInfoAddViewModel.parentInfo.PersonalEmail;
                    parentInfoUpdate.WorkEmail = parentInfoAddViewModel.parentInfo.WorkEmail;
                    /*12/20**
                     parentInfoUpdate.StudentAddressSame = parentInfoAddViewModel.parentInfo.StudentAddressSame;
                     parentInfoUpdate.AddressLineOne = parentInfoAddViewModel.parentInfo.AddressLineOne;
                     parentInfoUpdate.AddressLineTwo = parentInfoAddViewModel.parentInfo.AddressLineTwo;
                     parentInfoUpdate.Country = parentInfoAddViewModel.parentInfo.Country;
                     parentInfoUpdate.City = parentInfoAddViewModel.parentInfo.City;
                     parentInfoUpdate.State = parentInfoAddViewModel.parentInfo.State;
                     parentInfoUpdate.Zip = parentInfoAddViewModel.parentInfo.Zip;
                     parentInfoUpdate.IsCustodian = parentInfoAddViewModel.parentInfo.IsCustodian;
                     */
                    parentInfoUpdate.IsPortalUser = parentInfoAddViewModel.parentInfo.IsPortalUser;
                    parentInfoUpdate.Suffix = parentInfoAddViewModel.parentInfo.Suffix;
                    parentInfoUpdate.LoginEmail = parentInfoAddViewModel.parentInfo.LoginEmail;
                    parentInfoUpdate.BusPickup = parentInfoAddViewModel.parentInfo.BusPickup;
                    parentInfoUpdate.BusDropoff = parentInfoAddViewModel.parentInfo.BusDropoff;
                    parentInfoUpdate.ContactType = parentInfoAddViewModel.parentInfo.ContactType;
                    parentInfoUpdate.LastUpdated = DateTime.UtcNow;
                    parentInfoUpdate.UpdatedBy = parentInfoAddViewModel.parentInfo.UpdatedBy;
                    parentInfoUpdate.BusNo = parentInfoAddViewModel.parentInfo.BusNo;
                    parentInfoUpdate.IsPortalUser = parentInfoAddViewModel.parentInfo.IsPortalUser;
                    parentInfoUpdate.ParentPhoto = parentInfoAddViewModel.parentInfo.ParentPhoto;
                    this.context?.SaveChanges();

                    parentInfoAddViewModel._failure = false;

                    transaction.Commit();
                }
                catch (Exception es)
                {
                    transaction.Rollback();
                    parentInfoAddViewModel._failure = true;
                    parentInfoAddViewModel._message = es.Message;
                }
            }
            return parentInfoAddViewModel;
        }
        private static string ToFullAddress(string Address1, string Address2, string City, string State, string Country, string Zip)
        {
            string address = "";
            if (!string.IsNullOrWhiteSpace(Address1))
            {


                return address == null
                      ? null
                      : $"{Address1?.Trim()}{(!string.IsNullOrWhiteSpace(Address2) ? $", {Address2?.Trim()}" : string.Empty)}, {City?.Trim()}, {State?.Trim()} {Zip?.Trim()}";
            }
            return address;
        }
        /// <summary>
        /// Get All Parent Info
        /// </summary>
        /// <param name="pageResult"></param>
        /// <returns></returns>
        public GetAllParentInfoListForView GetAllParentInfoList(PageResult pageResult)
        {
            GetAllParentInfoListForView parentInfoListModel = new GetAllParentInfoListForView();
            int resultData;
            IQueryable<ParentInfo> transactionIQ = null;
            var ParentInfoList = this.context?.ParentInfo.Include(x=>x.ParentAddress).ToList().Where(x => x.TenantId == pageResult.TenantId && x.SchoolId==pageResult.SchoolId);
            
            try
            {
                transactionIQ = ParentInfoList.AsQueryable();
                int totalCount = transactionIQ.Count();
                var parentInfo = transactionIQ.AsNoTracking().Select(y => new GetParentInfoForView
                {
                    SchoolId = y.SchoolId,
                    TenantId = y.TenantId,
                    ParentId=y.ParentId,
                    Firstname = y.Firstname,
                    Middlename=y.Middlename,
                    Lastname = y.Lastname,
                    Salutation=y.Salutation,
                    Suffix=y.Suffix,
                    WorkEmail=y.WorkEmail,
                    WorkPhone=y.WorkPhone,
                    HomePhone=y.HomePhone,
                    PersonalEmail=y.PersonalEmail,
                    Mobile=y.Mobile,
                    UserProfile=y.UserProfile,
                    AddressLineOne = ToFullAddress(y.ParentAddress.FirstOrDefault().AddressLineOne, y.ParentAddress.FirstOrDefault().AddressLineTwo,
                        int.TryParse(y.ParentAddress.FirstOrDefault().City, out resultData) == true ? this.context.City.Where(x => x.Id == Convert.ToInt32(y.ParentAddress.FirstOrDefault().City)).FirstOrDefault().Name : y.ParentAddress.FirstOrDefault().City,
                        int.TryParse(y.ParentAddress.FirstOrDefault().State, out resultData) == true ? this.context.State.Where(x => x.Id == Convert.ToInt32(y.ParentAddress.FirstOrDefault().State)).FirstOrDefault().Name : y.ParentAddress.FirstOrDefault().State,
                        int.TryParse(y.ParentAddress.FirstOrDefault().Country, out resultData) == true ? this.context.Country.Where(x => x.Id == Convert.ToInt32(y.ParentAddress.FirstOrDefault().Country)).FirstOrDefault().Name : string.Empty, y.ParentAddress.FirstOrDefault().Zip)
                }).ToList();                
                parentInfoListModel.parentInfoForView = parentInfo;
                foreach (var ParentInfo in parentInfoListModel.parentInfoForView)
                {
                    var studentAssociateWithParents = this.context?.ParentAssociationship.Where(x => x.ParentId == ParentInfo.ParentId && x.Associationship == true).ToList();
                    List<string> studentArray = new List<string>();
                    if (studentAssociateWithParents.Count() > 0)
                    {
                        foreach (var studentAssociateWithParent in studentAssociateWithParents)
                        {
                            var student = this.context?.StudentMaster.FirstOrDefault(x => x.StudentId == studentAssociateWithParent.StudentId && x.SchoolId == studentAssociateWithParent.SchoolId && x.TenantId == studentAssociateWithParent.TenantId);
                            if (student != null)
                            {                               
                                studentArray.Add(student.FirstGivenName + " " + student.LastFamilyName + "|" + student.StudentId);
                                ParentInfo.students = studentArray.ToArray();
                            }
                        }
                    }
                }
                parentInfoListModel.TenantId = pageResult.TenantId;
                parentInfoListModel.TotalCount = totalCount;
                parentInfoListModel.PageNumber = 0;
                parentInfoListModel._pageSize = 0;
                parentInfoListModel._tenantName = pageResult._tenantName;
                parentInfoListModel._token = pageResult._token;
                parentInfoListModel._failure = false;
            }
            catch (Exception es)
            {
                parentInfoListModel._message = es.Message;
                parentInfoListModel._failure = true;
                parentInfoListModel._tenantName = pageResult._tenantName;
                parentInfoListModel._token = pageResult._token;
            }
            return parentInfoListModel;
        }
        /// <summary>
        /// Delete Parent Info
        /// </summary>
        /// <param name="parentInfoAddViewModel"></param>
        /// <returns></returns>
        public ParentInfoAddViewModel DeleteParentInfo(ParentInfoAddViewModel parentInfoAddViewModel)
        {
            try
            {
                var ParentInfo = this.context?.ParentInfo.FirstOrDefault(x => x.TenantId == parentInfoAddViewModel.parentInfo.TenantId && x.SchoolId == parentInfoAddViewModel.parentInfo.SchoolId && x.ParentId == parentInfoAddViewModel.parentInfo.ParentId);
                this.context?.ParentInfo.Remove(ParentInfo);
                this.context?.SaveChanges();
                parentInfoAddViewModel._failure = false;
                parentInfoAddViewModel._message = "Deleted";
            }
            catch (Exception es)
            {
                parentInfoAddViewModel._failure = true;
                parentInfoAddViewModel._message = es.Message;
            }
            return parentInfoAddViewModel;
        }
        /// <summary>
        /// Search ParentInfo For Student
        /// </summary>
        /// <param name="getAllParentInfoListForView"></param>
        /// <returns></returns>
        public GetAllParentInfoListForView SearchParentInfoForStudent(GetAllParentInfoListForView getAllParentInfoListForView)
        {
            int resultData;
            GetAllParentInfoListForView parentInfoListModel = new GetAllParentInfoListForView();
            try
            {
                var containParentId = this.context?.ParentAssociationship.Where(x => x.TenantId == getAllParentInfoListForView.TenantId && x.SchoolId == getAllParentInfoListForView.SchoolId && x.StudentId == getAllParentInfoListForView.StudentId && x.Associationship == true).Select(x => x.ParentId).ToList();                               
                string parentIDs = null;
                if(containParentId.Count()>0)
                {
                    parentIDs=string.Join(",", containParentId);
                }
                var ParentInfoList = this.context?.ParentInfo.Include(x=>x.ParentAddress).ToList().Where(x => x.TenantId == getAllParentInfoListForView.TenantId && (getAllParentInfoListForView.Firstname == null || (x.Firstname == getAllParentInfoListForView.Firstname)) && (getAllParentInfoListForView.Lastname == null || (x.Lastname == getAllParentInfoListForView.Lastname)) && (getAllParentInfoListForView.Email == null || (x.PersonalEmail == getAllParentInfoListForView.Email)) && (getAllParentInfoListForView.Mobile == null || (x.Mobile == getAllParentInfoListForView.Mobile)) && (getAllParentInfoListForView.StreetAddress == null || (x.ParentAddress.FirstOrDefault().AddressLineOne == getAllParentInfoListForView.StreetAddress)) && (getAllParentInfoListForView.City == null || (x.ParentAddress.FirstOrDefault().City == getAllParentInfoListForView.City)) && (getAllParentInfoListForView.State == null || (x.ParentAddress.FirstOrDefault().State == getAllParentInfoListForView.State)) && (getAllParentInfoListForView.Zip == null || (x.ParentAddress.FirstOrDefault().Zip == getAllParentInfoListForView.Zip)) && (parentIDs == null || (!parentIDs.Contains(x.ParentId.ToString())))); 
                var parentInfo = ParentInfoList.Select(y => new GetParentInfoForView
                {
                    SchoolId = y.SchoolId,
                    ParentId = y.ParentId,
                    Firstname = y.Firstname,
                    Lastname = y.Lastname,
                    Mobile = y.Mobile,
                    WorkPhone = y.WorkPhone,
                    HomePhone = y.HomePhone,
                    PersonalEmail = y.PersonalEmail,
                    WorkEmail = y.WorkEmail,
                    LoginEmail = y.LoginEmail,
                    UserProfile = y.UserProfile,
                    IsPortalUser = y.IsPortalUser,                    
                    TenantId = y.TenantId,
                    AddressLineOne = ToFullAddress(y.ParentAddress.FirstOrDefault().AddressLineOne, y.ParentAddress.FirstOrDefault().AddressLineTwo,
                int.TryParse(y.ParentAddress.FirstOrDefault().City, out resultData) == true ? this.context.City.Where(x => x.Id == Convert.ToInt32(y.ParentAddress.FirstOrDefault().City)).FirstOrDefault().Name : y.ParentAddress.FirstOrDefault().City,
                int.TryParse(y.ParentAddress.FirstOrDefault().State, out resultData) == true ? this.context.State.Where(x => x.Id == Convert.ToInt32(y.ParentAddress.FirstOrDefault().State)).FirstOrDefault().Name : y.ParentAddress.FirstOrDefault().State,
                int.TryParse(y.ParentAddress.FirstOrDefault().Country, out resultData) == true ? this.context.Country.Where(x => x.Id == Convert.ToInt32(y.ParentAddress.FirstOrDefault().Country)).FirstOrDefault().Name : string.Empty, y.ParentAddress.FirstOrDefault().Zip),
                }).ToList();
                parentInfoListModel.TenantId = getAllParentInfoListForView.TenantId;
                parentInfoListModel.parentInfoForView = parentInfo;
                parentInfoListModel._tenantName = getAllParentInfoListForView._tenantName;
                parentInfoListModel._token = getAllParentInfoListForView._token;
                parentInfoListModel._failure = false;
            }
            catch (Exception es)
            {
                parentInfoListModel._message = es.Message;
                parentInfoListModel._failure = true;
                parentInfoListModel._tenantName = getAllParentInfoListForView._tenantName;
                parentInfoListModel._token = getAllParentInfoListForView._token;
            }
            return parentInfoListModel;
        }
        /// <summary>
        /// View Parent Info By Id 
        /// </summary>
        /// <param name="parentInfoAddViewModel"></param>
        /// <returns></returns>
        public ParentInfoAddViewModel ViewParentInfo(ParentInfoAddViewModel parentInfoAddViewModel)
        {
            ParentInfoAddViewModel parentInfoViewModel = new ParentInfoAddViewModel();
            try
            {                
                var parentInfo = this.context?.ParentInfo.Include(x=>x.ParentAddress).FirstOrDefault( x =>x.TenantId== parentInfoAddViewModel.parentInfo.TenantId && x.SchoolId== parentInfoAddViewModel.parentInfo.SchoolId && x.ParentId== parentInfoAddViewModel.parentInfo.ParentId);
                if (parentInfo!= null)
                {
                    parentInfoViewModel.parentInfo = parentInfo;
                    var AssociationshipData = this.context?.ParentAssociationship.Where(x => x.TenantId == parentInfo.TenantId && x.SchoolId == parentInfo.SchoolId && x.ParentId == parentInfo.ParentId && x.Associationship == true).Select(s => s.StudentId).ToList();
                    if(AssociationshipData.Count() >0)
                    {
                        foreach (var studentAssociateWithParent in AssociationshipData)
                        {
                            var student = this.context?.StudentMaster.FirstOrDefault(x => x.StudentId == studentAssociateWithParent);
                            var studentForView = new GetStudentForView() { StudentId = student.StudentId, StudentInternalId = student.StudentInternalId, FirstGivenName = student.FirstGivenName, MiddleName = student.MiddleName, LastFamilyName = student.LastFamilyName };
                            parentInfoViewModel.getStudentForView.Add(studentForView);
                        }

                    }
                    //***********12/20 **********
                    //var AssociationshipData = parentInfo.Associationship;
                    //string[] studentAssociateWithParents = AssociationshipData.Split(" | ", StringSplitOptions.RemoveEmptyEntries);
                    //foreach (var studentAssociateWithParent in studentAssociateWithParents)
                    //{
                    //    char studentId = studentAssociateWithParent.Last();
                    //    var student = this.context?.StudentMaster.FirstOrDefault(x => x.StudentId == int.Parse(studentId.ToString()));
                    //    var studentForView = new GetStudentForView() { StudentId = student.StudentId, StudentInternalId=student.StudentInternalId, FirstGivenName = student.FirstGivenName, MiddleName = student.MiddleName, LastFamilyName = student.LastFamilyName };

                    //    parentInfoViewModel.getStudentForView.Add(studentForView);
                    //}
                    parentInfoViewModel._tenantName = parentInfoAddViewModel._tenantName;
                    parentInfoViewModel._token = parentInfoAddViewModel._token;
                    parentInfoViewModel._failure = false;
                }
                else
                {
                    parentInfoViewModel._failure = true;
                    parentInfoViewModel._message = NORECORDFOUND;
                    return parentInfoViewModel;
                }
            }
            catch (Exception es)
            {
                parentInfoViewModel._failure = true;
                parentInfoViewModel._message = es.Message;
            }
            return parentInfoViewModel;
        }
        /// <summary>
        /// Add Parent Info
        /// </summary>
        /// <param name="parentInfoAddViewModel"></param>
        /// <returns></returns>
        public ParentInfoAddViewModel AddParentInfo(ParentInfoAddViewModel parentInfoAddViewModel)
        {
            try
            {
                int? ParentId = Utility.GetMaxPK(this.context, new Func<ParentInfo, int>(x => x.ParentId));
                parentInfoAddViewModel.parentInfo.ParentId = (int)ParentId;
                parentInfoAddViewModel.parentInfo.LastUpdated = DateTime.UtcNow;
                parentInfoAddViewModel.parentInfo.LoginEmail = parentInfoAddViewModel.parentInfo.LoginEmail;
                this.context?.ParentInfo.Add(parentInfoAddViewModel.parentInfo);
                this.context?.SaveChanges();
                parentInfoAddViewModel._failure = false;
            }
            catch (Exception es)
            {
                parentInfoAddViewModel._failure = true;
                parentInfoAddViewModel._message = es.Message;
            }
            return parentInfoAddViewModel;
        }

        /// <summary>
        /// Remove Associated Parent
        /// </summary>
        /// <param name="parentInfoDeleteViewModel"></param>
        /// <returns></returns>
        public ParentInfoDeleteViewModel RemoveAssociatedParent(ParentInfoDeleteViewModel parentInfoDeleteViewModel)
        {
            try
            {
                var ParentInfo = this.context?.ParentAssociationship.FirstOrDefault(x => x.TenantId == parentInfoDeleteViewModel.parentInfo.TenantId && x.SchoolId == parentInfoDeleteViewModel.parentInfo.SchoolId && x.ParentId == parentInfoDeleteViewModel.parentInfo.ParentId && x.StudentId==parentInfoDeleteViewModel.StudentId);
                if (ParentInfo != null)
                {
                    ParentInfo.Associationship = false;
                    this.context?.SaveChanges();
                }
            }
            catch (Exception es)
            {
                parentInfoDeleteViewModel._failure = true;
                parentInfoDeleteViewModel._message = es.Message;
            }
            return parentInfoDeleteViewModel;
        }
    }
}
