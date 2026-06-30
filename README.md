# MyMovies App

A modern, feature-rich Flutter application for discovering movies and TV shows. Built with Clean Architecture and BLoC pattern, MyMovies provides a seamless experience for browsing, searching, managing, and discovering content from **The Movie Database (TMDB)**.

## Features

### Movie & TV Show Discovery

- **Browse by Categories** — Trending, Top Rated, Now Playing, Popular, Upcoming, and genre-based rows (Action, Sci-Fi, Horror, Drama, Comedy, Romance, Thriller, Animation, Mystery)
- **TV Shows** — Dedicated show mode with Popular, Top Rated, Airing Today, On The Air, and genre-based rows
- **Content Type Toggle** — Switch between Cinema (Movies) and TV Shows mode at the top of the home page
- **See All Pages** — Full-list views for every category (separate for movies and shows)
- **Detail Pages** — Movie/TV show detail with overview, ratings, cast, director, seasons & episodes, trailers, and similar recommendations
- **Actor/Person Details** — Biography, birth date, and filmography
- **Director Details** — Biography, birth date, and filmography

### Search

- **Global Search** — Search across Movies, TV Shows, and Actors with category filter chips (All / Movies / TV Shows / Actors)
- **Recent Searches** — Persisted locally with clear option
- **Browse Categories** — Modal sheet for quick genre-based exploration
- **Discover Landing** — Search suggestions and categories on the search page

### "What to Watch" — Swipe Recommendations

- **Filter Setup** — Multi-select genres, minimum rating slider (0–10), release year range, sort order (Popular, Highest Rated, Newest, Oldest, Highest Revenue)
- **Shuffle Toggle** — Randomize movie order
- **Tinder-Style Cards** — Swipe right to save to Watch Later, swipe left to skip
- **Trailer Preview** — Tap a card to open trailer and details
- **First-Use Tutorial** — 3-step dialog explaining the feature
- **Counter** — Shows "X movies added to watch later!" with quick link

### User Authentication & Profile

- **Onboarding Flow** — First-time app introduction with feature cards
- **Email/Password Sign Up** — With validation (email format, password length, confirm match)
- **Email/Password Login** — With error handling
- **Forgot Password** — Send reset link via Firebase Auth
- **Continue as Guest** — Browse without an account
- **Persistent Login** — Firebase Auth state listener with auto-redirect
- **Profile Page** — Watch Later collection, Favorites, My Ratings, Logout with confirmation
- **Guest Profile** — Limited view with prompts to sign in

### Collections & Personalization

- **Watch Later** — Save movies/shows to a personal list
- **Favorites** — Toggle favorite status on movies/shows
- **Personal Ratings** — Slide-to-rate (0–10) on detail pages
- **Login Prompts** — Guest users are prompted to sign in when saving/favoriting/rating

### Settings

- **Dark Mode** — Light, dark, or system theme
- **Language Selector** — English, Kurdish (Sorani), Arabic — real-time locale switching
- **Privacy Policy** — Localized privacy page
- **Contact & Support** — Email link

### Offline & Network Awareness

- **Real-Time Connectivity** — Monitors network state via `connectivity_plus`
- **Offline Banner** — Red snackbar shown when transitioning offline
- **No-Internet Page** — Full-screen offline state with troubleshooting tips and retry
- **Local Caching** — Movies/shows cached via Isar for offline browsing
- **OfflineWrapper** — Global wrapper managing offline state app-wide

### UI/UX

- **Dark & Light Themes** — Brand cinematic red/orange accent colors with custom Sarkar font
- **ShowcaseView Tooltips** — First-use feature discovery for navigation tabs
- **Shimmer Loading Skeletons** — On all pages during data fetch
- **Cached Network Images** — Posters and backdrops with intelligent caching
- **YouTube Trailers** — Inline video player via `youtube_player_iframe`
- **Release Countdown Badges** — Days remaining for upcoming movies
- **Rating Badges** — Vote average badges on movie cards
- **Quick Action Buttons** — Watch Later, Favorite, Rate on movie cards
- **Responsive Design** — Utilities for mobile/tablet/desktop breakpoints
- **404 Not Found Page** — With return-to-home action
- **Floating Glass Nav Bar** — Pill-shaped bottom navigation with blur effect
- **Native Splash Screen** — Dark background with app icon
- **Custom App Icon** — Adaptive icon on Android

