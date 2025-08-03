using BusinessObject;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class DailyChecklistService : IDailyChecklistService
    {
        private readonly IDailyChecklistRepository _repo = new DailyChecklistRepository();

        public List<DailyChecklist> GetChecklistByPlan(int quitPlanId)
        {
            return _repo.GetChecklistByPlan(quitPlanId);
        }
    }
}