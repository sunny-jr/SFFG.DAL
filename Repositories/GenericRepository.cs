using Microsoft.EntityFrameworkCore;
using SFFG.DAL.Entities;
using SFFG.DAL.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.Repositories
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        private readonly SFFG_DBContext _dbContext;
        private  DbSet<T> table;

        public GenericRepository(SFFG_DBContext dbContext)
        {
            this._dbContext = dbContext;
            this.table = _dbContext.Set<T>();
        }

        public IEnumerable<T> GetAll()
        {
            return table.ToList();
        }

        public bool Insert(T obj)
        {
            table.Add(obj);
            return true;
        }

        public bool Update(T obj)
        {
            table.Attach(obj);
            _dbContext.Entry(obj).State = EntityState.Modified;
            return true;
        }

        public bool Delete(T id)
        {
            T existing = table.Find(id)!;
            table.Remove(existing);
            return true;
        }

        public void Save()
        {
            _dbContext.SaveChanges();
        }


    }
}
