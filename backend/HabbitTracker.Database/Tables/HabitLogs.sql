CREATE TABLE [dbo].[HabitLogs]
(
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [HabitId] INT NOT NULL,
    [CompletedAt] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
    [Notes] NVARCHAR(500) NULL,
    [CompletionDate] DATE NOT NULL, -- Date for aggregation
    CONSTRAINT [FK_HabitLogs_Habits] FOREIGN KEY ([HabitId]) REFERENCES [dbo].[Habits]([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_HabitLogs_HabitId] ON [dbo].[HabitLogs] ([HabitId]);
CREATE INDEX [IX_HabitLogs_CompletionDate] ON [dbo].[HabitLogs] ([CompletionDate]);
CREATE UNIQUE INDEX [IX_HabitLogs_HabitId_CompletionDate] ON [dbo].[HabitLogs] ([HabitId], [CompletionDate]);
