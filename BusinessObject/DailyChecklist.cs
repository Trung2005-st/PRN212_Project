using System;
using System.Collections.Generic;

namespace BusinessObject;

public partial class DailyChecklist
{
    public int ChecklistId { get; set; }

    public int QuitPlanId { get; set; }

    public DateOnly CheckDate { get; set; }

    public bool? IsCompleted { get; set; }

    public string? Note { get; set; }

    public virtual QuitPlan QuitPlan { get; set; } = null!;
}
