using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;

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
    }
}
