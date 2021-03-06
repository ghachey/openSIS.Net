﻿using opensis.data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace opensis.data.ViewModels.CourseManager
{
    public class GetCourseSectionForView
    {
        public GetCourseSectionForView()
        {
            courseVariableSchedule = new List<CourseVariableSchedule>();
            courseBlockSchedule = new List<CourseBlockSchedule>();
            courseCalendarSchedule = new List<CourseCalendarSchedule>();
        }
        public CourseSection courseSection { get; set; }
        public CourseFixedSchedule courseFixedSchedule { get; set; }
        public List<CourseVariableSchedule> courseVariableSchedule { get; set; }
        public List<CourseCalendarSchedule> courseCalendarSchedule { get; set; }
        public List<CourseBlockSchedule> courseBlockSchedule { get; set; }
        public string MarkingPeriod { get; set; }
        public string StandardGradeScaleName { get; set; }
        public int? AvailableSeat { get; set; }
        public int? TotalStudentSchedule { get; set; }
        public int? TotalStaffSchedule { get; set; }
        public string StaffName { get; set; }
    }
}
