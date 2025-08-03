using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccessLayer;

namespace Repositories
{
    public class FeedbackResponseRepository : IFeedbackResponseRepository
    {
        FeedbackResponseDAO feedbackResponseDAO = new FeedbackResponseDAO();
        public bool AddFeedbackResponse(FeedbackResponse feedbackResponse)
        {
            return feedbackResponseDAO.AddFeedbackResponse(feedbackResponse);
        }

        public bool DeleteFeedbackResponseById(int feedbackId)
        {
           return feedbackResponseDAO.DeleteFeedbackResponseById(feedbackId);
        }

        public List<FeedbackResponse> GetAllFeedbackResponses()
        {
           return feedbackResponseDAO.GetAllFeedbackResponses();
        }

        public FeedbackResponse GetResponseByFeedbackId(int feedbackId)
        {
           return feedbackResponseDAO.GetResponseByFeedbackId(feedbackId);
        }

        public bool UpdateFeedbackResponse(FeedbackResponse feedbackResponse)
        {
            return feedbackResponseDAO.UpdateFeedbackResponse(feedbackResponse);
        }
    }
}
