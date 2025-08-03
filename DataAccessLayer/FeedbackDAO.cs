using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Microsoft.EntityFrameworkCore;

namespace DataAccessLayer
{
    public class FeedbackDAO
    {
        Prn212ProjectDbContext context = new Prn212ProjectDbContext();

        public List<Feedback> GetAllFeedbacks()
        {
            return context.Feedbacks.Include(f => f.FeedbackResponses).ToList();
        }
        
        public bool AddFeedback(Feedback feedback)
        {   
            if (feedback == null)
            {
                return false;
            }
            context.Feedbacks.Add(feedback);
            context.SaveChanges();
            return true;
        }

        public bool DeleteFeedbackByID(int feedbackId)
        {
            var feedback = context.Feedbacks.FirstOrDefault(f => f.FeedbackId == feedbackId);
            if (feedback == null)
            {
                return false;
            }
            context.Feedbacks.Remove(feedback);
            context.SaveChanges();
            return true;
        }

        public bool UpdateFeedback(Feedback feedback)
        {
            var existingFeedback = context.Feedbacks.FirstOrDefault(f => f.FeedbackId == feedback.FeedbackId);
            if (existingFeedback == null)
            {
                return false;
            }
            existingFeedback.Message = feedback.Message;
            existingFeedback.UserId = feedback.UserId;
            existingFeedback.Emoji = feedback.Emoji;
            existingFeedback.SentAt = DateTime.Now;
            context.SaveChanges();
            return true;
        }

        public List<Feedback> SearchFeedbacks(string keyword)
        {
            return context.Feedbacks
                .Where(f =>
                    (!string.IsNullOrEmpty(f.Message) && f.Message.Contains(keyword)) ||
                    (!string.IsNullOrEmpty(f.Emoji) && f.Emoji.Contains(keyword)))
                .ToList();
        }

        public List<Feedback> GetFeedbackById(int userId)
        {
            return context.Feedbacks.Where(p=> p.UserId == userId).Include(f => f.FeedbackResponses).ToList();
        }
    }
}
