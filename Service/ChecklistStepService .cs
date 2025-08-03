using BusinessObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class ChecklistStepService : IChecklistStepService
    {
        private readonly ChecklistStepDAO _dao = new ChecklistStepDAO();

        public List<ChecklistStep> GetStepsByPlan(int planId) => _dao.GetStepsByPlan(planId);

        public void UpdateStep(ChecklistStep step) => _dao.UpdateStep(step);
    }
}