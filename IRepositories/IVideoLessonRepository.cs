using SFFG.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFFG.DAL.IRepositories
{
    public interface IVideoLessonRepository
    {
        bool CreateVideoLesson(VideoLesson lesson);

        List<VideoLesson> GetVideoLessons(int secId);

        VideoLesson? ViewVideoLesson(int id);

        bool UpdateVideoLesson(int id, VideoLesson lesson);

        bool DeleteVideoLesson(int id);
    }
}
