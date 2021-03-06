﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using opensis.core.CalendarEvents.Interfaces;
using opensis.data.ViewModels.CalendarEvents;

namespace opensisAPI.Controllers
{
    [EnableCors("AllowOrigin")]
    [Route("{tenant}/CalendarEvent")]
    [ApiController]
    public class CalendarEventController : ControllerBase
    {
        private ICalendarEventService _calendarEventService;
        public CalendarEventController(ICalendarEventService calendarEventService)
        {
            _calendarEventService = calendarEventService;
        }


        [HttpPost("addCalendarEvent")]
        public ActionResult<CalendarEventAddViewModel> AddCalendarEvent(CalendarEventAddViewModel calendarEvent)
        {
            CalendarEventAddViewModel calendarEventAdd = new CalendarEventAddViewModel();
            try
            {
                calendarEventAdd = _calendarEventService.AddCalendarEvent(calendarEvent);
            }
            catch (Exception es)
            {
                calendarEventAdd._failure = true;
                calendarEventAdd._message = es.Message;
            }
            return calendarEventAdd;
        }

        [HttpPost("viewCalendarEvent")]
        public ActionResult<CalendarEventAddViewModel> ViewCalendarEvent(CalendarEventAddViewModel calendarEvent)
        {
            CalendarEventAddViewModel viewCalendar = new CalendarEventAddViewModel();
            try
            {
                viewCalendar = _calendarEventService.ViewCalendarEvent(calendarEvent);
            }
            catch (Exception es)
            {
                viewCalendar._failure = true;
                viewCalendar._message = es.Message;
            }
            return viewCalendar;
        }

        [HttpPut("updateCalendarEvent")]
        public ActionResult<CalendarEventAddViewModel> UpdateCalendarEvent(CalendarEventAddViewModel calendar)
        {
            CalendarEventAddViewModel calendarEventUpdate = new CalendarEventAddViewModel();
            try
            {
                calendarEventUpdate = _calendarEventService.UpdateCalendarEvent(calendar);
            }
            catch (Exception es)
            {
                calendarEventUpdate._failure = true;
                calendarEventUpdate._message = es.Message;
            }
            return calendarEventUpdate;
        }

        [HttpPost("getAllCalendarEvent")]
        public ActionResult<CalendarEventListViewModel> GetAllCalendarEvent(CalendarEventListViewModel calendarList)
        {
            CalendarEventListViewModel calendarEventListModel = new CalendarEventListViewModel();
            try
            {
                calendarEventListModel = _calendarEventService.GetAllCalendarEvent(calendarList);
            }
            catch (Exception es)
            {
                calendarEventListModel._message = es.Message;
                calendarEventListModel._failure = true;
            }
            return calendarEventListModel;
        }

        [HttpPost("deleteCalendarEvent")]
        public ActionResult<CalendarEventAddViewModel> DeleteCalendarEvent(CalendarEventAddViewModel calendarEvent)
        {
            CalendarEventAddViewModel deleteCalendarEvent = new CalendarEventAddViewModel();
            try
            {
                deleteCalendarEvent = _calendarEventService.DeleteCalendarEvent(calendarEvent);
            }
            catch (Exception es)
            {
                deleteCalendarEvent._failure = true;
                deleteCalendarEvent._message = es.Message;
            }
            return deleteCalendarEvent;
        }
    }
}
