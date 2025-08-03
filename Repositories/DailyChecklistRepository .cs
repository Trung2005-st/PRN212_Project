using BusinessObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class DailyChecklistRepository : IDailyChecklistRepository
    {
        private readonly DailyChecklistDAO dao = new DailyChecklistDAO();

        public List<DailyChecklist> GetChecklistByPlan(int quitPlanId)
        {
            return dao.GetChecklistByPlan(quitPlanId);
        }
    }
}