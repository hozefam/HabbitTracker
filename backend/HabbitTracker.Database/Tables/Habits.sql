CREATE TABLE [dbo].[Habits]
(
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserId] INT NOT NULL,
    [Name] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(500) NULL,
    [Category] NVARCHAR(50) NULL,
    [Frequency] NVARCHAR(20) NOT NULL, -- Daily, Weekly, Monthly
    [TargetCount] INT NOT NULL DEFAULT 1, -- How many times per frequency period
    [Color] NVARCHAR(7) NULL, -- Hex color for UI
    [Icon] NVARCHAR(50) NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedAt] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
    [UpdatedAt] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
    CONSTRAINT [FK_Habits_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users]([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_Habits_UserId] ON [dbo].[Habits] ([UserId]);
CREATE INDEX [IX_Habits_Category] ON [dbo].[Habits] ([Category]);
