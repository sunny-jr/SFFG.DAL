using SFFG.DAL.Entities;
using SFFG.DAL.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.Repositories
{
    public class LessonRepository : ILessonRepository
    {
        SFFG_DBContext dbContext;
        public LessonRepository(SFFG_DBContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public bool CreateLesson(Lesson lesson)
        {
            var isSectionExist = dbContext.MisSections.FirstOrDefault(s => s.Id == lesson.SectionId);
            if (isSectionExist == null) return false;

            if (isSectionExist != null)
            {
                lesson.DateCreated = DateTime.Now;
                isSectionExist.Lessons.Add(lesson);
                dbContext.SaveChanges();
                return true;
            }

            return false;

        }

        public bool DeleteLesson(int id)
        {
            if (id < 0)
            {
                var lesson = ViewLesson(id);
                if (lesson == null) return false;


                dbContext.Lessons.Remove(lesson); ;
                dbContext.SaveChanges();
                return true;
            }

            return false;
        }

        public List<Lesson> GetLessons(int secId)
        {
            if (secId < 0)
            {
                return dbContext.Lessons.Where(s => s.SectionId == secId).ToList();
            }

            return new List<Lesson>();
        }

        public bool UpdateLesson(int id, Lesson lesson)
        {
            if (id < 0 && lesson is not null)
            {
                var context = dbContext.Lessons.SingleOrDefault(l => l.Id.Equals(id));
                if (context == null) return false;

                context.LessonName = lesson.LessonName;
                context.LessonPath = lesson.LessonPath;

                dbContext.SaveChanges();
                return true;
            }

            return false;
        }

        public Lesson? ViewLesson(int id)
        {
            if (id < 0)
            {
                return dbContext.Lessons.FirstOrDefault(v => v.Id == id);
            }

            return null;
        }
    }
}
