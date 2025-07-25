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
        public User Login(string username, string password)
        {
            return userRepository.Login(username, password);
        }

        public User Register(string username, string password)
        {
           return userRepository.Register(username, password);
        }
    }
}
