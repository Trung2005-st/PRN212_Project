using BusinessObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public interface IAdminPlanService
    {

        AdminPlanView? GetLatestPlanByUser(string keyword);
        List<AdminPlanView> GetAllPlansByUser(int userId);
        int GetUserCountWithPlans();
        int GetTotalUserCount();
    }
}

