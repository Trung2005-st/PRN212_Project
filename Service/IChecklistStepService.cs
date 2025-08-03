using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public interface IChecklistStepService
    {
        List<ChecklistStep> GetStepsByPlan(int planId);
        void UpdateStep(ChecklistStep step);
    }
}
