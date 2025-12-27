import {
  AuthResponse,
  LoginRequest,
  RegisterRequest,
  User,
} from '../models/auth.model';
import { Injectable, signal } from '@angular/core';
import { Observable, tap } from 'rxjs';

import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private readonly API_URL = 'https://localhost:7000/api';
  private readonly TOKEN_KEY = 'auth_token';
  private readonly REFRESH_TOKEN_KEY = 'refresh_token';

  currentUser = signal<User | null>(null);
  isAuthenticated = signal<boolean>(false);

  constructor(
    private http: HttpClient,
    private router: Router,
  ) {
    this.checkAuth();
  }

  login(request: LoginRequest): Observable<AuthResponse> {
    return this.http
      .post<AuthResponse>(`${this.API_URL}/auth/login`, request)
      .pipe(tap((response) => this.handleAuthResponse(response)));
  }

  register(request: RegisterRequest): Observable<AuthResponse> {
    return this.http
      .post<AuthResponse>(`${this.API_URL}/auth/register`, request)
      .pipe(tap((response) => this.handleAuthResponse(response)));
  }

  logout(): void {
    localStorage.removeItem(this.TOKEN_KEY);
    localStorage.removeItem(this.REFRESH_TOKEN_KEY);
    this.currentUser.set(null);
    this.isAuthenticated.set(false);
    this.router.navigate(['/login']);
  }

  getToken(): string | null {
    return localStorage.getItem(this.TOKEN_KEY);
  }

  getRefreshToken(): string | null {
    return localStorage.getItem(this.REFRESH_TOKEN_KEY);
  }

  refreshToken(): Observable<AuthResponse> {
    const refreshToken = this.getRefreshToken();
    if (!refreshToken) {
      this.logout();
      throw new Error('No refresh token available');
    }

    return this.http
      .post<AuthResponse>(`${this.API_URL}/auth/refresh`, { refreshToken })
      .pipe(tap((response) => this.handleAuthResponse(response)));
  }

  private handleAuthResponse(response: AuthResponse): void {
    localStorage.setItem(this.TOKEN_KEY, response.token);
    localStorage.setItem(this.REFRESH_TOKEN_KEY, response.refreshToken);
    this.currentUser.set(response.user);
    this.isAuthenticated.set(true);
  }

  private checkAuth(): void {
    const token = this.getToken();
    if (token) {
      // TODO: Decode token and set user info
      this.isAuthenticated.set(true);
    }
  }
}
