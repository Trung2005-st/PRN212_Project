using BusinessObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class AdminPlanService : IAdminPlanService
    {
        private readonly AdminPlanDAO _dao = new();

        public AdminPlanView? GetLatestPlanByUser(string keyword)
            => _dao.GetLatestPlanByUser(keyword);

        public List<AdminPlanView> GetAllPlansByUser(int userId)
            => _dao.GetAllPlansByUser(userId);

        public int GetUserCountWithPlans()
            => _dao.GetUserCountWithPlans();

        public int GetTotalUserCount()
            => _dao.GetTotalUserCount();
    }
}
