# .NET Web API Backend

## Structure

```
backend/
├── HabbitTracker.sln
└── HabbitTracker.API/
    ├── Controllers/
    ├── Models/
    ├── Services/
    ├── Data/
    └── Program.cs
```

## Installed Packages

- **Microsoft.AspNetCore.Authentication.JwtBearer** - JWT authentication
- **Microsoft.EntityFrameworkCore** - ORM for database
- **Microsoft.EntityFrameworkCore.SqlServer** - SQL Server provider
- **Swashbuckle.AspNetCore** - Swagger/OpenAPI documentation

## Running the API

```bash
cd backend/HabbitTracker.API
dotnet run
```

API will be available at:

- HTTP: `http://localhost:5000`
- HTTPS: `https://localhost:5001`
- Swagger: `https://localhost:5001/swagger`

## Database Setup

Update `appsettings.json` with your connection string:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=HabbitTrackerDb;Trusted_Connection=true;"
  }
}
```

## Next Steps

1. Create Models (User, Habit, etc.)
2. Set up DbContext
3. Add Authentication controllers
4. Configure JWT settings
5. Run migrations
