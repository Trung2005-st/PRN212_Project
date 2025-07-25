using System;
using System.Collections.Generic;

namespace BusinessObject;

public partial class UserQuitReason
{
    public int UserQuitReasonId { get; set; }

    public int QuitPlanId { get; set; }

    public int ReasonId { get; set; }

    public virtual QuitPlan QuitPlan { get; set; } = null!;

    public virtual Reason Reason { get; set; } = null!;
}
