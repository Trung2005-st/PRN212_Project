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

        public bool addUser(User user)
        {
            return userDAO.addUser(user);
        }

        public bool deleteUser(int userId)
        {
           return (userDAO.deleteUser(userId));
        }

        public User GetUserIdByName(string name)
        {
            return userDAO.GetUserIdByName(name);
        }

        public User Login(string username, string password)
        {
            return userDAO.Login(username, password);
        }

        public User Register(string username, string password)
        {
            return userDAO.Register(username, password);
        }

        public List<User> SearchUsers(string keyword)
        {
            return userDAO.SearchUsers(keyword);
        }

        public bool updateUser(User user)
        {
           return userDAO.updateUser(user);
        }

        public List<User> UserList()
        {
            return userDAO.UserList();
        }

        public User GetUserByIdWithRole(int userId)
        {
            return userDAO.GetUserByIdWithRole(userId);
        }

        public User GetUserByUsername(string username)
        {
            return userDAO.GetUserByUsername(username);
        }

        public bool UpdateForUser(User user)
        {
            return userDAO.UpdateForUser(user);
        }
    }
}
