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
    public class VideoLessonRepository : IVideoLessonRepository
    {
        SFFG_DBContext dbContext;
        public VideoLessonRepository(SFFG_DBContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public bool CreateVideoLesson(VideoLesson video)
        {
            var isSectionExist = dbContext.MisSections.FirstOrDefault(s => s.Id == video.SectionId);

            if (video != null && isSectionExist != null)
            {
                isSectionExist.VideoLessons.Add(video);
                dbContext.SaveChanges();
                return true;
            }

            return false;

        }

        public bool DeleteVideoLesson(int id)
        {
            if (id < 0)
            {
                var lesson = ViewVideoLesson(id);
                if (lesson == null) return false;


                dbContext.VideoLessons.Remove(lesson); ;
                dbContext.SaveChanges();
                return true;
            }

            return false;
        }

        public List<VideoLesson> GetVideoLessons(int secId)
        {
            if (secId < 0)
            {
                return dbContext.VideoLessons.Where(s => s.SectionId == secId).ToList();
            }

            return new List<VideoLesson>();
        }

        public bool UpdateVideoLesson(int id, VideoLesson lesson)
        {
            if (id < 0 && lesson is not null)
            {
                var context = dbContext.VideoLessons.SingleOrDefault(l => l.Id.Equals(id));
                if (context == null) return false;

                context.VideoName = lesson.VideoName;
                context.VideoPath = lesson.VideoPath;

                dbContext.SaveChanges();
                return true;
            }

            return false;
        }

        public VideoLesson? ViewVideoLesson(int id)
        {
            if (id < 0)
            {
                return dbContext.VideoLessons.FirstOrDefault(v => v.Id == id);
            }

            return null;
        }
    
    }
}
