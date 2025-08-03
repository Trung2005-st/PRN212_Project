using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Repositories;

namespace Service
{
    public class FeedbackResponseService : IFeedbackResponseService
    {
        IFeedbackResponseRepository feedbackResponseRepository;
        public FeedbackResponseService()
        {
            feedbackResponseRepository = new FeedbackResponseRepository();
        }
        public bool AddFeedbackResponse(FeedbackResponse feedbackResponse)
        {
           return feedbackResponseRepository.AddFeedbackResponse(feedbackResponse);
        }

        public bool DeleteFeedbackResponseById(int feedbackId)
        {
           return feedbackResponseRepository.DeleteFeedbackResponseById(feedbackId);
        }

        public List<FeedbackResponse> GetAllFeedbackResponses()
        {
           return feedbackResponseRepository.GetAllFeedbackResponses();
        }

        public FeedbackResponse GetResponseByFeedbackId(int feedbackId)
        {
           return feedbackResponseRepository.GetResponseByFeedbackId(feedbackId);
        }

        public bool UpdateFeedbackResponse(FeedbackResponse feedbackResponse)
        {
           return feedbackResponseRepository.UpdateFeedbackResponse(feedbackResponse);
        }
    }
}