## Architecture

Clean Architecture with feature-first modular structure:

```
lib/
├── common/                    # Shared widgets & services
├── core/                      # App infrastructure
│   ├── config/                # Firebase options
│   ├── di/                    # GetIt dependency injection
│   ├── localization/          # Translations wrapper (t.*)
│   ├── network/               # ApiClient (Dio) & ConnectivityCubit
│   ├── routing/               # GoRouter (17 routes)
│   ├── theme/                 # Dark/light themes, colors, typography
│   └── utils/                 # Helpers (locale, responsive)
├── features/
│   ├── auth/                  # Login, signup, onboarding, profile
│   ├── movies/                # Movies browsing, search, detail pages
│   ├── shows/                 # TV shows browsing, search, detail pages
│   └── recommendations/       # Swipe recommendation engine
├── l10n/                      # ARB localization files
└── main.dart                  # Entry point
```

Each feature follows a **data / domain / presentation** structure:

- `data/` — Data sources (remote API, local Isar, Firestore), models, repositories
- `domain/` — Entities, repository contracts, use cases
- `presentation/` — BLoCs/Cubits, pages, widgets

## Tech Stack

| Category             | Package                              | Purpose                                      |
| -------------------- | ------------------------------------ | -------------------------------------------- |
| **State Management** | flutter_bloc ^9.1.1                  | BLoC pattern + Cubits                        |
| **DI**               | get_it ^7.6.0                        | Service locator                              |
| **Routing**          | go_router ^14.0.0                    | Type-safe routing with StatefulShellRoute    |
| **HTTP**             | dio ^5.4.0                           | TMDB API client                              |
| **Auth**             | firebase_auth ^5.5.0                 | Email/password authentication                |
| **Database**         | cloud_firestore ^5.6.0               | Cloud sync (favorites, watch later, ratings) |
| **Local DB**         | isar_community ^3.3.2                | Offline caching                              |
| **Local Storage**    | shared_preferences ^2.2.2            | Key-value persistence                        |
| **Crash Reporting**  | firebase_crashlytics                 | Error logging                                |
| **Analytics**        | firebase_analytics                   | Usage analytics                              |
| **Remote Config**    | firebase_remote_config               | Feature flags                                |
| **Images**           | cached_network_image ^3.3.1          | Image caching                                |
| **Trailers**         | youtube_player_iframe ^5.1.3         | Inline video player                          |
| **Network**          | connectivity_plus ^6.0.0             | Connectivity monitoring                      |
| **Skeletons**        | shimmer ^3.0.0                       | Loading animations                           |
| **Tooltips**         | showcaseview ^5.1.0                  | Feature discovery                            |
| **Localization**     | flutter_localizations + intl ^0.20.2 | ARB-based l10n                               |
| **Env**              | flutter_dotenv ^5.1.0                | .env file loading                            |
| **Code Gen**         | build_runner ^2.4.13                 | Isar schema generation                       |

## Supported Platforms

| Platform          | Status                            |
| ----------------- | --------------------------------- |
| Android (API 21+) | Full                              |
| iOS (12.0+)       | Full                              |
| Web               | Partial (Firebase not configured) |
| Windows           | Partial (Firebase not configured) |
| macOS             | Partial (Firebase not configured) |
| Linux             | Partial (Firebase not configured) |

Firebase services are fully configured for **Android and iOS** only.

## Localization

| Language         | Locale | Coverage         |
| ---------------- | ------ | ---------------- |
| English          | `en`   | Full (~310 keys) |
| Kurdish (Sorani) | `ku`   | Full             |
| Arabic           | `ar`   | Full             |

