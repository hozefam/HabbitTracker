using Microsoft.EntityFrameworkCore;
using HabbitTracker.API.Models;

namespace HabbitTracker.API.Data;

public class HabbitTrackerDbContext : DbContext
{
    public HabbitTrackerDbContext(DbContextOptions<HabbitTrackerDbContext> options)
        : base(options)
    {
    }

    public DbSet<User> Users { get; set; }
    public DbSet<Habit> Habits { get; set; }
    public DbSet<HabitLog> HabitLogs { get; set; }
    public DbSet<RefreshToken> RefreshTokens { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // User configuration
        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("Users");
            entity.HasKey(e => e.Id);
            entity.HasIndex(e => e.Email).IsUnique();
            entity.HasIndex(e => e.Username).IsUnique();

            entity.Property(e => e.Username).HasMaxLength(50).IsRequired();
            entity.Property(e => e.Email).HasMaxLength(100).IsRequired();
            entity.Property(e => e.PasswordHash).HasMaxLength(255).IsRequired();
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
        });

        // Habit configuration
        modelBuilder.Entity<Habit>(entity =>
        {
            entity.ToTable("Habits");
            entity.HasKey(e => e.Id);
            entity.HasIndex(e => e.UserId);
            entity.HasIndex(e => e.Category);

            entity.Property(e => e.Name).HasMaxLength(100).IsRequired();
            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.Category).HasMaxLength(50);
            entity.Property(e => e.Frequency).HasMaxLength(20).IsRequired();
            entity.Property(e => e.Color).HasMaxLength(10);
            entity.Property(e => e.Icon).HasMaxLength(50);

            entity.HasOne(e => e.User)
                .WithMany(u => u.Habits)
                .HasForeignKey(e => e.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        // HabitLog configuration
        modelBuilder.Entity<HabitLog>(entity =>
        {
            entity.ToTable("HabitLogs");
            entity.HasKey(e => e.Id);
            entity.HasIndex(e => e.HabitId);
            entity.HasIndex(e => e.CompletionDate);
            entity.HasIndex(e => new { e.HabitId, e.CompletionDate }).IsUnique();

            entity.HasOne(e => e.Habit)
                .WithMany(h => h.HabitLogs)
                .HasForeignKey(e => e.HabitId)
                .OnDelete(DeleteBehavior.Cascade);
        });

        // RefreshToken configuration
        modelBuilder.Entity<RefreshToken>(entity =>
        {
            entity.ToTable("RefreshTokens");
            entity.HasKey(e => e.Id);
            entity.HasIndex(e => e.UserId);
            entity.HasIndex(e => e.Token);

            entity.Property(e => e.Token).HasMaxLength(500).IsRequired();

            entity.HasOne(e => e.User)
                .WithMany(u => u.RefreshTokens)
                .HasForeignKey(e => e.UserId)
                .OnDelete(DeleteBehavior.Cascade);
        });
    }
}
