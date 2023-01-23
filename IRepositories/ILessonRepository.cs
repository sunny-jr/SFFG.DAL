using SFFG.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.IRepositories
{
    public interface ILessonRepository
    {
       bool CreateLesson(int secId, Lesson lesson);

        List<Lesson> GetLessons(int secId);

        Lesson? ViewLesson(int id);

        bool UpdateLesson(int id, Lesson lesson);

        bool DeleteLesson(int id);
    }
}

