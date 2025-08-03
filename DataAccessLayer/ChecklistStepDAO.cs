using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class ChecklistStepDAO
    {
        public List<ChecklistStep> GetStepsByPlan(int planId)
        {
            using var context = new Prn212ProjectDbContext();
            return context.ChecklistSteps
                .Where(s => s.QuitPlanId == planId)
                .OrderBy(s => s.StepOrder)
                .ToList();
        }

        public void UpdateStep(ChecklistStep step)
        {
            using var context = new Prn212ProjectDbContext();
            context.ChecklistSteps.Update(step);
            context.SaveChanges();
        }
    }
}