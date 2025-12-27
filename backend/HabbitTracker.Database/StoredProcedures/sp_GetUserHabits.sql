CREATE PROCEDURE [dbo].[sp_GetUserHabits]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        h.[Id],
        h.[UserId],
        h.[Name],
        h.[Description],
        h.[Category],
        h.[Frequency],
        h.[TargetCount],
        h.[Color],
        h.[Icon],
        h.[IsActive],
        h.[CreatedAt],
        h.[UpdatedAt],
        COUNT(hl.[Id]) AS [TotalCompletions],
        MAX(hl.[CompletionDate]) AS [LastCompletedDate]
    FROM [dbo].[Habits] h
    LEFT JOIN [dbo].[HabitLogs] hl ON h.[Id] = hl.[HabitId]
    WHERE h.[UserId] = @UserId AND h.[IsActive] = 1
    GROUP BY 
        h.[Id], h.[UserId], h.[Name], h.[Description], 
        h.[Category], h.[Frequency], h.[TargetCount], 
        h.[Color], h.[Icon], h.[IsActive], 
        h.[CreatedAt], h.[UpdatedAt]
    ORDER BY h.[CreatedAt] DESC;
END
GO
