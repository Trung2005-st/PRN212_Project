using BusinessObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class ReasonRepository : IReasonRepository
    {
    private readonly ReasonDAO _reasonDAO = new ReasonDAO();

    public List<Reason> GetAllReasons()
    {
        return _reasonDAO.GetAll();
    }
}
}
