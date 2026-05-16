# 🎬 MyMovies App

A modern, feature-rich Flutter application for discovering and managing movies. Built with clean architecture principles and cutting-edge Flutter technologies, MyMovies provides a seamless user experience for browsing, searching, and organizing your favorite films.

## ✨ Features

### 🎥 Movie Discovery & Management

- **Browse Movies**: Discover movies across various categories with an elegant, intuitive interface
- **Advanced Search**: Powerful search functionality to find movies by title and metadata
- **Movie Details**: Comprehensive movie information including ratings, descriptions, and cast details
- **Collections**: Create and manage personalized movie collections for easy organization
- **Cached Movie Data**: Offline movie browsing with intelligent caching system

### 👤 User Authentication & Profile

- **Secure Authentication**: Firebase-powered login and signup with modern security practices
- **User Profiles**: Personalized user profiles for managing preferences and saved collections
- **Onboarding**: Guided first-time user experience
- **Session Management**: Persistent login state with secure logout

### ⚙️ Advanced Features

- **Multi-Language Support**: Internationalization (i18n) for global user base
- **Dark & Light Themes**: Customizable UI themes matching user preferences
- **Settings Management**: Granular control over app behavior and preferences
- **Video Integration**: YouTube video player integration for trailers
- **Network Status Monitoring**: Real-time internet connectivity detection with offline-aware UI

## 🏗️ Architecture

The app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── features/           # Feature modules (Auth, Movies)
│   ├── auth/          # Authentication feature
│   │   ├── data/      # Data sources, repositories
│   │   ├── domain/    # Entities, use cases, contracts
│   │   └── presentation/ # UI, BLoCs, pages
│   └── movies/        # Movies feature
│       ├── data/      # API clients, local cache
│       ├── domain/    # Movie entities, repositories
│       └── presentation/ # UI components, BLoCs
├── core/              # Shared & core utilities
│   ├── config/        # Firebase & app configuration
│   ├── localization/  # i18n & translations
│   ├── network/       # API clients & connectivity
│   ├── routing/       # GoRouter configuration
│   ├── theme/         # App themes & styling
│   └── utils/         # Helper utilities
└── main.dart          # App entry point
```

## 🛠️ Tech Stack

### State Management & DI

- **Flutter BLoC**: Robust state management pattern
- **GetIt**: Service locator for dependency injection

### Navigation & Networking

- **GoRouter**: Type-safe routing and navigation
- **Dio**: HTTP client with interceptors
- **Connectivity Plus**: Real-time network status monitoring

### Backend & Authentication

- **Firebase Core**: Backend infrastructure
- **Firebase Auth**: User authentication
- **Cloud Firestore**: Real-time database
- **Google Cloud Storage**: Media storage

### Local Persistence

- **Isar**: Fast, embeddable NoSQL database
- **SharedPreferences**: Lightweight key-value storage
- **Path Provider**: File system path access

### UI & Presentation

- **Google Fonts**: Beautiful typography
- **Cached Network Image**: Image optimization & caching
- **Shimmer**: Loading skeleton screens
- **YouTube Player Flutter**: Video playback

### Localization & Configuration

- **Slang**: Type-safe translations
- **Flutter Dotenv**: Environment configuration

## 📋 Requirements

- **Flutter**: >=3.3.0
- **Dart**: >=3.3.0
- **Minimum Android API**: 21+
- **Minimum iOS Version**: 12.0+

## 🚀 Getting Started

### 1. Prerequisites

Ensure you have Flutter installed and configured:

```bash
flutter doctor
```

### 2. Installation

```bash
# Clone the repository
git clone <repository-url>
cd my_movies_app

# Install dependencies
flutter pub get

# Generate necessary files
flutter pub run build_runner build
flutter pub run slang
```

### 3. Configuration

Create a `.env` file in the project root with your Firebase configuration:

```
FIREBASE_API_KEY=your_api_key
TMDB_API_KEY=your_tmdb_api_key
```

### 4. Run the App

```bash
# Development
flutter run

# Release
flutter run --release

# Specific device
flutter run -d <device_id>
```

## 📱 Supported Platforms

- ✅ Android (API 21+)
- ✅ iOS (12.0+)
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🎯 App Flow

```
App Start
    ↓
Internet Check ← If offline, show network status screen
    ↓
Firebase Initialization
    ↓
Check Auth State
    ├→ Not Authenticated → Onboarding/Login
    └→ Authenticated → Main App
         ├→ Home (Browse Movies)
         ├→ Search (Find Movies)
         ├→ Collections (Saved)
         ├→ Settings (Preferences)
         └→ Profile (User Info)
```

## 🔐 Authentication Flow

1. **Onboarding**: First-time users see app introduction
2. **Sign Up**: Create account with email/password
3. **Login**: Authenticate with credentials
4. **Session**: Persistent login with Firebase Auth
5. **Logout**: Secure session termination

## 🌐 Network Status Handling

The app includes real-time internet connectivity monitoring:

- **Online**: Full app functionality
- **Offline**: Limited features with cached data, offline reminder screen

## 📚 Project Structure & Best Practices

### Clean Code Principles

- **Single Responsibility**: Each class has one reason to change
- **DRY (Don't Repeat Yourself)**: Reusable components and utilities
- **SOLID Principles**: Applied throughout the codebase
- **Consistent Naming**: Clear, descriptive variable and function names
- **Type Safety**: Null safety enabled, strong typing enforced

### Code Organization

- Feature-driven modular structure
- Separation of concerns (presentation, domain, data)
- Dependency injection for loose coupling
- Repository pattern for data abstraction

### Performance Optimization

- Lazy loading and pagination
- Image caching and optimization
- Minimal widget rebuilds with BLoC
- Efficient local database queries

## 📦 Dependencies Overview

| Package           | Version | Purpose              |
| ----------------- | ------- | -------------------- |
| flutter_bloc      | 8.1.6   | State management     |
| firebase_core     | 2.32.0  | Backend services     |
| cloud_firestore   | 4.17.5  | Real-time database   |
| dio               | 5.4.0   | HTTP networking      |
| go_router         | 14.0.0  | Routing & navigation |
| isar              | 3.1.0+1 | Local database       |
| connectivity_plus | 6.0.0   | Network detection    |
| slang             | 4.14.0  | Localization         |

## 🐛 Debugging & Troubleshooting

### Common Issues

**Firebase Initialization Error**

```bash
# Rebuild Android/iOS native files
flutter clean
flutter pub get
flutter run
```

**Build Cache Issues**

```bash
flutter clean
flutter pub get
flutter pub run build_runner build
```

**Localization Not Loading**

```bash
flutter pub run slang
flutter run
```

## 📝 Contributing Guidelines

1. Follow Flutter/Dart style guidelines
2. Maintain clean architecture separation
3. Add comments for complex logic
4. Test features before committing
5. Use meaningful commit messages

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙋 Support & Contact

For issues, feature requests, or questions:

- Open an issue on GitHub
- Check existing documentation
- Review architecture patterns in the codebase

## 🔄 Future Enhancements

- [ ] Offline-first architecture improvements
- [ ] Advanced analytics integration
- [ ] Machine learning recommendations
- [ ] Social features (sharing, ratings)
- [ ] Premium subscription model
- [ ] Real-time notifications
- [ ] Advanced caching strategies

---

**Built with ❤️ by Muhammed jameel - May/2026**
