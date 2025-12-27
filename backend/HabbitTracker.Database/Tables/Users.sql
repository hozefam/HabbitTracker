CREATE TABLE [dbo].[Users]
(
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Username] NVARCHAR(50) NOT NULL UNIQUE,
    [Email] NVARCHAR(255) NOT NULL UNIQUE,
    [PasswordHash] NVARCHAR(255) NOT NULL,
    [FirstName] NVARCHAR(100) NULL,
    [LastName] NVARCHAR(100) NULL,
    [CreatedAt] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
    [UpdatedAt] DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
    [IsActive] BIT NOT NULL DEFAULT 1,
    [LastLoginAt] DATETIME2 NULL
);
GO

CREATE INDEX [IX_Users_Email] ON [dbo].[Users] ([Email]);
GO

CREATE INDEX [IX_Users_Username] ON [dbo].[Users] ([Username]);
GO
