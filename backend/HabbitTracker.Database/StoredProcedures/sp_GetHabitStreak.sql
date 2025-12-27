CREATE PROCEDURE [dbo].[sp_GetHabitStreak]
    @HabitId INT
AS
BEGIN
    SET NOCOUNT ON;

    WITH DateSequence AS (
        SELECT DISTINCT [CompletionDate]
        FROM [dbo].[HabitLogs]
        WHERE [HabitId] = @HabitId
    ),
    Gaps AS (
        SELECT 
            [CompletionDate],
            DATEDIFF(DAY, LAG([CompletionDate], 1, [CompletionDate]) OVER (ORDER BY [CompletionDate]), [CompletionDate]) AS [DayGap]
        FROM DateSequence
    ),
    Streaks AS (
        SELECT 
            [CompletionDate],
            SUM(CASE WHEN [DayGap] > 1 THEN 1 ELSE 0 END) OVER (ORDER BY [CompletionDate]) AS [StreakGroup]
        FROM Gaps
    )
    SELECT 
        [StreakGroup],
        MIN([CompletionDate]) AS [StreakStart],
        MAX([CompletionDate]) AS [StreakEnd],
        COUNT(*) AS [StreakLength]
    FROM Streaks
    GROUP BY [StreakGroup]
    ORDER BY [StreakStart] DESC;
END
GO
