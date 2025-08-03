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

        public List<User> UserList();
        public bool addUser(User user);
        public bool updateUser(User user);

        public bool deleteUser(int userId);

        public List<User> SearchUsers(string keyword);

        public User GetUserIdByName(string name);

        public User GetUserByIdWithRole(int userId);

        public bool UpdateForUser(User user);

        public User GetUserByUsername(string username);
    }
}
