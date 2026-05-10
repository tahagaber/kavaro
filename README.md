# Kavaro App 🚀

Kavaro is a comprehensive and modern Flutter mobile application that seamlessly integrates E-commerce, Social Networking, and Chat functionalities. The app is designed with a strong focus on premium UI/UX aesthetics (e.g., "Aurora" theme, glassmorphism) and high code maintainability.

## 🏗 Architecture & Folder Structure

The project follows a **Feature-Based Modular Architecture** combined with a **Micro-Widget Pattern**. This ensures that the codebase remains scalable, readable, and easy to maintain as the app grows.

### Directory Layout

```text
lib/
│
├── constats/          # Global constants like AppColors, Themes, and App TextStyles.
├── features/          # Feature-specific business logic and helpers.
├── managers/          # Global managers (e.g., Session management, Data controllers).
├── models/            # Data models and entities.
├── screen/            # The UI Layer, divided by feature modules.
│   ├── auth/          # Authentication flow (Login, Register, OTP, Forget Password).
│   │   ├── forget_password/
│   │   │   └── widgets/ # Local widgets specific to the forget password flow.
│   │   └── OTB/
│   └── core/          # Core app features (Home, Market, Checkout, Profile, Chat).
│
├── widgets/           # Global reusable UI components (e.g., GradientButton, AuthBrandSection).
└── main.dart          # App entry point and global Route configuration.
```

### Architectural Decisions

1. **Micro-Widget Extraction:** 
   Large UI screens (like Checkout, Profile, and Auth) are heavily refactored. Instead of having thousands of lines of code in a single file, complex sections are extracted into their own `widgets/` folder locally next to the screen. 
   *Example: `AuthBackground`, `AuthHeader`, and `AuthTextField` were extracted to unify the Authentication UI.*

2. **Global vs Local Widgets:** 
   Widgets used across entirely different features reside in `lib/widgets/`. Widgets used only within a specific screen or flow reside in `lib/screen/{feature}/widgets/`. This scoping prevents the global widget folder from becoming cluttered.

3. **Design System Standardization:**
   Colors, typography, and gradients are centralized in `lib/constats/app_colors.dart`. This guarantees that if a primary color changes, it applies globally without searching through UI files.

4. **Navigation:**
   The application heavily relies on Flutter's Named Routes (configured in `MaterialApp`) for clean and predictable navigation between Splash, Auth, and Core screens.

## ✨ Recent Technical Achievements

- **Code Refactoring & Size Reduction:** Drastically reduced the code size of `OtbScreen`, `ForgetPasswordScreen`, and `ResetPasswordScreen` by creating highly reusable widgets. This improved readability while preserving the exact 100% UI fidelity.
- **Premium UI Overhaul:** Upgraded the visual interface (e.g., Socket Chat UI) to an "Aurora" theme, integrating dynamic gradients and glowing shadows.
- **Asset Migration:** Shifted from remote network images to optimized local assets for better performance, faster rendering, and offline availability.
- **Enhanced Modularity:** Refactored complex screens like `CheckoutScreen` and `ProfileScreen` into independent blocks (e.g., Order Summary, Payment Section) to isolate UI logic.

## 🛠 Tech Stack

- **Framework:** Flutter / Dart
- **UI Assets:** Google Fonts (`google_fonts`), Cupertino Icons
- **Hardware Integration:** Camera API (`camera`)
- **State Management:** *StatefulWidget* (Currently relying on standard Flutter lifecycle states, architected to scale into advanced state management later if needed).

---
*Built with ❤️ focusing on clean code and premium user experience.*
