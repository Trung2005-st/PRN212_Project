using BusinessObject;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class ReasonService : IReasonService
    {
        private readonly IReasonRepository _reasonRepository = new ReasonRepository();

        public List<Reason> GetAllReasons()
        {
            return _reasonRepository.GetAllReasons();
        }
    }
}