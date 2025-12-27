import { Component, signal } from '@angular/core';
import { Router, RouterLink } from '@angular/router';

import { AuthService } from '../../services/auth.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, RouterLink],
  template: `
    <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100 px-4">
      <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-xl shadow-lg">
        <div>
          <h2 class="text-center text-3xl font-extrabold text-gray-900">
            Welcome Back
          </h2>
          <p class="mt-2 text-center text-sm text-gray-600">
            Sign in to track your habits
          </p>
        </div>
        
        <form class="mt-8 space-y-6" (ngSubmit)="onSubmit()">
          @if (errorMessage()) {
            <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded">
              {{ errorMessage() }}
            </div>
          }

          <div class="space-y-4">
            <div>
              <label for="email" class="block text-sm font-medium text-gray-700">
                Email address
              </label>
              <input
                id="email"
                name="email"
                type="email"
                required
                [(ngModel)]="email"
                class="mt-1 appearance-none relative block w-full px-3 py-2 border border-gray-300 rounded-lg placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                placeholder="Enter your email"
              />
            </div>

            <div>
              <label for="password" class="block text-sm font-medium text-gray-700">
                Password
              </label>
              <input
                id="password"
                name="password"
                type="password"
                required
                [(ngModel)]="password"
                class="mt-1 appearance-none relative block w-full px-3 py-2 border border-gray-300 rounded-lg placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
                placeholder="Enter your password"
              />
            </div>
          </div>

          <div>
            <button
              type="submit"
              [disabled]="isLoading()"
              class="group relative w-full flex justify-center py-2.5 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
            >
              @if (isLoading()) {
                <span>Signing in...</span>
              } @else {
                <span>Sign in</span>
              }
            </button>
          </div>

          <div class="text-center">
            <p class="text-sm text-gray-600">
              Don't have an account?
              <a routerLink="/register" class="font-medium text-indigo-600 hover:text-indigo-500">
                Sign up
              </a>
            </p>
          </div>
        </form>

        <div class="mt-6 border-t pt-6">
          <div class="text-sm text-gray-600 bg-blue-50 p-4 rounded-lg">
            <p class="font-medium mb-2 text-blue-900">👉 First Time Setup:</p>
            <p class="mb-2">Please register a new account first by clicking "Sign up" above.</p>
            <p>Use these credentials:</p>
            <p class="mt-1">Email: <span class="font-mono bg-white px-2 py-1 rounded">test@habbittracker.com</span></p>
            <p>Password: <span class="font-mono bg-white px-2 py-1 rounded">Test@123</span></p>
          </div>
        </div>
      </div>
    </div>
  `,
})
export class LoginComponent {
  email = '';
  password = '';
  isLoading = signal(false);
  errorMessage = signal('');

  constructor(
    private authService: AuthService,
    private router: Router,
  ) {}

  onSubmit(): void {
    this.isLoading.set(true);
    this.errorMessage.set('');

    this.authService
      .login({ email: this.email, password: this.password })
      .subscribe({
        next: () => {
          this.router.navigate(['/dashboard']);
        },
        error: (error) => {
          this.errorMessage.set(
            error.error?.message || 'Login failed. Please try again.',
          );
          this.isLoading.set(false);
        },
        complete: () => {
          this.isLoading.set(false);
        },
      });
  }
}
