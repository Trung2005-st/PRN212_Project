using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Microsoft.EntityFrameworkCore;

namespace DataAccessLayer
{
    public class CounselingScheduleDAO
    {
        Prn212ProjectDbContext dbContext = new Prn212ProjectDbContext();
        public List<CounselingSchedule> getAllCounselingSchedules()
        {
            return dbContext.CounselingSchedules
                .Include(cs => cs.User)
                 .Include(cs => cs.Counselor)
                .ToList();
        }
        public bool AddCounselingSchedule(CounselingSchedule schedule)
        {
            if (schedule == null)
            {
                return false;
            }
            else
            {
                dbContext.CounselingSchedules.Add(schedule);
                dbContext.SaveChanges();
                return true;
            }
        }
        public bool UpdateCounselingSchedule(CounselingSchedule schedule)
        {
            if (schedule == null)
            {
                return false;
            }
            else
            {
                var existingSchedule = dbContext.CounselingSchedules.Find(schedule.ScheduleId);
                if (existingSchedule != null)
                {
                    existingSchedule.UserId = schedule.UserId;
                    existingSchedule.CounselorId = schedule.CounselorId;
                    existingSchedule.ScheduleTime = schedule.ScheduleTime;
                    existingSchedule.Topic = schedule.Topic;
                    existingSchedule.IsConfirmed = schedule.IsConfirmed;
                    dbContext.SaveChanges();
                    return true;
                }
                return false;
            }
        }

        public bool DeleteCounselingSchedule(int scheduleId)
        {
            var schedule = dbContext.CounselingSchedules.Find(scheduleId);
            if (schedule != null)
            {
                dbContext.CounselingSchedules.Remove(schedule);
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }

        public bool updateScheduleStatus(CounselingSchedule scheduleId)
        {
            var schedule = dbContext.CounselingSchedules.Find(scheduleId);
            if (schedule != null)
            {
                if (schedule.IsConfirmed == true)
                {
                    schedule.IsConfirmed = false;
                }
                else
                {
                    schedule.IsConfirmed = true;
                }
                dbContext.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
