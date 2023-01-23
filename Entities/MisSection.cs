using System;
using System.Collections.Generic;

namespace SFFG.DAL.Entities
{
    public partial class MisSection
    {
        public MisSection()
        {
            Lessons = new HashSet<Lesson>();
            Users = new HashSet<User>();
            VideoLessons = new HashSet<VideoLesson>();
        }

        public int Id { get; set; }
        public string? UserId { get; set; }
        public string SectionName { get; set; } = null!;
        public string Advisor { get; set; } = null!;
        public int NoOfStudents { get; set; }

        public virtual ICollection<Lesson> Lessons { get; set; }
        public virtual ICollection<User> Users { get; set; }
        public virtual ICollection<VideoLesson> VideoLessons { get; set; }
    }
}
