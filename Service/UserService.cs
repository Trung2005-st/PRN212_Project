using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Repositories;

namespace Service
{
    public class UserService : IUserService
    {
        IUserRepository userRepository;
        public UserService()
        {
            userRepository = new UserRepository();
        }

        public bool addUser(User user)
        {
           return userRepository.addUser(user);
        }

        public bool deleteUser(int userId)
        {
           return userRepository.deleteUser(userId);
        }

        public User GetUserIdByName(string name)
        {
           return userRepository.GetUserIdByName(name);
        }

        public User Login(string username, string password)
        {
            return userRepository.Login(username, password);
        }

        public User Register(string username, string password)
        {
           return userRepository.Register(username, password);
        }

        public List<User> SearchUsers(string keyword)
        {
            return userRepository.SearchUsers(keyword);
        }

        public bool updateUser(User user)
        {
           return userRepository.updateUser(user);
        }

        public List<User> UserList()
        {
            return userRepository.UserList();
        }

        public User GetUserByIdWithRole(int userId)
        {
            return userRepository.GetUserByIdWithRole(userId);
        }

        public bool UpdateForUser(User user)
        {
            return userRepository.UpdateForUser(user);
        }
        public User GetUserByUsername(string username)
        {
            return userRepository.GetUserByUsername(username);
        }
    }
}
