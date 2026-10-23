# 🥕 Nectar Store

**Nectar Store** is a grocery shopping mobile application built with **Flutter** and **Dart**. It provides a clean shopping experience for discovering grocery products, exploring categories, searching and filtering items, managing favourites, and reviewing a shopping cart.


## ✨ Features

- **Onboarding and splash screens** to introduce the app.
- **Authentication screens** for signing in and creating an account.
- **Firebase integration** for app initialization and authentication services.
- **Google Sign-In** support.
- **Home screen** for browsing featured products and offers.
- **Product discovery** through categories and product detail screens.
- **Search and filters** to find products more easily.
- **Favourites** to keep track of preferred products.
- **Shopping cart** to review selected products.
- **Order-flow screens**, including order acceptance/confirmation.
- **Account screen** for account-related options.
- **Responsive layouts** supported by Flutter ScreenUtil.

## 🧰 Tech Stack

| Technology | Purpose |
| --- | --- |
| [Flutter](https://flutter.dev/) | Cross-platform application UI |
| [Dart](https://dart.dev/) | Programming language |
| [Firebase Core](https://firebase.google.com/docs/flutter/setup) | Firebase initialization |
| [Firebase Authentication](https://firebase.google.com/docs/auth) | Authentication services |
| [Google Sign-In](https://pub.dev/packages/google_sign_in) | Google account sign-in |
| [Cloud Firestore](https://firebase.google.com/docs/firestore) | Cloud database integration |
| [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) | Responsive sizing and layout support |

## 📱 Main Screens

- Splash and onboarding
- Sign in and sign up
- Home and product discovery
- Explore categories
- Search and filtering
- Product details
- Favourites
- Shopping cart
- Order confirmation
- Account

## 🚀 Getting Started

### Prerequisites

Before running the project, install:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio or VS Code with the Flutter and Dart extensions
- An Android emulator or a physical device

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Omar-adel-1/Nectar-Store.git
   ```

2. Open the project directory:

   ```bash
   cd Nectar-Store
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Configure Firebase for your own project (see the next section).

5. Run the application:

   ```bash
   flutter run
   ```

## 🔥 Firebase Configuration

This project uses Firebase packages, including Firebase Core, Firebase Authentication, and Cloud Firestore. To run it with your own Firebase project:

1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Register the app for the platform you intend to run.
3. Follow the official [Firebase setup guide for Flutter](https://firebase.google.com/docs/flutter/setup).
4. Enable the authentication providers you plan to use, including Google Sign-In if required.
5. Configure Cloud Firestore if you are using database features.

**Note:** Firebase configuration can vary by platform. Use your own project configuration and avoid committing private credentials or secrets to a public repository.

## 📁 Project Structure

The source code is organized by feature, with screens and supporting data/models separated into folders.

```text
lib/
├── main.dart
├── firebase_options.dart
├── data/
└── features/
    ├── account/
    ├── auth/
    ├── cart/
    ├── explore/
    ├── favourites/
    ├── home/
    ├── navigation/
    ├── onboarding/
    ├── orders/
    ├── product/
    ├── search/
    └── splash/

assets/
├── icons/
└── images/
```

## 🧪 Useful Commands

Check your Flutter environment:

```bash
flutter doctor
```

Format the Dart code:

```bash
dart format .
```

Run tests:

```bash
flutter test
```
## 👨‍💻 Authors

- [@Omar-adel-1](https://github.com/Omar-adel-1)
- [@zeyad_haridiiiii](https://github.com/zeyad_haridiiiii)
- [@abdullah-mohammed-93](https://github.com/abdullah-mohammed-93)

**Project:** [Nectar Store](https://github.com/Omar-adel-1/Nectar-Store)
