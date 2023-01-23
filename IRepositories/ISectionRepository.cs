using SFFG.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.IRepositories
{
    public interface ISectionRepository
    {
        bool CreateSection(int id, MisSection section);

        List<MisSection> GetSections(int id);

        MisSection? ViewSection(int id);

        bool UpdateSection(int id, MisSection section);

        bool DeleteSection(int id);
    }
}
