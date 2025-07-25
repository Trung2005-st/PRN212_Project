using System;
using System.Collections.Generic;

namespace BusinessObject;

public partial class Reason
{
    public int ReasonId { get; set; }

    public string ReasonText { get; set; } = null!;

    public virtual ICollection<UserQuitReason> UserQuitReasons { get; set; } = new List<UserQuitReason>();
}
