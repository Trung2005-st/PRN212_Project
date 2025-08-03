using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public interface IQuitPlanService
    {
        public bool Create(int userId, DateOnly quitDate, List<int> selectedReasonIds);
        QuitPlan? GetLatestPlanForUser(int userId);
    }
}
