using BusinessObject;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class AdminPlanDAO
    {
        private readonly Prn212ProjectDbContext _context = new();

        public AdminPlanView? GetLatestPlanByUser(string keyword)
        {
            using var context = new Prn212ProjectDbContext();

            var user = context.Users.FirstOrDefault(u =>
                u.Username.Contains(keyword) || u.FullName.Contains(keyword));

            if (user == null) return null;

            var plan = context.QuitPlans
                .Where(q => q.UserId == user.UserId)
                .OrderByDescending(q => q.CreatedAt)
                .FirstOrDefault();

            if (plan == null) return null;

            var reasons = context.UserQuitReasons
                .Where(r => r.QuitPlanId == plan.QuitPlanId)
                .Select(r => r.Reason.ReasonText)
                .ToList();

            var steps = context.ChecklistSteps
                .Where(s => s.QuitPlanId == plan.QuitPlanId)
                .OrderBy(s => s.StepOrder)
                .Select(s => s.StepName)
                .ToList();

            return new AdminPlanView
            {
                UserId = user.UserId,
                Username = user.Username,
                FullName = user.FullName,
                QuitDate = plan.QuitDate,
                Reasons = reasons,
                Steps = steps
            };
        }
        // In AdminPlanDAO.cs
        public List<AdminPlanView> GetAllPlansByUser(int userId)
        {
            using var context = new Prn212ProjectDbContext();

            var plans = context.QuitPlans
                .Where(p => p.UserId == userId)
                .OrderByDescending(p => p.CreatedAt)
                .Select(p => new AdminPlanView
                {
                    UserId = p.UserId,
                    Username = p.User.Username,
                    FullName = p.User.FullName,
                    QuitDate = p.QuitDate,
                    Reasons = p.UserQuitReasons.Select(r => r.Reason.ReasonText).ToList(),
                    Steps = p.ChecklistSteps.OrderBy(s => s.StepOrder).Select(s => s.StepName).ToList()
                })
                .ToList();

            return plans;
        }




        public int GetTotalUserCount()
        {
            return _context.Users.Count();
        }

        public int GetUserCountWithPlans()
        {
            return _context.QuitPlans.Select(p => p.UserId).Distinct().Count();
        }
    }
}