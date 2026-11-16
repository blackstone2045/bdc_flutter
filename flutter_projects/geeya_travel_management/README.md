# 🌍 Geeya Travel Management

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)

**Geeya Travel Management** is a comprehensive and feature-rich Flutter application designed to simplify travel planning, guide booking, and destination discovery. It provides a beautiful, intuitive interface for users to explore the world, manage their travel subscriptions, and connect with professional tour guides.

---

## ✨ Key Features

- **🔐 Robust Authentication:** Complete user flow including Login, Sign Up, Password Reset, and OTP Verification, complete with social login integrations.
- **🌍 Discover Destinations:** Browse featured destinations, curated travel lists, and discover hidden gems around the world.
- **🧭 Guide Details:** Explore detailed profiles of tour guides, check their expertise, ratings, and booking availability.
- **💳 Subscription & Paywall:** Manage premium memberships (free/premium tiers) and unlock exclusive travel content via an elegant paywall screen.
- **👤 User Profiles:** Customize personal profiles, manage application language settings, and access a rich bottom-sheet driven settings menu.
- **🔔 Smart Notifications:** Real-time engagement using Firebase Cloud Messaging (FCM) and highly customizable local notifications for updates, booking statuses, and alerts.
- **🎨 Theming & UI:** Clean, modern styling utilizing a custom theme engine, responsive sizing, and reusable animated widgets.

---

## 🛠️ Tech Stack & Architecture

- **Framework:** Flutter
- **Language:** Dart
- **Architecture:** Feature-Driven Clean Architecture 
  - Each feature is encapsulated with its own `Presentation` (UI/Controllers), `Domain` (Entities/Use Cases), and `Data` (Repositories/Models) layers.
- **State Management & Routing:** GetX (Utilizing `GetxController`, dynamic bindings, and `GetMaterialApp` routing).
- **Backend & Services:** 
  - Custom API Network Caller for RESTful interactions.
  - Firebase Messaging & Local Notification Services.

---

## 📂 Project Structure

The project is highly modular, prioritizing separation of concerns for scalability:

```text
lib/
 ├── core/                  # Core configurations, network callers, and shared assets
 │   ├── bindings/          # Dependency injection / controller bindings
 │   ├── common/            # Reusable UI components (buttons, app bars, text fields)
 │   ├── services/          # Core Services (API Caller, Auth, FCM, Local Notifications)
 │   └── utils/             # Constants, custom themes, validators, helpers, and formatters
 ├── features/              # App features separated by domain
 │   ├── authentication/    # Login, signup, forgot password, and splash screens
 │   ├── discover/          # Destination discovery and exploration
 │   ├── guide_details/     # Tour guide profiles and booking details
 │   ├── home/              # Main dashboard and featured travel content
 │   ├── nav_bar/           # Bottom navigation bar controller and UI
 │   ├── profile/           # User settings, localization, and edit profile
 │   ├── subscription/      # Membership plans and paywalls
 │   └── welcome/           # Onboarding and welcome flow
 ├── routes/                # Application route definitions (`app_routes.dart`)
 ├── app.dart               # Main App widget setup and theme initialization
 └── main.dart              # Application entry point
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version recommended)
- Dart SDK
- Android Studio / VS Code / IntelliJ IDEA

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/geeya_travel_management.git
   ```

2. Navigate to the project directory:
   ```bash
   cd geeya_travel_management
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

---

## 👨‍💻 Developer

**Nifat Chowdhury Mahin**  
*Software Engineer*

---
*Built with ❤️ using Flutter.*
