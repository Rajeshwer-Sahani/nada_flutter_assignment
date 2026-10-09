# Nada Flutter Assignment

A Flutter application for browsing marriage profiles and viewing their connection details.

The app loads the supplied profile data from the provided HTTPS endpoint, displays the profiles in a searchable list, and allows the user to open an individual profile for more details.

## Features

- Load 24 profiles from the supplied HTTPS JSON endpoint
- Search profiles by name or city
- Case-insensitive search
- Profile details screen
- Display connection information
- Handle missing and null profile fields safely
- Loading state
- Empty search state
- Error state with retry
- Support for long text and names
- Support for Hindi text
- Widget tests for profile search and empty search results

## Tech Stack

- Flutter
- Dart
- Material 3
- `http` package
- `dart:convert` for JSON decoding
- `setState` for screen state management

## Project Structure

```text
lib/
├── main.dart
├── models/
│   └── profile.dart
├── services/
│   └── profile_service.dart
├── screens/
│   ├── profiles_screen.dart
│   └── profile_details_screen.dart
└── widgets/
    ├── profile_card.dart
    ├── profile_search_bar.dart
    ├── profile_loading.dart
    ├── profile_empty_state.dart
    └── profile_error_state.dart
```

## Getting Started

### Requirements

- Flutter SDK
- Dart SDK
- Android emulator or iOS simulator/device

### Installation

Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/Rajeshwer-Sahani/nada_flutter_assignment
cd nada_flutter_assignment
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Testing

Run static analysis:

```bash
flutter analyze
```

Run the widget tests:

```bash
flutter test
```

The widget tests use a fake `ProfileService`, so they do not depend on the external profile API.

The current tests cover:

1. Searching by city filters the profile list.
2. Searching for a profile that does not exist shows `No profiles match`.

## Error, Loading and Empty States

The application handles the main states of the profile request and search flow:

- **Loading** — Displays a loading indicator while profiles are being fetched.
- **Error** — Displays an error message with a Retry button when the request fails.
- **Empty** — Displays `No profiles match` when a search returns no profiles.
- **Success** — Displays the available profiles in a scrollable list.

## Handling Missing Data

The supplied profile data contains optional and null fields.

The application safely handles:

- Missing `education`
- Null `degree`
- Null `connected_through`
- Null `about`

When a connection is unavailable, the details screen displays:

`No connection yet`

Optional fields are omitted when they are not present.

## Architecture Approach

The application uses a simple screen-based architecture with `setState`.

The profile service is kept separate from the UI, while the screens are responsible for managing their local state and user interactions.

`ProfileService` is injected into `ProfilesScreen`, which also makes it possible to provide a fake service during widget testing.

The architecture is intentionally kept simple because this is a small assignment and does not require additional layers such as repositories or use cases.

## What I Would Improve With More Time

With more time, I would consider:

- Adding more widget tests for loading, error, and retry states.
- Adding integration tests for the complete profile browsing flow.
- Improving API error handling for different network failure scenarios.
- Adding accessibility improvements such as semantic labels and larger text support.
- Further refining the visual design based on product requirements and user feedback.

## AI Tools Used

ChatGPT was used during development for Flutter implementation guidance, debugging, widget test setup, code review, and UI refinement.

The implementation was reviewed and tested locally using `flutter analyze`, `flutter test`, and the Flutter simulator.
