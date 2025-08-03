using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccessLayer;

namespace Repositories
{
    public class CounselingScheduleRepository : ICounselingScheduleRepository
    {
        CounselingScheduleDAO counselingScheduleDAO = new CounselingScheduleDAO();
        public bool AddCounselingSchedule(CounselingSchedule schedule)
        {
            return counselingScheduleDAO.AddCounselingSchedule(schedule);
        }

        public bool DeleteCounselingSchedule(int scheduleId)
        {
            return counselingScheduleDAO.DeleteCounselingSchedule(scheduleId);
        }

        public List<CounselingSchedule> getAllCounselingSchedules()
        {
            return counselingScheduleDAO.getAllCounselingSchedules();
        }

        public bool UpdateCounselingSchedule(CounselingSchedule schedule)
        {
            return counselingScheduleDAO.UpdateCounselingSchedule(schedule);
        }

        public bool updateScheduleStatus(CounselingSchedule scheduleId)
        {
            return counselingScheduleDAO.updateScheduleStatus(scheduleId);
        }
    }
}
