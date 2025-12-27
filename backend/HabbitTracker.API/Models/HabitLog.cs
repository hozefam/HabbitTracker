namespace HabbitTracker.API.Models;

public class HabitLog
{
    public int Id { get; set; }
    public int HabitId { get; set; }
    public DateTime CompletedAt { get; set; } = DateTime.UtcNow;
    public DateTime CompletionDate { get; set; }

    // Navigation property
    public Habit Habit { get; set; } = null!;
}
