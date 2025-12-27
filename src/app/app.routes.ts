import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { LoginComponent } from './pages/login/login.component';
import { Route } from '@angular/router';

export const appRoutes: Route[] = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: 'habits', component: DashboardComponent }, // TODO: Create HabitsComponent
  { path: 'analytics', component: DashboardComponent }, // TODO: Create AnalyticsComponent
  { path: 'settings', component: DashboardComponent }, // TODO: Create SettingsComponent
];
