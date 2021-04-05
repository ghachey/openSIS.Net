﻿using opensis.data.Helper;
using opensis.data.Interface;
using opensis.data.Models;
using opensis.data.ViewModels.StudentSchedule;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace opensis.data.Repository
{
    public class StudentScheduleRepository : IStudentScheduleRepository
    {
        private CRMContext context;
        private static readonly string NORECORDFOUND = "No Record Found";
        public StudentScheduleRepository(IDbContextFactory dbContextFactory)
        {
            this.context = dbContextFactory.Create();
        }

        /// <summary>
        /// Add Student Course Section Schedule
        /// </summary>
        /// <param name="studentCourseSectionScheduleAddViewModel"></param>
        /// <returns></returns>
        public StudentCourseSectionScheduleAddViewModel AddStudentCourseSectionSchedule(StudentCourseSectionScheduleAddViewModel studentCourseSectionScheduleAddViewModel)
        {
            using (var transaction = this.context.Database.BeginTransaction())
            {                
                try
                {
                    string conflictMessage = "All Student Scheduled Successfully";
                    if (studentCourseSectionScheduleAddViewModel.courseSectionList.Count > 0)
                    {
                        int restSeats = 0;
                        List<StudentMaster> studentData = null;

                        foreach (var courseSection in studentCourseSectionScheduleAddViewModel.courseSectionList)
                        {
                            var studentCourseSectionScheduleData = this.context?.StudentCoursesectionSchedule.Where(c => c.SchoolId == courseSection.SchoolId && c.TenantId == courseSection.TenantId && c.CourseSectionId == courseSection.CourseSectionId && c.AcademicYear == courseSection.AcademicYear).ToList();

                            if (studentCourseSectionScheduleData.Count > 0)
                            {

                                restSeats = (int)courseSection.Seats - studentCourseSectionScheduleData.Count;
                            }
                            else
                            {
                                restSeats = (int)courseSection.Seats;
                            }

                            if (restSeats > 0)
                            {
                                if (studentCourseSectionScheduleAddViewModel.studentMasterList.Count > 0)
                                {
                                    if (restSeats < studentCourseSectionScheduleAddViewModel.studentMasterList.Count)
                                    {
                                        studentData = studentCourseSectionScheduleAddViewModel.studentMasterList.Take(restSeats).ToList();
                                        
                                        if (studentData.Count > 0)
                                        {
                                            var restStudentCount = studentCourseSectionScheduleAddViewModel.studentMasterList.Count - studentData.Count;
                                            
                                            if (restStudentCount > 0)
                                            {
                                                var restStudentList = studentCourseSectionScheduleAddViewModel.studentMasterList.TakeLast(restStudentCount).ToList();
                                                
                                                if (restStudentList.Count>0)
                                                {
                                                    foreach (var restStudent in restStudentList)
                                                    {
                                                        var conflictStudent = new StudentScheduleView()
                                                        {
                                                            TenantId = restStudent.TenantId,
                                                            SchoolId = restStudent.SchoolId,
                                                            StudentId = restStudent.StudentId,
                                                            CourseId = courseSection.CourseId,
                                                            CourseSectionId = courseSection.CourseSectionId,
                                                            CourseSectionName = courseSection.CourseSectionName,
                                                            StudentInternalId = restStudent.StudentInternalId,
                                                            StudentName = restStudent.FirstGivenName,
                                                            Scheduled = false,
                                                            ConflictComment = "Seats Not Avalaible"
                                                        };
                                                        this.context?.StudentScheduleView.Add(conflictStudent);
                                                        conflictMessage = "Some Student could not be scheduled due to conflicts.Please find the detailed report below.";
                                                    }
                                                }
                                            }
                                        }                                        
                                    }
                                    else
                                    {
                                        studentData = studentCourseSectionScheduleAddViewModel.studentMasterList.ToList();
                                    }

                                    if (studentData.Count > 0)
                                    {
                                        foreach (var student in studentData)
                                        {
                                            var studentCourseSectionSchedule = this.context?.StudentCoursesectionSchedule.FirstOrDefault(c => c.SchoolId == student.SchoolId && c.TenantId == student.TenantId && c.StudentId == student.StudentId && c.CourseSectionId == courseSection.CourseSectionId && c.AcademicYear == courseSection.AcademicYear);

                                            if (studentCourseSectionSchedule != null)
                                            {
                                                var conflictStudent = new StudentScheduleView()
                                                {
                                                    TenantId = student.TenantId,
                                                    SchoolId = student.SchoolId,
                                                    StudentId = student.StudentId,
                                                    CourseId = courseSection.CourseId,
                                                    CourseSectionId = courseSection.CourseSectionId,
                                                    CourseSectionName = courseSection.CourseSectionName,
                                                    StudentInternalId = student.StudentInternalId,
                                                    StudentName = student.FirstGivenName,
                                                    Scheduled = false,
                                                    ConflictComment = "Student is already scheduled in the course section"
                                                };
                                                this.context.StudentScheduleView.Add(conflictStudent);
                                                conflictMessage = "Some Student could not be scheduled due to conflicts.Please find the detailed report below.";
                                            }
                                            else
                                            {
                                                if (courseSection.AllowStudentConflict != null && (bool)courseSection.AllowStudentConflict)
                                                {
                                                    var studentCourseScheduling = new StudentCoursesectionSchedule()
                                                    {
                                                        TenantId = courseSection.TenantId,
                                                        SchoolId = courseSection.SchoolId,
                                                        StudentId = student.StudentId,
                                                        CourseId = courseSection.CourseId,
                                                        CourseSectionId = courseSection.CourseSectionId,
                                                        StudentGuid = student.StudentGuid,
                                                        AlternateId = student.AlternateId,
                                                        StudentInternalId = student.StudentInternalId,
                                                        FirstGivenName = student.FirstGivenName,
                                                        MiddleName = student.MiddleName,
                                                        LastFamilyName = student.LastFamilyName,
                                                        FirstLanguageId = student.FirstLanguageId,
                                                        GradeId = student.StudentEnrollment.FirstOrDefault().GradeId,
                                                        AcademicYear = (decimal)courseSection.AcademicYear,
                                                        GradeScaleId = courseSection.GradeScaleId,
                                                        CourseSectionName = courseSection.CourseSectionName,
                                                        CalendarId = courseSection.CalendarId,
                                                        CreatedBy = studentCourseSectionScheduleAddViewModel.CreatedBy,
                                                        CreatedOn = DateTime.UtcNow
                                                    };
                                                    this.context.StudentCoursesectionSchedule.Add(studentCourseScheduling);

                                                    var conflictStudent = new StudentScheduleView()
                                                    {
                                                        TenantId = student.TenantId,
                                                        SchoolId = student.SchoolId,
                                                        StudentId = student.StudentId,
                                                        CourseId = courseSection.CourseId,
                                                        CourseSectionId = courseSection.CourseSectionId,
                                                        CourseSectionName = courseSection.CourseSectionName,
                                                        StudentInternalId = student.StudentInternalId,
                                                        StudentName = student.FirstGivenName,
                                                        Scheduled = true,
                                                    };
                                                    this.context?.StudentScheduleView.Add(conflictStudent);
                                                }
                                                else
                                                {
                                                    var courseSectionAllData = this.context?.AllCourseSectionView.Where(c => c.TenantId == courseSection.TenantId && c.SchoolId == courseSection.SchoolId && c.CourseSectionId == courseSection.CourseSectionId).ToList();


                                                    if (courseSectionAllData.Count > 0)
                                                    {
                                                        bool isPeriodConflict = false;

                                                        foreach (var courseSectionAll in courseSectionAllData)
                                                        {                                                            
                                                            var courseSectionData = this.context?.AllCourseSectionView.
                                                                                   Join(this.context?.StudentCoursesectionSchedule,
                                                                                   acsv => acsv.CourseSectionId, scs => scs.CourseSectionId,
                                                                                   (acsv, scs) => new { acsv, scs }).AsEnumerable().Where(x => x.scs.SchoolId == courseSection.SchoolId && x.scs.StudentId == student.StudentId && x.acsv.DurationEndDate > courseSectionAll.DurationStartDate
                                                                                   &&
                                                                                   (
                                                                                   courseSectionAll.FixedPeriodId != null && ((x.acsv.FixedPeriodId == courseSectionAll.FixedPeriodId || x.acsv.VarPeriodId == courseSectionAll.FixedPeriodId || x.acsv.CalPeriodId == courseSectionAll.FixedPeriodId) && ((x.acsv.FixedDays != null && (Regex.IsMatch(courseSectionAll.FixedDays.ToLower(), x.acsv.FixedDays.ToLower(), RegexOptions.IgnoreCase))) || (x.acsv.VarDay != null && (courseSectionAll.FixedDays.ToLower().Contains(x.acsv.VarDay.ToLower()))) || (x.acsv.CalDay != null && (courseSectionAll.FixedDays.ToLower().Contains(x.acsv.CalDay.ToLower())))))
                                                                                   ||
                                                                                   courseSectionAll.VarPeriodId != null && ((x.acsv.FixedPeriodId == courseSectionAll.VarPeriodId || x.acsv.VarPeriodId == courseSectionAll.VarPeriodId || x.acsv.CalPeriodId == courseSectionAll.VarPeriodId) && ((x.acsv.FixedDays != null && (Regex.IsMatch(courseSectionAll.VarDay.ToLower(), x.acsv.FixedDays.ToLower(), RegexOptions.IgnoreCase))) || (x.acsv.VarDay != null && (courseSectionAll.VarDay.ToLower().Contains(x.acsv.VarDay.ToLower()))) || (x.acsv.CalDay != null && (courseSectionAll.VarDay.ToLower().Contains(x.acsv.CalDay.ToLower())))))
                                                                                   ||
                                                                                   courseSectionAll.CalPeriodId != null && ((x.acsv.FixedPeriodId == courseSectionAll.CalPeriodId || x.acsv.VarPeriodId == courseSectionAll.CalPeriodId || x.acsv.CalPeriodId == courseSectionAll.CalPeriodId) && ((x.acsv.FixedDays != null && (Regex.IsMatch(courseSectionAll.CalDay.ToLower(), x.acsv.FixedDays.ToLower(), RegexOptions.IgnoreCase))) || (x.acsv.VarDay != null && (courseSectionAll.CalDay.ToLower().Contains(x.acsv.VarDay.ToLower()))) || (x.acsv.CalDay != null && (courseSectionAll.CalDay.ToLower().Contains(x.acsv.CalDay.ToLower())))))
                                                                                   )
                                                                                );

                                                            if (courseSectionData.ToList().Count > 0)
                                                            {
                                                                isPeriodConflict = true;
                                                                break;
                                                            }
                                                        }
                                                        if (!(bool)isPeriodConflict)
                                                        {
                                                            var studentCourseScheduling = new StudentCoursesectionSchedule()
                                                            {
                                                                TenantId = courseSection.TenantId,
                                                                SchoolId = courseSection.SchoolId,
                                                                StudentId = student.StudentId,
                                                                CourseId = courseSection.CourseId,
                                                                CourseSectionId = courseSection.CourseSectionId,
                                                                StudentGuid = student.StudentGuid,
                                                                AlternateId = student.AlternateId,
                                                                StudentInternalId = student.StudentInternalId,
                                                                FirstGivenName = student.FirstGivenName,
                                                                MiddleName = student.MiddleName,
                                                                LastFamilyName = student.LastFamilyName,
                                                                FirstLanguageId = (int)student.FirstLanguageId,
                                                                GradeId = student.StudentEnrollment.FirstOrDefault().GradeId,
                                                                AcademicYear = (decimal)courseSection.AcademicYear,
                                                                GradeScaleId = courseSection.GradeScaleId,
                                                                CourseSectionName = courseSection.CourseSectionName,
                                                                CalendarId = courseSection.CalendarId,
                                                                CreatedBy = studentCourseSectionScheduleAddViewModel.CreatedBy,
                                                                CreatedOn = DateTime.UtcNow
                                                            };
                                                            this.context?.StudentCoursesectionSchedule.Add(studentCourseScheduling);

                                                            var conflictStudent = new StudentScheduleView()
                                                            {
                                                                TenantId = student.TenantId,
                                                                SchoolId = student.SchoolId,
                                                                StudentId = student.StudentId,
                                                                CourseId = courseSection.CourseId,
                                                                CourseSectionId = courseSection.CourseSectionId,
                                                                CourseSectionName = courseSection.CourseSectionName,
                                                                StudentInternalId = student.StudentInternalId,
                                                                StudentName = student.FirstGivenName,
                                                                Scheduled = true,
                                                            };
                                                            this.context?.StudentScheduleView.Add(conflictStudent);
                                                        }
                                                        else
                                                        {
                                                            var conflictStudent = new StudentScheduleView()
                                                            {
                                                                TenantId = student.TenantId,
                                                                SchoolId = student.SchoolId,
                                                                StudentId = student.StudentId,
                                                                CourseId = courseSection.CourseId,
                                                                CourseSectionId = courseSection.CourseSectionId,
                                                                CourseSectionName = courseSection.CourseSectionName,
                                                                StudentInternalId = student.StudentInternalId,
                                                                StudentName = student.FirstGivenName,
                                                                Scheduled = false,
                                                                ConflictComment = "There is a period conflict"
                                                            };
                                                            this.context?.StudentScheduleView.Add(conflictStudent);
                                                            conflictMessage = "Some Student could not be scheduled due to conflicts.Please find the detailed report below.";
                                                        }
                                                    }
                                                    else
                                                    {
                                                        studentCourseSectionScheduleAddViewModel._failure = true;
                                                        studentCourseSectionScheduleAddViewModel._message = "Course Section Does Not Exist";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    studentCourseSectionScheduleAddViewModel._message = "Select Atleast One Student";
                                    studentCourseSectionScheduleAddViewModel._failure = true;
                                    studentCourseSectionScheduleAddViewModel.ConflictMessage = null;
                                    return studentCourseSectionScheduleAddViewModel;
                                }
                            }
                            else
                            {
                                if (studentCourseSectionScheduleAddViewModel.studentMasterList.Count>0)
                                {
                                    foreach (var studentMaster in studentCourseSectionScheduleAddViewModel.studentMasterList)
                                    {
                                        var conflictStudent = new StudentScheduleView()
                                        {
                                            TenantId = studentMaster.TenantId,
                                            SchoolId = studentMaster.SchoolId,
                                            StudentId = studentMaster.StudentId,
                                            CourseId = courseSection.CourseId,
                                            CourseSectionId = courseSection.CourseSectionId,
                                            CourseSectionName = courseSection.CourseSectionName,
                                            StudentInternalId = studentMaster.StudentInternalId,
                                            StudentName = studentMaster.FirstGivenName,
                                            Scheduled = false,
                                            ConflictComment = "Seats Not Avalaible"
                                        };
                                        this.context?.StudentScheduleView.Add(conflictStudent);
                                        conflictMessage = "Some Student could not be scheduled due to conflicts.Please find the detailed report below.";
                                    }
                                }                               
                            }
                        }
                        var studentScheduleViewData = this.context?.StudentScheduleView.Where(e => e.SchoolId == studentCourseSectionScheduleAddViewModel.SchoolId && e.TenantId == studentCourseSectionScheduleAddViewModel.TenantId).ToList();

                        if (studentScheduleViewData.Count>0)
                        {
                            this.context?.StudentScheduleView.RemoveRange(studentScheduleViewData);
                        }
                        this.context?.SaveChanges();
                        transaction.Commit();
                        studentCourseSectionScheduleAddViewModel._message = "Student Schedule Added Successfully";
                        studentCourseSectionScheduleAddViewModel.ConflictMessage = conflictMessage;
                        studentCourseSectionScheduleAddViewModel._failure = false;
                    }
                    else
                    {
                        studentCourseSectionScheduleAddViewModel._message = "Select Atleast One Course Section";
                        studentCourseSectionScheduleAddViewModel.ConflictMessage = null;
                        studentCourseSectionScheduleAddViewModel._failure = true;
                        return studentCourseSectionScheduleAddViewModel;
                    }
                }
                catch (Exception es)
                {
                    transaction.Rollback();
                    studentCourseSectionScheduleAddViewModel._failure = true;
                    studentCourseSectionScheduleAddViewModel.ConflictMessage = null;
                    studentCourseSectionScheduleAddViewModel._message = es.Message;
                }
            }
            return studentCourseSectionScheduleAddViewModel;
        }
        /// <summary>
        /// Search Scheduled Student For Group Drop
        /// </summary>
        /// <param name="scheduleStudentListViewModel"></param>
        /// <returns></returns>
        public ScheduleStudentListViewModel SearchScheduledStudentForGroupDrop(PageResult pageResult)
        {
            ScheduleStudentListViewModel scheduleStudentListView = new ScheduleStudentListViewModel();
            IQueryable<ScheduleStudentForView> transactionIQ = null;
            try
            {
                var scheduledStudentData = this.context?.StudentCoursesectionSchedule.
                                    Join(this.context?.StudentMaster,
                                    scs => scs.StudentId, sm => sm.StudentId,
                                    (scs, sm) => new { scs, sm }).Where(c => c.scs.TenantId == pageResult.TenantId && c.scs.SchoolId == pageResult.SchoolId && c.scs.CourseSectionId == pageResult.CourseSectionId && c.sm.SchoolId == pageResult.SchoolId && c.sm.TenantId == pageResult.TenantId).ToList().Select(ssv => new ScheduleStudentForView
                                    {
                                        SchoolId = ssv.sm.SchoolId,
                                        TenantId = ssv.sm.TenantId,
                                        StudentId = ssv.sm.StudentId,
                                        FirstGivenName = ssv.sm.FirstGivenName,
                                        LastFamilyName = ssv.sm.LastFamilyName,
                                        AlternateId = ssv.sm.AlternateId,
                                        GradeLevel = this.context.Gradelevels.FirstOrDefault(c => c.TenantId == ssv.sm.TenantId && c.SchoolId == ssv.sm.SchoolId && c.GradeId == ssv.scs.GradeId)?.Title,
                                        Section = this.context.Sections.FirstOrDefault(c => c.TenantId == ssv.sm.TenantId && c.SchoolId == ssv.sm.SchoolId && c.SectionId == ssv.sm.SectionId)?.Name,
                                        PhoneNumber = ssv.sm.MobilePhone,
                                        Action = ssv.scs.IsDropped,
                                        ScheduleDate = ssv.scs.CreatedOn
                                    }).ToList();

                if (scheduledStudentData.Count > 0)
                {
                    if (pageResult.FilterParams == null || pageResult.FilterParams.Count == 0)
                    {
                        transactionIQ = scheduledStudentData.AsQueryable();
                    }
                    else
                    {
                        if (pageResult.FilterParams != null && pageResult.FilterParams.ElementAt(0).ColumnName == null && pageResult.FilterParams.Count == 1)
                        {
                            string Columnvalue = pageResult.FilterParams.ElementAt(0).FilterValue;

                            transactionIQ = scheduledStudentData.Where(x => x.FirstGivenName.ToLower().Contains(Columnvalue.ToLower()) || x.LastFamilyName.ToLower().Contains(Columnvalue.ToLower()) || x.GradeLevel.ToLower().Contains(Columnvalue.ToLower()) || x.ScheduleDate.ToString() == Columnvalue).AsQueryable();
                        }
                        else
                        {
                            transactionIQ = Utility.FilteredData(pageResult.FilterParams, scheduledStudentData).AsQueryable();
                        }
                        transactionIQ = transactionIQ.Distinct();
                    }
                    if (pageResult.SortingModel != null)
                    {
                        switch (pageResult.SortingModel.SortColumn.ToLower())
                        {
                            default:
                                transactionIQ = Utility.Sort(transactionIQ, pageResult.SortingModel.SortColumn, pageResult.SortingModel.SortDirection.ToLower());
                                break;
                        }

                    }

                    int totalCount = transactionIQ.Count();
                    if (pageResult.PageNumber > 0 && pageResult.PageSize > 0)
                    {
                        transactionIQ = transactionIQ.Skip((pageResult.PageNumber - 1) * pageResult.PageSize).Take(pageResult.PageSize);
                    }
                    scheduleStudentListView.scheduleStudentForView = transactionIQ.ToList();
                    scheduleStudentListView.TotalCount = totalCount;
                }
                else
                {
                    scheduleStudentListView.scheduleStudentForView = scheduledStudentData;
                    scheduleStudentListView._failure = false;
                    scheduleStudentListView._message = NORECORDFOUND;
                }

                scheduleStudentListView.TenantId = pageResult.TenantId;
                scheduleStudentListView.SchoolId = pageResult.SchoolId;
                scheduleStudentListView.CourseSectionId = pageResult.CourseSectionId;
                scheduleStudentListView.PageNumber = pageResult.PageNumber;
                scheduleStudentListView._pageSize = pageResult.PageSize;
                scheduleStudentListView._tenantName = pageResult._tenantName;
                scheduleStudentListView._token = pageResult._token;
                scheduleStudentListView._failure = false;
            }
            catch (Exception es)
            {
                scheduleStudentListView._failure = true;
                scheduleStudentListView._message = es.Message; ;
            }
            return scheduleStudentListView;

        }

        /// <summary>
        /// Group Drop For Scheduled Student
        /// </summary>
        /// <param name="scheduledStudentDropModel"></param>
        /// <returns></returns>
        public ScheduledStudentDropModel GroupDropForScheduledStudent(ScheduledStudentDropModel scheduledStudentDropModel)
        {
            try
            {
                var currentDate = DateTime.UtcNow.Date;
                if (scheduledStudentDropModel.studentCoursesectionScheduleList.Count>0)
                {
                    if (scheduledStudentDropModel.EffectiveDropDate.Value.Date >= currentDate)
                    {
                        foreach (var scheduledStudent in scheduledStudentDropModel.studentCoursesectionScheduleList)
                        {
                            var studentData = this.context?.StudentCoursesectionSchedule.FirstOrDefault(x => x.SchoolId == scheduledStudent.SchoolId && x.TenantId == scheduledStudent.TenantId && x.StudentId == scheduledStudent.StudentId && x.CourseSectionId == scheduledStudentDropModel.CourseSectionId);

                            if (studentData != null)
                            {
                                studentData.IsDropped = true;
                                studentData.EffectiveDropDate = scheduledStudentDropModel.EffectiveDropDate;
                                this.context?.UpdateRange(studentData);
                            }
                            else
                            {
                                scheduledStudentDropModel._message = NORECORDFOUND;
                                scheduledStudentDropModel._failure = true;
                            }
                        }
                        this.context?.SaveChanges();
                        scheduledStudentDropModel._failure = false;
                        scheduledStudentDropModel._message = "Selected students have been dropped from the course section.";
                    }
                    else
                    {
                        scheduledStudentDropModel._message = "Effective Drop Date Must Be Equal or Greater Than Current Date";
                        scheduledStudentDropModel._failure = true;
                    }
                    
                }
                else
                {
                    scheduledStudentDropModel._message = "Select Atleast One Student";
                    scheduledStudentDropModel._failure = true;
                }
            }
            catch (Exception es)
            {

                scheduledStudentDropModel._failure = true;
                scheduledStudentDropModel._message = es.Message;
            }
            return scheduledStudentDropModel;
        }

        public StudentScheduleReportViewModel StudentScheduleReport(StudentScheduleReportViewModel studentScheduleReportViewModel)
        {
            StudentScheduleReportViewModel studentScheduleReportView = new StudentScheduleReportViewModel();
            try
            {
                var scheduleReport = this.context?.StudentScheduleView.Where(x => x.SchoolId == studentScheduleReportViewModel.SchoolId).ToPivotTable(
                    item => item.CourseSectionName,
                    item => new { item.StudentId, item.StudentName, item.StudentInternalId },
                    items => items.Any() ? items.First().Scheduled + " | " + items.First().ConflictComment : null);

                studentScheduleReportView.ScheduleReport = scheduleReport;

                studentScheduleReportView.TenantId = studentScheduleReportViewModel.TenantId;
                studentScheduleReportView.SchoolId = studentScheduleReportViewModel.SchoolId;
            }
            catch (Exception es)
            {
                studentScheduleReportViewModel._failure = true;
                studentScheduleReportViewModel._message = es.Message;
            }

            return studentScheduleReportView;
        }

        /// <summary>
        /// Delete Student Schedule Report
        /// </summary>
        /// <param name="studentCourseSectionScheduleAddViewModel"></param>
        /// <returns></returns>
        public StudentCourseSectionScheduleAddViewModel DeleteStudentScheduleReport(StudentCourseSectionScheduleAddViewModel studentCourseSectionScheduleAddViewModel)
        {
            try
            {
                var studentScheduleViewData = this.context?.StudentScheduleView.Where(e => e.SchoolId == studentCourseSectionScheduleAddViewModel.SchoolId && e.TenantId == studentCourseSectionScheduleAddViewModel.TenantId).ToList();

                if (studentScheduleViewData.Count > 0)
                {
                    this.context?.StudentScheduleView.RemoveRange(studentScheduleViewData);
                    this.context?.SaveChanges();
                    studentCourseSectionScheduleAddViewModel._failure = false;
                    studentCourseSectionScheduleAddViewModel._message = "Student Schedule Report Deleted Successfully";
                }
                else
                {
                    studentCourseSectionScheduleAddViewModel._message = NORECORDFOUND;
                    studentCourseSectionScheduleAddViewModel._failure = true;
                }
            }
            catch (Exception es)
            {
                studentCourseSectionScheduleAddViewModel._failure = true;
                studentCourseSectionScheduleAddViewModel._message = es.Message;
            }
            return studentCourseSectionScheduleAddViewModel;
        }
    }
}