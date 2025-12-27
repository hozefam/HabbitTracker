namespace HabbitTracker.API.DTOs;

public class LoginRequest
{
    public required string Email { get; set; }
    public required string Password { get; set; }
}

public class RegisterRequest
{
    public required string Username { get; set; }
    public required string Email { get; set; }
    public required string Password { get; set; }
    public string? FirstName { get; set; }
    public string? LastName { get; set; }
}

public class AuthResponse
{
    public required string Token { get; set; }
    public required string RefreshToken { get; set; }
    public required UserDto User { get; set; }
}

public class UserDto
{
    public int Id { get; set; }
    public required string Username { get; set; }
    public required string Email { get; set; }
    public string? FirstName { get; set; }
    public string? LastName { get; set; }
}

public class RefreshTokenRequest
{
    public required string RefreshToken { get; set; }
}
