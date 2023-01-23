using System;
using System.Collections.Generic;

namespace SFFG.DAL.Entities
{
    public partial class Lesson
    {
        public int Id { get; set; }
        public string? UserId { get; set; }
        public string LessonName { get; set; } = null!;
        public string LessonPath { get; set; } = null!;
        public DateTime? DateCreated { get; set; }
        public int? SectionId { get; set; }

        public virtual MisSection? Section { get; set; }
    }
}