Real-time locale switching via `SettingsCubit`. TMDB language mapping: `ar` → `ar-SA`, `ku` → `en-US` (fallback).

## Getting Started

### Prerequisites

- Flutter SDK >=3.3.0
- Dart SDK >=3.3.0

### Installation

```bash
# Clone the repo
git clone https://github.com/apollocked/My-Movie-App.git

# Change directory
cd My-Movie-App

# Install dependencies
flutter pub get

# Generate code (Isar schemas)
flutter pub run build_runner build
```

### Configuration

Create a `.env` file in the project root:

```
TMDB_API_KEY=your_tmdb_api_key
TMDB_API_ACCESS_TOKEN=your_tmdb_access_token
```

The app uses TMDB API v3 with Bearer token authentication.

Firebase is pre-configured with `google-services.json` (Android) and `GoogleService-Info.plist` (iOS). For a custom Firebase project, regenerate with `flutterfire configure`.

### Run

```bash
flutter run
```

## App Flow

```
App Start
    ↓
Firebase Initialization
    ↓
Auth State Check
    ├→ Unauthenticated → Onboarding → Login/Sign Up → Home
    └→ Authenticated → Home
                          ├─ Home (Movies / TV Shows toggle)
                          ├─ Search (Movies, Shows, Actors)
                          ├─ What to Watch (Swipe recommendations)
                          ├─ Profile (Watch Later, Favorites, Ratings)
                          └─ Settings (Theme, Language, About)
```

## Offline Behavior

The app includes real-time connectivity monitoring via `connectivity_plus`. A persistent red banner appears at the top of the screen when offline, and a SnackBar notifies on the transition.

| Feature | Offline Behavior |
|---|---|
| **Visual indicator** | Persistent red banner "You are offline" + SnackBar on transition |
| **Home — Movies** | Partially works — shows previously cached categories from Isar; unvisited categories show error |
| **Home — TV Shows** | Fails — no caching for show categories |
| **Search (movies/shows/actors)** | Fails — shows error with Retry button; no local search cache |
| **Movie Detail Page** | Fails — shows blank page (no error message); pull-to-refresh to retry |
| **Add to Favorites** | **Works** — authenticates users fall back to SharedPreferences; guest users always save locally |
| **Rate a Movie** | **Works** — same fallback mechanism |
| **Save to Watch Later** | **Works** — same fallback mechanism |
| **View Profile / Watch Later / Favorites** | **Works** — guests use local storage; authenticated users fall back to local on Firestore failure |
| **Login / Sign Up** | Fails — Firebase Auth requires network; error shown in SnackBar |
| **Continue as Guest** | **Works** — fully local (SharedPreferences) |


## Key Packages

| Package               | Version |
| --------------------- | ------- |
| flutter_bloc          | ^9.1.1  |
| get_it                | ^7.6.0  |
| go_router             | ^14.0.0 |
| dio                   | ^5.4.0  |
| firebase_core         | ^3.13.0 |
| firebase_auth         | ^5.5.0  |
| cloud_firestore       | ^5.6.0  |
| firebase_crashlytics  | ^4.3.0  |
| isar_community        | ^3.3.2  |
| connectivity_plus     | ^6.0.0  |
| cached_network_image  | ^3.3.1  |
| youtube_player_iframe | ^5.1.3  |
| shimmer               | ^3.0.0  |
| showcaseview          | ^5.1.0  |
| flutter_dotenv        | ^5.1.0  |
| intl                  | ^0.20.2 |

## Services

- **TMDB** — All movie/TV show content and metadata
- **Firebase Auth** — Email/password authentication
- **Cloud Firestore** — User data sync (favorites, watch later, ratings)
- **Firebase Crashlytics** — Crash reporting
- **Firebase Analytics** — Usage analytics
- **Firebase Remote Config** — Feature flags
- **YouTube** — Trailer playback

## Troubleshooting

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner build
flutter run

# Regenerate localizations
flutter gen-l10n
```

## License

MIT License

---

Built with Flutter — May 2026
