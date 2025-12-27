namespace HabbitTracker.API.Models;

public class Habit
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public required string Name { get; set; }
    public string? Description { get; set; }
    public string? Category { get; set; }
    public string Frequency { get; set; } = "Daily";
    public int TargetCount { get; set; } = 1;
    public string? Color { get; set; }
    public string? Icon { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

    // Navigation properties
    public User User { get; set; } = null!;
    public ICollection<HabitLog> HabitLogs { get; set; } = new List<HabitLog>();
}
