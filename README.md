# Headless LMS Flutter

Headless LMS Flutter is a starter project for building a Flutter-based client
on top of the LearnPress REST API. It focuses on providing a clean structure for
interacting with courses exposed from a WordPress backend running the
[LearnPress](https://wordpress.org/plugins/learnpress/) plugin.

## Requirements

- Flutter SDK 3.3 or newer.
- A WordPress site with the LearnPress plugin enabled and the REST API
  accessible.

## Getting started

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Run the application while providing the LearnPress endpoint information as
   Dart defines:

   ```bash
   flutter run \
     --dart-define=LEARNPRESS_BASE_URL=https://your-wordpress-site.com \
     --dart-define=LEARNPRESS_API_PATH=/wp-json/learnpress/v1/
   ```

   - `LEARNPRESS_BASE_URL` should point to the root domain of your WordPress
     installation (no trailing slash is required).
   - `LEARNPRESS_API_PATH` is optional and defaults to `/wp-json/learnpress/v1/`.

The home screen fetches and lists courses from the REST API. Tapping a course
currently shows a simple notification and can be expanded later to navigate to a
course detail page or trigger custom logic.

## Project structure

```
lib/
├── app.dart                    # MaterialApp configuration and dependency wiring
├── core/
│   ├── config/                 # Environment helpers
│   ├── constants/              # REST endpoint constants
│   ├── exceptions/             # Custom exception classes
│   └── services/               # LearnPress API service wrapper
├── data/
│   ├── models/                 # Data models (Course)
│   └── repositories/           # Abstractions that coordinate API access
├── presentation/
│   ├── screens/                # UI screens (HomeScreen)
│   └── widgets/                # Reusable presentation widgets
└── utils/                      # Shared utilities (HTTP client factory)
```

The current implementation focuses on course listings but can be extended with
additional repositories and screens for lessons, quizzes, and user progress.

## Next steps

- Add persistence and caching for offline usage.
- Implement authentication using WordPress application passwords or JWT.
- Expand presentation layer with routing and state management (e.g. Riverpod,
  Bloc).
- Cover the API service and repositories with unit tests.
