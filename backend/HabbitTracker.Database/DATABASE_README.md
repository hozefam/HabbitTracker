# HabbitTracker Database Project

## Overview

SQL Server Database Project containing all database objects for the Habit Tracker application.

## Structure

```
HabbitTracker.Database/
├── Tables/                    # Database tables
│   ├── Users.sql
│   ├── Habits.sql
│   ├── HabitLogs.sql
│   └── RefreshTokens.sql
├── StoredProcedures/          # Stored procedures
│   ├── sp_GetUserHabits.sql
│   ├── sp_GetHabitStreak.sql
│   └── sp_GetUserDashboardStats.sql
└── Scripts/
    └── SeedData/              # Seed data scripts
        └── 001_InitialData.sql
```

## Database Schema

### Tables

**Users**

- Primary authentication table
- Stores user credentials and profile info

**Habits**

- User's habit definitions
- Linked to Users table

**HabitLogs**

- Records of completed habits
- Used for tracking and analytics

**RefreshTokens**

- JWT refresh token management
- Security for authentication

### Stored Procedures

**sp_GetUserHabits**

- Retrieves all habits for a user with completion stats

**sp_GetHabitStreak**

- Calculates habit streaks

**sp_GetUserDashboardStats**

- Dashboard statistics (total habits, completed today, success rate)

## Build & Deploy

### Build the project

```bash
cd backend/HabbitTracker.Database
dotnet build
```

### Publish to LocalDB

```bash
dotnet publish /p:TargetServerName="(localdb)\\MSSQLLocalDB" /p:TargetDatabaseName="HabbitTrackerDb"
```

### Or use SQL Server

Update `HabbitTracker.Database.publish.xml` with your connection string, then:

```bash
dotnet publish /p:PublishProfile=HabbitTracker.Database.publish.xml
```

## Connection String

Update in `appsettings.json`:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\MSSQLLocalDB;Database=HabbitTrackerDb;Integrated Security=true;"
  }
}
```

## Test User

After seed data deployment:

- **Username**: testuser
- **Email**: test@habbittracker.com
- **Password**: Test@123 (you'll need to hash this in your application)
