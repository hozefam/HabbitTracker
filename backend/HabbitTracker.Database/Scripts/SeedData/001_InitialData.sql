-- Seed data for testing
-- This script will be run after tables are created

-- Insert test user (password: Test@123 - hashed)
SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT INTO [dbo].[Users] ([Id], [Username], [Email], [PasswordHash], [FirstName], [LastName], [IsActive])
VALUES 
(1, 'testuser', 'test@habbittracker.com', 'AQAAAAIAAYagAAAAEBqE8JvKz1v+M3xGqGvXqJ3vJ8TpL3yX+qF5kW9nH2zD4sE7fR6pQ8tL0mN1oP2rK==', 'Test', 'User', 1);

SET IDENTITY_INSERT [dbo].[Users] OFF;

-- Insert sample habits
SET IDENTITY_INSERT [dbo].[Habits] ON;

INSERT INTO [dbo].[Habits] ([Id], [UserId], [Name], [Description], [Category], [Frequency], [TargetCount], [Color], [Icon], [IsActive])
VALUES 
(1, 1, 'Morning Exercise', 'Do 30 minutes of exercise', 'Health', 'Daily', 1, '#10B981', 'exercise', 1),
(2, 1, 'Read Book', 'Read for at least 20 minutes', 'Learning', 'Daily', 1, '#3B82F6', 'book', 1),
(3, 1, 'Drink Water', 'Drink 8 glasses of water', 'Health', 'Daily', 8, '#06B6D4', 'water', 1),
(4, 1, 'Meditate', '10 minutes of meditation', 'Wellness', 'Daily', 1, '#8B5CF6', 'meditation', 1),
(5, 1, 'Practice Coding', 'Code for 1 hour', 'Learning', 'Daily', 1, '#F59E0B', 'code', 1);

SET IDENTITY_INSERT [dbo].[Habits] OFF;

-- Insert some sample logs (last 7 days)
DECLARE @Today DATE = CAST(GETUTCDATE() AS DATE);

INSERT INTO [dbo].[HabitLogs] ([HabitId], [CompletionDate], [CompletedAt])
VALUES 
-- Today
(1, @Today, GETUTCDATE()),
(2, @Today, GETUTCDATE()),
(3, @Today, GETUTCDATE()),
-- Yesterday
(1, DATEADD(DAY, -1, @Today), DATEADD(DAY, -1, GETUTCDATE())),
(2, DATEADD(DAY, -1, @Today), DATEADD(DAY, -1, GETUTCDATE())),
(4, DATEADD(DAY, -1, @Today), DATEADD(DAY, -1, GETUTCDATE())),
-- 2 days ago
(1, DATEADD(DAY, -2, @Today), DATEADD(DAY, -2, GETUTCDATE())),
(2, DATEADD(DAY, -2, @Today), DATEADD(DAY, -2, GETUTCDATE())),
(3, DATEADD(DAY, -2, @Today), DATEADD(DAY, -2, GETUTCDATE())),
(5, DATEADD(DAY, -2, @Today), DATEADD(DAY, -2, GETUTCDATE()));

GO
