using BusinessObject;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class QuitPlanService : IQuitPlanService
    {
        private readonly IQuitPlanRepository _quitPlanRepository = new QuitPlanRepository();
        public bool Create(int userId, DateOnly quitDate, List<int> selectedReasonIds)
        {
            return _quitPlanRepository.Create(userId, quitDate, selectedReasonIds);
        }

        public QuitPlan? GetLatestPlanForUser(int userId)
        {
           return _quitPlanRepository.GetLatestPlan(userId);
        }
    }
}
