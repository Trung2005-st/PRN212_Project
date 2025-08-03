using BusinessObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class QuitPlanRepository : IQuitPlanRepository
    {
        QuitPlanDAO planDAO = new QuitPlanDAO();

        public bool Create(int userId, DateOnly quitDate, List<int> selectedReasonIds)
        {
           return planDAO.Create(userId, quitDate, selectedReasonIds);
        }
        public QuitPlan? GetLatestPlan(int userId)
        {
            return planDAO.GetLatestPlanForUser(userId);
        }

        public List<QuitPlan> GetPlansByUser(int userId)
        {
            return planDAO.GetPlansByUser(userId);
        }
    }
}
