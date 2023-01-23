using System;
using System.Collections.Generic;

namespace SFFG.DAL.Entities
{
    public partial class RefreshToken
    {
        public int Id { get; set; }
        public string UserId { get; set; } = null!;
        public string? RefToken { get; set; }
        public int IsActive { get; set; }

        public virtual User User { get; set; } = null!;
    }
}
