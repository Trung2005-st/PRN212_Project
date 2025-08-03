using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace Service
{
    public interface IFeedbackResponseService
    {
        public List<FeedbackResponse> GetAllFeedbackResponses();

        public FeedbackResponse GetResponseByFeedbackId(int feedbackId);

        public bool AddFeedbackResponse(FeedbackResponse feedbackResponse);

        public bool DeleteFeedbackResponseById(int feedbackId);

        public bool UpdateFeedbackResponse(FeedbackResponse feedbackResponse);
    }
}
