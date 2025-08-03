using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace Service
{
    public interface ICounselingScheduleService 
    {
        public List<CounselingSchedule> getAllCounselingSchedules();
        public bool AddCounselingSchedule(CounselingSchedule schedule);
        public bool UpdateCounselingSchedule(CounselingSchedule schedule);
        public bool DeleteCounselingSchedule(int scheduleId);
        public bool updateScheduleStatus(CounselingSchedule scheduleId);
    }
}
