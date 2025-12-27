import { Component } from '@angular/core';
import { HeaderComponent } from './layout/header/header.component';
import { RouterModule } from '@angular/router';
import { SidebarComponent } from './layout/sidebar/sidebar.component';

@Component({
  imports: [RouterModule, SidebarComponent, HeaderComponent],
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App {
  protected title = 'habit-tracker';
}
