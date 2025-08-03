using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public class AdminPlanView
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string FullName { get; set; }
        public DateOnly QuitDate { get; set; }
        public List<string> Reasons { get; set; }
        public List<string> Steps { get; set; }
    }
}
