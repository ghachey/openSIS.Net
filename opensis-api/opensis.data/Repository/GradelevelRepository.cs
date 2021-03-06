﻿using Microsoft.EntityFrameworkCore;
using opensis.data.Helper;
using opensis.data.Interface;
using opensis.data.Models;
using opensis.data.ViewModels.GradeLevel;
using opensis.data.ViewModels.School;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace opensis.data.Repository
{
    public class GradeLevelRepository : IGradelevelRepository
    {
        private CRMContext context;
        private static readonly string NORECORDFOUND = "No Record Found";
        public GradeLevelRepository(IDbContextFactory dbContextFactory)
        {
            this.context = dbContextFactory.Create();
        }


        /// <summary>
        /// Grade Level Add
        /// </summary>
        /// <param name="gradelevel"></param>
        /// <returns></returns>
        public GradelevelViewModel AddGradelevel(GradelevelViewModel gradelevel)
        {
            try
            {
                var checkGradelevelTitle = this.context?.Gradelevels.Where(x => x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.TenantId == gradelevel.tblGradelevel.TenantId && x.Title.ToLower() == gradelevel.tblGradelevel.Title.ToLower()).FirstOrDefault();

                if (checkGradelevelTitle !=null)
                {
                    gradelevel._failure = true;
                    gradelevel._message = "Gradelevel Title Already Exists";
                }
                else
                {
                    int? GradeLevelId = Utility.GetMaxPK(this.context, new Func<Gradelevels, int>(x => x.GradeId));
                    gradelevel.tblGradelevel.GradeId = (int)GradeLevelId;
                    this.context?.Gradelevels.Add(gradelevel.tblGradelevel);
                    this.context?.SaveChanges();
                    gradelevel._failure = false;
                    gradelevel._message = "Gradelevel Added Successsfully";
                }                
            }
            catch (Exception es)
            {
                gradelevel._failure = true;
                gradelevel._message = es.Message;
            }
            return gradelevel;

        }
        /// <summary>
        /// Get Grade Level by id
        /// </summary>
        /// <param name="gradelevel"></param>
        /// <returns></returns>
        public GradelevelViewModel ViewGradelevel(GradelevelViewModel gradelevel)
        {
            GradelevelViewModel gradelevelModel = new GradelevelViewModel();
            try
            {
                var Gradelevel = this.context?.Gradelevels.FirstOrDefault(x => x.TenantId == gradelevel.tblGradelevel.TenantId && x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.GradeId == gradelevel.tblGradelevel.GradeId);
                if (Gradelevel != null)
                {
                    gradelevelModel.tblGradelevel = Gradelevel;
                    gradelevelModel._failure = false;
                }
                else
                {
                    gradelevelModel._failure = true;
                    gradelevelModel._message = NORECORDFOUND;
                }
            }
            catch (Exception es)
            {
                gradelevelModel._failure = true;
                gradelevelModel._message = es.Message;
            }
            return gradelevelModel;

        }
        /// <summary>
        /// Update Grade Level
        /// </summary>
        /// <param name="gradelevel"></param>
        /// <returns></returns>
        public GradelevelViewModel UpdateGradelevel(GradelevelViewModel gradelevel)
        {
            GradelevelViewModel gradelevelUpdate = new GradelevelViewModel();
            try
            {
                var GradeLevel = this.context?.Gradelevels.FirstOrDefault(x => x.TenantId == gradelevel.tblGradelevel.TenantId && x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.GradeId == gradelevel.tblGradelevel.GradeId);

                if (GradeLevel != null)
                {
                    var checkGradelevelTitle = this.context?.Gradelevels.Where(x => x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.TenantId == gradelevel.tblGradelevel.TenantId && x.GradeId != gradelevel.tblGradelevel.GradeId && x.Title.ToLower() == gradelevel.tblGradelevel.Title.ToLower()).FirstOrDefault();

                    if (checkGradelevelTitle != null)
                    {
                        gradelevel._failure = true;
                        gradelevel._message = "Gradelevel Title Already Exists";
                    }
                    else
                    {
                        if (GradeLevel.Title.ToLower() != gradelevel.tblGradelevel.Title.ToLower())
                        {
                            var gradeTitleUsed = this.context?.GradeUsStandard.Where(x => x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.TenantId == gradelevel.tblGradelevel.TenantId && x.GradeLevel.ToLower() == GradeLevel.Title.ToLower()).ToList();

                            if (gradeTitleUsed.Count() > 0)
                            {
                                gradeTitleUsed.ForEach(x => x.GradeLevel = gradelevel.tblGradelevel.Title);
                            }

                            var gradeTitleUsedInCourse = this.context?.Course.Where(x => x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.TenantId == gradelevel.tblGradelevel.TenantId && x.CourseGradeLevel.ToLower() == GradeLevel.Title.ToLower()).ToList();

                            if (gradeTitleUsedInCourse.Count() > 0)
                            {
                                gradeTitleUsedInCourse.ForEach(x => x.CourseGradeLevel = gradelevel.tblGradelevel.Title);
                            }

                            var gradeTitleUsedInStudentEnrollment = this.context?.StudentEnrollment.Where(x => x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.TenantId == gradelevel.tblGradelevel.TenantId && x.GradeLevelTitle.ToLower() == GradeLevel.Title.ToLower()).ToList();

                            if (gradeTitleUsedInStudentEnrollment.Count() > 0)
                            {
                                gradeTitleUsedInStudentEnrollment.ForEach(x => x.GradeLevelTitle = gradelevel.tblGradelevel.Title);
                            }

                            var gradeTitleUsedInStaff = this.context?.StaffMaster.Where(x => x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.TenantId == gradelevel.tblGradelevel.TenantId && x.PrimaryGradeLevelTaught.ToLower() == GradeLevel.Title.ToLower()).ToList();

                            if (gradeTitleUsedInStaff.Count() > 0)
                            {
                                gradeTitleUsedInStaff.ForEach(x => x.PrimaryGradeLevelTaught = gradelevel.tblGradelevel.Title) ;
                            }

                            var StaffData = this.context?.StaffMaster.Where(x => x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.TenantId == gradelevel.tblGradelevel.TenantId && x.OtherGradeLevelTaught.ToLower().Contains(GradeLevel.Title.ToLower())).ToList();

                            if (StaffData.Count() > 0)
                            {
                                foreach (var staff in StaffData)
                                {
                                    var otherGradeLevelTaught = staff.OtherGradeLevelTaught.Split(",");
                                    otherGradeLevelTaught = otherGradeLevelTaught.Where(w => w != GradeLevel.Title).ToArray();
                                    var newOtherGradeLevelTaught = string.Join(",", otherGradeLevelTaught);
                                    newOtherGradeLevelTaught = newOtherGradeLevelTaught + "," + gradelevel.tblGradelevel.Title;
                                    staff.OtherSubjectTaught = newOtherGradeLevelTaught;
                                }
                            }

                        }

                        gradelevel.tblGradelevel.LastUpdated = DateTime.Now;
                        this.context.Entry(GradeLevel).CurrentValues.SetValues(gradelevel.tblGradelevel);
                        this.context?.SaveChanges();
                        gradelevel._failure = false;
                        gradelevel._message = "Gradelevel Updated Successsfully";
                    }
                }
                else
                {
                    gradelevel.tblGradelevel = null;
                    gradelevel._failure = true;
                    gradelevel._message = NORECORDFOUND;
                }
            }
            catch(Exception es)
            {
                gradelevel._failure = true;
                gradelevel._message = es.Message;
            }
            return gradelevel;
        }
        /// <summary>
        /// Delete grade Level
        /// </summary>
        /// <param name="gradelevel"></param>
        /// <returns></returns>
        public GradelevelViewModel DeleteGradelevel(GradelevelViewModel gradelevel)
        {
            try
            {
                var LinkedGradeLevels = this.context?.Gradelevels.Where(x => x.TenantId == gradelevel.tblGradelevel.TenantId && x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.NextGradeId == gradelevel.tblGradelevel.GradeId).ToList();
                if (LinkedGradeLevels.Count>0)
                {
                    gradelevel.tblGradelevel = null;
                    gradelevel._failure = true;
                    gradelevel._message = "GradeLevel cannot be deleted because it has its association";
                }
                else
                {
                    var GradeLevel = this.context?.Gradelevels.FirstOrDefault(x => x.TenantId == gradelevel.tblGradelevel.TenantId && x.SchoolId == gradelevel.tblGradelevel.SchoolId && x.GradeId == gradelevel.tblGradelevel.GradeId);
                    this.context?.Gradelevels.Remove(GradeLevel);
                    this.context?.SaveChanges();
                    gradelevel._failure = false;
                    gradelevel._message = "Gradelevel Deleted Successsfully";
                }
            }
            catch (Exception es)
            {
                gradelevel._failure = true;
                gradelevel._message = es.Message;
            }
            return gradelevel;
        }
        /// <summary>
        /// Get All GradeLevel
        /// </summary>
        /// <param name="gradelevelList"></param>
        /// <returns></returns>
        public GradelevelListViewModel GetAllGradeLevels(GradelevelListViewModel gradelevelList)
        {
            GradelevelListViewModel gradelevelListModel = new GradelevelListViewModel();
            try
            {

                var gradelevelsList = this.context?.Gradelevels.Include(x=>x.Equivalency)
                    .Where(x => x.TenantId == gradelevelList.TenantId && x.SchoolId==gradelevelList.SchoolId).OrderBy(x=>x.SortOrder).ToList();

                if (gradelevelsList.Count > 0)
                {
                    var gradeLevels = from gradelevel in gradelevelsList
                                      select new GradeLevelView()
                                      {
                                          GradeId = gradelevel.GradeId,
                                          LastUpdated = gradelevel.LastUpdated,
                                          NextGrade = this.context?.Gradelevels.FirstOrDefault(x => x.GradeId == gradelevel.NextGradeId)?.Title,
                                          NextGradeId = gradelevel.NextGradeId,
                                          SchoolId = gradelevel.SchoolId,
                                          Title = gradelevel.Title,
                                          ShortName = gradelevel.ShortName,
                                          SortOrder = gradelevel.SortOrder,
                                          TenantId = gradelevel.TenantId,
                                          GradeLevelEquivalency = gradelevel.Equivalency != null?gradelevel.Equivalency.GradeLevelEquivalency : null,
                                          EquivalencyId = gradelevel.EquivalencyId,
                                          AgeRangeId = gradelevel.AgeRangeId,
                                          IscedCode = gradelevel.IscedCode,
                                          //GradeDescription = gradelevel.IscedGradeLevelNavigation != null ? gradelevel.IscedGradeLevelNavigation.GradeDescription : null,
                                          //AgeRange=gradelevel.AgeRange,
                                          //EducationalStage=gradelevel.EducationalStage,
                                          //GradeLevelEquivalency=gradelevel.GradeLevelEquivalency,
                                          UpdatedBy = gradelevel.UpdatedBy
                                      };


                    gradelevelListModel.TableGradelevelList = gradeLevels.ToList();
                    gradelevelListModel._tenantName = gradelevelList._tenantName;
                    gradelevelListModel._token = gradelevelList._token;
                    gradelevelListModel._failure = false;
                }
                else
                {
                    gradelevelListModel._tenantName = gradelevelList._tenantName;
                    gradelevelListModel._token = gradelevelList._token;
                    gradelevelListModel._failure = true;
                    gradelevelListModel._message = NORECORDFOUND;
                }
            }
            catch (Exception es)
            {
                gradelevelListModel.TableGradelevelList = null;
                gradelevelListModel._message = es.Message;
                gradelevelListModel._failure = true;
                gradelevelListModel._tenantName = gradelevelList._tenantName;
                gradelevelListModel._token = gradelevelList._token;
            }
            return gradelevelListModel;

        }
        /// <summary>
        /// Get All GradeEquivalency
        /// </summary>
        /// <param name="gradeEquivalencyList"></param>
        /// <returns></returns>
        public GradeEquivalencyListViewModel GetAllGradeEquivalency(GradeEquivalencyListViewModel gradeEquivalencyList)
        {
            GradeEquivalencyListViewModel gradeEquivalencyListModel = new GradeEquivalencyListViewModel();
            try
            {
                var gradeEquivalency = this.context?.GradeEquivalency.ToList();
                gradeEquivalencyListModel.GradeEquivalencyList = gradeEquivalency;
                gradeEquivalencyListModel._tenantName = gradeEquivalencyList._tenantName;
                gradeEquivalencyListModel._token = gradeEquivalencyList._token;

                if (gradeEquivalency.Count > 0)
                {
                    gradeEquivalencyListModel._failure = false;
                }
                else
                {
                    gradeEquivalencyListModel._failure = true;
                    gradeEquivalencyListModel._message = NORECORDFOUND;
                }
            }
            catch (Exception es)
            {
                gradeEquivalencyListModel._message = es.Message;
                gradeEquivalencyListModel._failure = true;
                gradeEquivalencyListModel._tenantName = gradeEquivalencyList._tenantName;
                gradeEquivalencyListModel._token = gradeEquivalencyList._token;
            }
            return gradeEquivalencyListModel;

        }

    }
}
