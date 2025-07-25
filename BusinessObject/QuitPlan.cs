using System;
using System.Collections.Generic;

namespace BusinessObject;

public partial class QuitPlan
{
    public int QuitPlanId { get; set; }

    public int UserId { get; set; }

    public DateOnly QuitDate { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual ICollection<DailyChecklist> DailyChecklists { get; set; } = new List<DailyChecklist>();

    public virtual User User { get; set; } = null!;

    public virtual ICollection<UserQuitReason> UserQuitReasons { get; set; } = new List<UserQuitReason>();
}
