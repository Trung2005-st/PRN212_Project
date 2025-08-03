using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class ReasonDAO
    {
        public List<Reason> GetAll()
        {
            using (var context = new Prn212ProjectDbContext())
            {
                return context.Reasons.ToList();
            }
        }
    }
}