using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Repositories;

namespace Service
{
    public class FeedbackService : IFeedbackService
    {
        IFeedbackRepository feedbackRepository;
        public FeedbackService()
        {
            feedbackRepository = new FeedbackRepository();
        }
        public bool AddFeedback(Feedback feedback)
        {
            return feedbackRepository.AddFeedback(feedback);
        }

        public bool DeleteFeedbackByID(int feedbackId)
        {
            return feedbackRepository.DeleteFeedbackByID(feedbackId);
        }

        public List<Feedback> GetAllFeedbacks()
        {
            return feedbackRepository.GetAllFeedbacks();
        }

        public List<Feedback> SearchFeedbacks(string keyword)
        {
            return feedbackRepository.SearchFeedbacks(keyword);
        }

        public bool UpdateFeedback(Feedback feedback)
        {
            return feedbackRepository.UpdateFeedback(feedback);
        }

        public List<Feedback> GetFeedbackById(int userId)
        {
            return feedbackRepository.GetFeedbackById(userId);
        }
    }
}
