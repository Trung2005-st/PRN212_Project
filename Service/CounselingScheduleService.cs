using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Repositories;

namespace Service
{
    public class CounselingScheduleService : ICounselingScheduleService
    {
        ICounselingScheduleRepository repository;
        public CounselingScheduleService()
        {
            repository = new CounselingScheduleRepository();
        }
        public bool AddCounselingSchedule(CounselingSchedule schedule)
        {
            return repository.AddCounselingSchedule(schedule);
        }

        public bool DeleteCounselingSchedule(int scheduleId)
        {
            return repository.DeleteCounselingSchedule(scheduleId);
        }

        public List<CounselingSchedule> getAllCounselingSchedules()
        {
            return repository.getAllCounselingSchedules();
        }

        public bool UpdateCounselingSchedule(CounselingSchedule schedule)
        {
            return repository.UpdateCounselingSchedule(schedule);
        }

        public bool updateScheduleStatus(CounselingSchedule scheduleId)
        {
            return repository.updateScheduleStatus(scheduleId);
        }
    }
}
