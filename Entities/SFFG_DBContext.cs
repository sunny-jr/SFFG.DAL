using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace SFFG.DAL.Entities
{
    public partial class SFFG_DBContext : DbContext
    {
        public SFFG_DBContext()
        {
        }

        public SFFG_DBContext(DbContextOptions<SFFG_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Lesson> Lessons { get; set; } = null!;
        public virtual DbSet<MisSection> MisSections { get; set; } = null!;
        public virtual DbSet<RefreshToken> RefreshTokens { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<VideoLesson> VideoLessons { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=SFFG_DB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Lesson>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id");

                entity.Property(e => e.DateCreated).HasColumnName("dateCreated");

                entity.Property(e => e.LessonName)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("lesson_name");

                entity.Property(e => e.LessonPath)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("lesson_path");

                entity.Property(e => e.SectionId).HasColumnName("sectionID");

                entity.Property(e => e.UserId)
                    .HasMaxLength(10)
                    .HasColumnName("userID")
                    .IsFixedLength();

                entity.HasOne(d => d.Section)
                    .WithMany(p => p.Lessons)
                    .HasForeignKey(d => d.SectionId)
                    .HasConstraintName("FK_Lessons_MisSection");
            });

            modelBuilder.Entity<MisSection>(entity =>
            {
                entity.ToTable("MisSection");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Advisor)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("advisor");

                entity.Property(e => e.NoOfStudents).HasColumnName("noOfStudents");

                entity.Property(e => e.SectionName)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("section_name");

                entity.Property(e => e.UserId)
                    .HasMaxLength(10)
                    .HasColumnName("userID")
                    .IsFixedLength();
            });

            modelBuilder.Entity<RefreshToken>(entity =>
            {
                entity.ToTable("RefreshToken");

                entity.Property(e => e.RefToken)
                    .HasMaxLength(400)
                    .IsUnicode(false);

                entity.Property(e => e.UserId)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("userID");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id");

                entity.Property(e => e.Address)
                    .HasMaxLength(150)
                    .IsUnicode(false)
                    .HasColumnName("address");

                entity.Property(e => e.Email)
                    .HasMaxLength(55)
                    .IsUnicode(false)
                    .HasColumnName("email");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("first_name");

                entity.Property(e => e.LastName)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("last_name");

                entity.Property(e => e.Password)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.Role)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("role");

                entity.Property(e => e.SectionId).HasColumnName("sectionID");

                entity.Property(e => e.UserId)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("userID");

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.User)
                    .HasForeignKey<User>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Users_RefreshToken");

                entity.HasOne(d => d.Section)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.SectionId)
                    .HasConstraintName("FK_Users_MisSection");
            });

            modelBuilder.Entity<VideoLesson>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("id");

                entity.Property(e => e.DateCreated).HasColumnName("dateCreated");

                entity.Property(e => e.SectionId).HasColumnName("sectionID");

                entity.Property(e => e.UserId)
                    .HasMaxLength(10)
                    .HasColumnName("userID")
                    .IsFixedLength();

                entity.Property(e => e.VideoName)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("video_name");

                entity.Property(e => e.VideoPath)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("video_path");

                entity.HasOne(d => d.Section)
                    .WithMany(p => p.VideoLessons)
                    .HasForeignKey(d => d.SectionId)
                    .HasConstraintName("FK_VideoLessons_MisSection");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
