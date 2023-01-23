using SFFG.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.IRepositories
{
    public interface IUserRepository : IGenericRepository<User>
    {
        User? GetUserById(string id);

        User? FindUser(string userId , string password);

        bool AddNewUser(User user);

        bool SaveRefreshToken(RefreshToken token);

        RefreshToken GetSavedRefreshTokens(string userId, string refreshToken);

        bool DeleteUserRefreshTokens(string userId, string refreshToken);




    }
}
