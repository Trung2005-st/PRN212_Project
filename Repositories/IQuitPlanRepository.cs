using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public interface IQuitPlanRepository
    {
      public bool Create(int userId, DateOnly quitDate, List<int> selectedReasonIds);
        List<QuitPlan> GetPlansByUser(int userId);
        QuitPlan? GetLatestPlan(int userId);
    }
}
