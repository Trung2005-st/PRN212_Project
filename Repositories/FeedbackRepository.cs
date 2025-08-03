using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccessLayer;

namespace Repositories
{
    public class FeedbackRepository : IFeedbackRepository
    {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        public bool AddFeedback(Feedback feedback)
        {
            return feedbackDAO.AddFeedback(feedback);
        }

        public bool DeleteFeedbackByID(int feedbackId)
        {
            return feedbackDAO.DeleteFeedbackByID(feedbackId);
        }

        public List<Feedback> GetAllFeedbacks()
        {
            return feedbackDAO.GetAllFeedbacks();
        }

        public List<Feedback> SearchFeedbacks(string keyword)
        {
            return feedbackDAO.SearchFeedbacks(keyword);
        }

        public bool UpdateFeedback(Feedback feedback)
        {
            return feedbackDAO.UpdateFeedback(feedback);
        }

        public List<Feedback> GetFeedbackById(int userId)
        {
            return feedbackDAO.GetFeedbackById(userId);
        }
    }
}