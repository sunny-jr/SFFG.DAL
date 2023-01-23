using System;
using System.Collections.Generic;

namespace SFFG.DAL.Entities
{
    public partial class User
    {
        public int Id { get; set; }
        public string UserId { get; set; } = null!;
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string? Email { get; set; }
        public string? Address { get; set; }
        public string Role { get; set; } = null!;
        public int? SectionId { get; set; }
        public string? Password { get; set; }

        public virtual RefreshToken IdNavigation { get; set; } = null!;
        public virtual MisSection? Section { get; set; }
    }
}
