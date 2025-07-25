using System;
using System.Collections.Generic;

namespace BusinessObject;

public partial class CounselingSchedule
{
    public int ScheduleId { get; set; }

    public int UserId { get; set; }

    public int CounselorId { get; set; }

    public DateTime ScheduleTime { get; set; }

    public string? Topic { get; set; }

    public bool? IsConfirmed { get; set; }

    public virtual User Counselor { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
