using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DailyChecklistDAO
    {
        public List<DailyChecklist> GetChecklistByPlan(int quitPlanId)
        {
            using (var context = new Prn212ProjectDbContext())
            {
                return context.DailyChecklists
                    .Where(c => c.QuitPlanId == quitPlanId)
                    .OrderBy(c => c.CheckDate)
                    .ToList();
            }
        }
    }
}