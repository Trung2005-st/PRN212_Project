using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

namespace Service
{
    public interface IUserService
    {
        public User Login(string username, string password);
        public User Register(string username, string password);
    }
}
