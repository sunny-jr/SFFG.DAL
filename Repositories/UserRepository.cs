using Microsoft.EntityFrameworkCore;
using SFFG.DAL.Entities;
using SFFG.DAL.IRepositories;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.Repositories
{
    public class UserRepositories : GenericRepository<User>, IUserRepository
    {
        SFFG_DBContext _dbContext;
        public UserRepositories(SFFG_DBContext context) : base(context)
        {
            _dbContext = context;
        }


        public User? GetUserById(string id)
        {

                var user = _dbContext!.Users.FirstOrDefault(x => x.UserId.Equals(id));
                if (user is not null) return user;

                return null;

        }

        public User? FindUser(string userId , string password)
        {
                var user = _dbContext.Users.FirstOrDefault(x => x.UserId.Equals(userId) && x.Password!.Equals(password));
                if (user is not null) return user;

                return null;


        }

        public bool AddNewUser(User user)
        {
          
                if(user is not null)
                {
                _dbContext.Users.Add(user);
                _dbContext.SaveChanges();
                    return true;
                }

                return false;

        }

        public bool SaveRefreshToken(RefreshToken token)
        {
          //  using (var dbContext = _dbContext)
           // {
                if (token is not null)
                {
                _dbContext.RefreshTokens.Add(token);
                _dbContext.SaveChanges();
                    return true;
                }

                return false;


           // }
        }

        public RefreshToken GetSavedRefreshTokens(string userId, string refreshToken)
        {
           // using (var dbContext = _dbContext)
           // {

               var x = _dbContext.RefreshTokens.FirstOrDefault(x => x.UserId == userId && x.RefToken == refreshToken && x.IsActive == 1);
                if (x is not null) return x;

                return new RefreshToken();
           // }

           
        }


        public bool DeleteUserRefreshTokens(string userId, string refreshToken)
        {
            //using (var dbContext = _dbContext)
            //{

               if(userId != String.Empty && refreshToken != String.Empty)
                {
                    var toRemove = _dbContext.RefreshTokens.FirstOrDefault(x => x.UserId == userId && x.RefToken == refreshToken);
                    if (toRemove is not null)
                    {
                    _dbContext.Remove(toRemove);
                    _dbContext.SaveChanges();
                        return true;
                    }
                    return false;
                }

                return false;
            //}


        }

    }
}

