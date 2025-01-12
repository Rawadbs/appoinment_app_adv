# appoinment_app_adv

A new Flutter project.

## 🎨 System design
### Core Module (`lib-core/`)
The `lib-core/` directory contains foundational components shared across the app:
- **`lib-core-di/`**: Manages dependency injection setup (e.g., `GetIt` or `Provider` configuration).
- **`lib-core-networking/`**: Includes API clients, interceptors, and networking utilities.
- **`lib-core-routing/`**: Defines the app's navigation and route management.
- **`lib-core-helpers/`**: Provides general-purpose helper functions or classes.
- **`lib-core-theme/`**: Centralized themes and styling resources.
- **`lib-core-widgets/`**: Reusable, non-feature-specific widgets.

### Feature Modules (`lib-Feature/`)
Each feature is encapsulated into its own module for modular and maintainable development:
- **`lib-Feature-home/`**: Handles everything related to the Home feature.
  - **`lib-Feature-home-data/`**: Manages data logic, including models and repository implementations.
    - **`lib-Feature-home-data-models/`**: Defines data structures and models for the feature.
    - **`lib-Feature-home-data-repository/`**: Implements data fetching and persistence logic.
  - **`lib-Feature-home-logic/`**: Contains business logic and state management.
    - **`lib-Feature-home-logic-cubit/`**: Cubit implementations for managing states.
    - **`lib-Feature-home-logic-state/`**: Definitions of various states.
  - **`lib-Feature-home-ui/`**: Includes the user interface components for the Home feature.
    - **`lib-Feature-home-ui-screens/`**: Screens or pages of the feature.
    - **`lib-Feature-home-ui-widgets/`**: Widgets specific to the feature.


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
