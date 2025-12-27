CREATE PROCEDURE [dbo].[sp_GetUserDashboardStats]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Total active habits
    DECLARE @TotalHabits INT;
    SELECT @TotalHabits = COUNT(*) 
    FROM [dbo].[Habits] 
    WHERE [UserId] = @UserId AND [IsActive] = 1;

    -- Completed today
    DECLARE @CompletedToday INT;
    SELECT @CompletedToday = COUNT(DISTINCT hl.[HabitId])
    FROM [dbo].[HabitLogs] hl
    INNER JOIN [dbo].[Habits] h ON hl.[HabitId] = h.[Id]
    WHERE h.[UserId] = @UserId 
        AND hl.[CompletionDate] = CAST(GETUTCDATE() AS DATE);

    -- Current longest streak
    DECLARE @LongestStreak INT = 0;
    -- Simplified - would need complex logic for actual streak calculation

    -- Success rate (last 30 days)
    DECLARE @SuccessRate DECIMAL(5,2);
    SELECT @SuccessRate = 
        CASE 
            WHEN COUNT(DISTINCT h.[Id]) * 30 > 0 
            THEN (CAST(COUNT(hl.[Id]) AS DECIMAL) / (COUNT(DISTINCT h.[Id]) * 30)) * 100 
            ELSE 0 
        END
    FROM [dbo].[Habits] h
    LEFT JOIN [dbo].[HabitLogs] hl ON h.[Id] = hl.[HabitId] 
        AND hl.[CompletionDate] >= DATEADD(DAY, -30, CAST(GETUTCDATE() AS DATE))
    WHERE h.[UserId] = @UserId AND h.[IsActive] = 1;

    SELECT 
        @TotalHabits AS [TotalHabits],
        @CompletedToday AS [CompletedToday],
        @LongestStreak AS [CurrentStreak],
        @SuccessRate AS [SuccessRate];
END
GO
