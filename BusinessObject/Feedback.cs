using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace BusinessObject;

public partial class Feedback
{
    public int FeedbackId { get; set; }

    public int? UserId { get; set; }

    public string? Emoji { get; set; }

    public string? Message { get; set; }

    public DateTime? SentAt { get; set; }

    public virtual User? User { get; set; }

    public virtual ICollection<FeedbackResponse> FeedbackResponses { get; set; } = new List<FeedbackResponse>();

    [NotMapped]
    public bool HasResponse => FeedbackResponses != null && FeedbackResponses.Count > 0;

}
