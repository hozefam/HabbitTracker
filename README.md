# Habit Tracker

An Angular monorepo application built with Nx, featuring Jest for testing and Tailwind CSS for styling.

## 🚀 Tech Stack

- **Framework**: Angular (standalone components)
- **Monorepo Tool**: Nx
- **Testing**: Jest
- **Styling**: Tailwind CSS v3
- **Linting**: ESLint
- **Package Manager**: npm

## 📦 Project Structure

```
HabbitTracker/
├── src/              # Main application source code
│   ├── app/          # Angular application components
│   └── styles.css    # Global styles with Tailwind directives
├── dist/             # Build output
├── node_modules/     # Dependencies
└── libs/             # Shared libraries (future)
```

## 🛠️ Getting Started

### Prerequisites

- Node.js (v18 or later)
- npm

### Installation

Dependencies are already installed. If needed, run:

```sh
npm install
```

## 📝 Development

### Run Development Server

Start the development server:

```sh
npx nx serve habit-tracker
# or
npm start
```

Navigate to `http://localhost:4200/`. The app will automatically reload if you change any source files.

### Build for Production

Create a production build:

```sh
npx nx build habit-tracker
# or
npm run build
```

Build artifacts will be stored in the `dist/` directory.

### Run Tests

Execute Jest unit tests:

```sh
npx nx test habit-tracker
# or
npm test
```

### Lint Code

Run ESLint:

```sh
npx nx lint habit-tracker
# or
npm run lint
```

## 📚 Creating Libraries

Generate a new shared library:

```sh
npx nx g @nx/angular:lib <library-name>
```

Example library types:

- **Feature libraries**: `npx nx g @nx/angular:lib feature-habits`
- **UI libraries**: `npx nx g @nx/angular:lib ui-components`
- **Data access libraries**: `npx nx g @nx/angular:lib data-access`
- **Utility libraries**: `npx nx g @nx/angular:lib utils`

## 🎨 Tailwind CSS

Tailwind CSS v3 is configured and ready to use. Utility classes are available throughout the application.

### Example Usage

```html
<div class="flex items-center justify-center h-screen bg-gray-100">
  <h1 class="text-4xl font-bold text-blue-600">Hello Tailwind!</h1>
</div>
```

Configuration file: `tailwind.config.js`

## 🧪 Testing with Jest

Jest is configured for unit testing. Test files should be placed next to the components they test with a `.spec.ts` extension.

### Example Test

```typescript
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MyComponent } from './my-component';

describe('MyComponent', () => {
  let component: MyComponent;
  let fixture: ComponentFixture<MyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MyComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(MyComponent);
    component = fixture.componentInstance;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
```

## 🔍 Nx Commands

### View Project Graph

Visualize your workspace dependencies:

```sh
npx nx graph
```

### List Available Plugins

```sh
npx nx list
```

### Show Project Details

```sh
npx nx show project habit-tracker
```

## 📖 Learn More

- [Nx Documentation](https://nx.dev)
- [Angular Documentation](https://angular.dev)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Jest Documentation](https://jestjs.io/docs/getting-started)

## 🤝 Contributing

1. Create a new branch for your feature
2. Make your changes
3. Write/update tests
4. Run tests and linting
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

- [Our blog](https://nx.dev/blog?utm_source=nx_project&utm_medium=readme&utm_campaign=nx_projects)
