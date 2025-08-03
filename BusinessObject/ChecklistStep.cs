using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class ChecklistStep
    {
        [Key]
        public int ChecklistId { get; set; }

        public int QuitPlanId { get; set; }

        public int StepOrder { get; set; }

        public string StepName { get; set; } = null!;

        public bool IsCompleted { get; set; }

        public string? Note { get; set; }
        public DateOnly? LastCheckedDate { get; set; }

        public virtual QuitPlan QuitPlan { get; set; } = null!;
    }
}