using SFFG.DAL.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.IConfiguration
{
    public interface IUnitIOfWork
    {
        IUserRepository User {get;}
        void SaveChanges();
    }
}
