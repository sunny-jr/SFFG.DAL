using SFFG.DAL.Entities;
using SFFG.DAL.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.Repositories
{
    public class SectionRepository : ISectionRepository
    {
        SFFG_DBContext dbContext;
        public SectionRepository(SFFG_DBContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public bool CreateSection(int id, MisSection section)
        { 
            if (id > 0)
            {
                dbContext.MisSections.Add(section);
                dbContext.SaveChanges();
                return true;
            }

            return false;

        }

        public bool DeleteSection(int id)
        {
            if (id < 0)
            {
                var section = ViewSection(id);
                if (section == null) return false;


                dbContext.MisSections.Remove(section); ;
                dbContext.SaveChanges();
                return true;
            }

            return false;
        }

        public List<MisSection> GetSections(int id)
        {
            //if (id < 0)
            //{
            //    return dbContext.MisSections.Where(s => s.SectionId == id).ToList();
            //}

            return new List<MisSection>();
        }

        public bool UpdateSection(int id, MisSection section)
        {
            if (id < 0 && section is not null)
            {
                var context = dbContext.MisSections.SingleOrDefault(l => l.Id.Equals(id));
                if (context == null) return false;

                context.SectionName = section.SectionName;
                context.NoOfStudents = section.NoOfStudents;

                dbContext.SaveChanges();
                return true;
            }

            return false;
        }

        public MisSection? ViewSection(int id)
        {
            if (id < 0)
            {
                return dbContext.MisSections.FirstOrDefault(v => v.Id == id);
            }

            return null;
        }
    }
}
