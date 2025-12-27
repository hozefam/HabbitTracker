-- Seed data for testing
-- This script will be run after tables are created
-- NOTE: The test user should be created via the Register API endpoint
-- Use: email: test@habbittracker.com, password: Test@123

-- Delete existing test user if it exists (to avoid conflicts)
DELETE FROM [dbo].[Users] WHERE [Email] = 'test@habbittracker.com';
GO

-- Sample habits and logs will be added after the user is created via the API
