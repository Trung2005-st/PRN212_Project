using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace Service
{
    public interface IFeedbackService
    {
        public List<Feedback> GetAllFeedbacks();
        public bool AddFeedback(Feedback feedback);

        public bool DeleteFeedbackByID(int feedbackId);
        public bool UpdateFeedback(Feedback feedback);

        public List<Feedback> SearchFeedbacks(string keyword);

        public List<Feedback> GetFeedbackById(int userId);
    }
}
