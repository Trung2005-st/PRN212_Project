using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using Microsoft.EntityFrameworkCore;

namespace DataAccessLayer
{
    public class UserDAO
    {
        Prn212ProjectDbContext dbContext= new Prn212ProjectDbContext();

        public User Login(string username, string password)
        {
            return dbContext.Users.FirstOrDefault(u => u.Username == username && u.Password == password);
        }

        public User Register(string username, string password)
        {
            var getUser= dbContext.Users.FirstOrDefault(u => u.Username == username);
            if (getUser != null)
            {
                return null;
            }
            User newUser = new User() { Username = username, Password = password, RoleId=1};
            dbContext.Users.Add(newUser);
            dbContext.SaveChanges();
            return newUser;
        }

        public List<User> UserList()
        {
            return dbContext.Users.ToList();
        }

        public bool addUser(User user)
        {
            var getUser= dbContext.Users.FirstOrDefault(u=>u.Username == user.Username);
            if (getUser != null)
            {
                return false;
            }
            dbContext.Users.Add(user);
            dbContext.SaveChanges();
            return true;
        }

        public bool updateUser(User user)
        {
            var getUser = dbContext.Users.FirstOrDefault(u => u.UserId == user.UserId);
            if (getUser == null)
            {
                return false;
            }
            getUser.Username = user.Username;
            getUser.Password = user.Password;
            getUser.RoleId = user.RoleId;
            dbContext.SaveChanges();
            return true;
        }

        public bool deleteUser(int userId)
        {
            var getUser = dbContext.Users.FirstOrDefault(u => u.UserId == userId);
            if (getUser == null)
            {
                return false;
            }
            dbContext.Users.Remove(getUser);
            dbContext.SaveChanges();
            return true;
        }

        public List<User> SearchUsers(string keyword)
        {
            if (string.IsNullOrWhiteSpace(keyword))
                return dbContext.Users.ToList();

            string lower = keyword.ToLower();

            return dbContext.Users
                .Where(u =>
                    u.Username.ToLower().Contains(lower) ||
                    u.FullName.ToLower().Contains(lower) ||
                    u.RoleId.ToString().Contains(lower) ||
                    (u.Age.HasValue && u.Age.Value.ToString().Contains(lower))
                ).ToList();
        }

        public User GetUserIdByName(string name)
        {
            return dbContext.Users.FirstOrDefault(c => c.FullName.Equals(name));
        }

        public User GetUserByUsername(string username)
        {
            return dbContext.Users.FirstOrDefault(u => u.Username == username);
        }
        public User GetUserByIdWithRole(int userId)
        {
            return dbContext.Users
                .Include(u => u.Role)
                .FirstOrDefault(u => u.UserId == userId);
        }
        public bool UpdateForUser(User user)
        {
            var existing = dbContext.Users.FirstOrDefault(u => u.UserId == user.UserId);
            if (existing == null) return false;

            existing.FullName = user.FullName;
            existing.Age = user.Age;
            dbContext.SaveChanges();
            return true;
        }
    }
}
