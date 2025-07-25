using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccessLayer;

namespace Repositories
{
    public class UserRepository : IUserRepository
    {
        UserDAO userDAO = new UserDAO();
        public User Login(string username, string password)
        {
            return userDAO.Login(username, password);
        }

        public User Register(string username, string password)
        {
            return userDAO.Register(username, password);
        }
    }
}
