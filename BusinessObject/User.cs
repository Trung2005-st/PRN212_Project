using System;
using System.Collections.Generic;

namespace BusinessObject;

public partial class User
{
    public int UserId { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? FullName { get; set; }

    public int? Age { get; set; }

    public int RoleId { get; set; }

    public virtual ICollection<CounselingSchedule> CounselingScheduleCounselors { get; set; } = new List<CounselingSchedule>();

    public virtual ICollection<CounselingSchedule> CounselingScheduleUsers { get; set; } = new List<CounselingSchedule>();

    public virtual ICollection<Feedback> Feedbacks { get; set; } = new List<Feedback>();

    public virtual ICollection<QuitPlan> QuitPlans { get; set; } = new List<QuitPlan>();

    public virtual Role Role { get; set; } = null!;

    public virtual ICollection<FeedbackResponse> GivenResponses { get; set; } = new List<FeedbackResponse>();

}
