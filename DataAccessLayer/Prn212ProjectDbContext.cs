using System;
using System.Collections.Generic;
using BusinessObject;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.Configuration;


namespace DataAccessLayer;

public partial class Prn212ProjectDbContext : DbContext
{
    public Prn212ProjectDbContext()
    {
    }

    public Prn212ProjectDbContext(DbContextOptions<Prn212ProjectDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<CounselingSchedule> CounselingSchedules { get; set; }

    public virtual DbSet<DailyChecklist> DailyChecklists { get; set; }

    public virtual DbSet<Feedback> Feedbacks { get; set; }

    public virtual DbSet<QuitPlan> QuitPlans { get; set; }

    public virtual DbSet<Reason> Reasons { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserQuitReason> UserQuitReasons { get; set; }

    private string GetConnectionString()
    {
        IConfiguration configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", true, true).Build();
        return configuration["ConnectionStrings:MyDbConnection"];
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer(GetConnectionString());
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<CounselingSchedule>(entity =>
        {
            entity.HasKey(e => e.ScheduleId).HasName("PK__Counseli__9C8A5B49DDF19539");

            entity.Property(e => e.IsConfirmed).HasDefaultValue(false);
            entity.Property(e => e.ScheduleTime).HasColumnType("datetime");
            entity.Property(e => e.Topic).HasMaxLength(255);

            entity.HasOne(d => d.Counselor).WithMany(p => p.CounselingScheduleCounselors)
                .HasForeignKey(d => d.CounselorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Schedule_Counselor");

            entity.HasOne(d => d.User).WithMany(p => p.CounselingScheduleUsers)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_Schedule_User");
        });

        modelBuilder.Entity<DailyChecklist>(entity =>
        {
            entity.HasKey(e => e.ChecklistId).HasName("PK__DailyChe__4C1D499A23651A4E");

            entity.Property(e => e.IsCompleted).HasDefaultValue(false);
            entity.Property(e => e.Note).HasMaxLength(255);

            entity.HasOne(d => d.QuitPlan).WithMany(p => p.DailyChecklists)
                .HasForeignKey(d => d.QuitPlanId)
                .HasConstraintName("FK_Checklists_QuitPlan");
        });

        modelBuilder.Entity<Feedback>(entity =>
        {
            entity.HasKey(e => e.FeedbackId).HasName("PK__Feedback__6A4BEDD6D0B3FB25");

            entity.Property(e => e.Emoji).HasMaxLength(10);
            entity.Property(e => e.Message).HasMaxLength(500);
            entity.Property(e => e.SentAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.User).WithMany(p => p.Feedbacks)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Feedbacks_Users");
        });

        modelBuilder.Entity<QuitPlan>(entity =>
        {
            entity.HasKey(e => e.QuitPlanId).HasName("PK__QuitPlan__A17574B191C009DF");

            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.User).WithMany(p => p.QuitPlans)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_QuitPlans_Users");
        });

        modelBuilder.Entity<Reason>(entity =>
        {
            entity.HasKey(e => e.ReasonId).HasName("PK__Reasons__A4F8C0E75762FF86");

            entity.Property(e => e.ReasonText).HasMaxLength(255);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__Roles__8AFACE1A6E0598C8");

            entity.Property(e => e.RoleId).ValueGeneratedNever();
            entity.Property(e => e.RoleName).HasMaxLength(50);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CC4C7C901767");

            entity.HasIndex(e => e.Username, "UQ__Users__536C85E4D4E21A15").IsUnique();

            entity.Property(e => e.FullName).HasMaxLength(100);
            entity.Property(e => e.Password).HasMaxLength(200);
            entity.Property(e => e.RoleId).HasDefaultValue(1);
            entity.Property(e => e.Username).HasMaxLength(50);

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Users_Roles");
        });

        modelBuilder.Entity<UserQuitReason>(entity =>
        {
            entity.HasKey(e => e.UserQuitReasonId).HasName("PK__UserQuit__DCD1C20625CE3A8E");

            entity.HasOne(d => d.QuitPlan).WithMany(p => p.UserQuitReasons)
                .HasForeignKey(d => d.QuitPlanId)
                .HasConstraintName("FK_UserQuitReasons_QuitPlans");

            entity.HasOne(d => d.Reason).WithMany(p => p.UserQuitReasons)
                .HasForeignKey(d => d.ReasonId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserQuitReasons_Reasons");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
