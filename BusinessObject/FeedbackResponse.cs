using System;
using System.Collections.Generic;

namespace BusinessObject
{
    public class FeedbackResponse
    {
        public int ResponseId { get; set; }
        public int FeedbackId { get; set; }
        public int ResponderId { get; set; }
        public string ResponseText { get; set; }
        public DateTime RespondedAt { get; set; }

        // Navigation
        public virtual Feedback Feedback { get; set; }
        public virtual User Responder { get; set; }
    }
}
