using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Microsoft.EntityFrameworkCore;

namespace DataAccessLayer
{
    public class FeedbackResponseDAO
    {
        Prn212ProjectDbContext context= new Prn212ProjectDbContext();
        public List<FeedbackResponse> GetAllFeedbackResponses()
        {
            return context.FeedbackResponses.ToList();
        }

        public FeedbackResponse GetResponseByFeedbackId(int feedbackId)
        {
            return context.FeedbackResponses.FirstOrDefault(fr => fr.FeedbackId == feedbackId);
        }

        public bool AddFeedbackResponse(FeedbackResponse feedbackResponse)
        {
            if (feedbackResponse == null)
            {
                return false;
            }
            var existingResponse = context.FeedbackResponses
                .FirstOrDefault(fr => fr.FeedbackId == feedbackResponse.FeedbackId && fr.ResponderId == feedbackResponse.ResponderId);
            if (existingResponse != null)
            {
                return false;
            }
            context.FeedbackResponses.Add(feedbackResponse);
            context.SaveChanges();
            return true;
        }

        public bool DeleteFeedbackResponseById(int feedbackId)
        {
            var response = context.FeedbackResponses.FirstOrDefault(fr => fr.FeedbackId == feedbackId);
            if (response == null)
            {
                return false;
            }
            context.FeedbackResponses.Remove(response);
            context.SaveChanges();
            return true;
        }

        public bool UpdateFeedbackResponse(FeedbackResponse feedbackResponse)
        {
            var existingResponse = context.FeedbackResponses.FirstOrDefault(fr => fr.ResponderId == feedbackResponse.ResponderId);
            if (existingResponse == null)
            {
                return false;
            }
            existingResponse.ResponseText = feedbackResponse.ResponseText;
            existingResponse.RespondedAt = DateTime.Now;
            context.SaveChanges();
            return true;
        }
    }
}
