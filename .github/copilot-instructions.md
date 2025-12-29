# SPOTA Event Discovery App - AI Coding Guidelines

## Project Overview
SPOTA is a Flutter-based mobile app for discovering events in Bahir Dar, Ethiopia. It features Firebase backend, Ethiopian payment integration (Chapa), SMS confirmations (AfroMessage), and multi-role user system (attendees, organizers, administrators).

## Architecture
- **State Management**: Riverpod for reactive state management
- **Backend**: Firebase (Authentication, Firestore, Cloud Functions)
- **Payments**: Chapa API for Ethiopian payment processing
- **SMS**: AfroMessage API for ticket confirmations
- **Location**: Location-based event discovery

## Code Structure
```
lib/
├── app/           # App config, routing, providers
├── core/          # Themes, constants, utilities
├── features/      # Feature modules (auth, events, booking, profile, admin)
└── shared/        # Reusable widgets, services, models
```

## Key Patterns
- **Themes**: Use `AppTheme.lightTheme`/`darkTheme` from `core/themes/app_theme.dart`
- **Colors**: Primary blue `#2563EB`, secondary green `#10B981`
- **Fonts**: Poppins via Google Fonts
- **Assets**: Store in `assets/images/`, `assets/icons/`, `assets/fonts/`
- **Models**: Place in `shared/models/` with Firestore-compatible structures
- **Services**: Firebase services in `shared/services/`
- **Widgets**: Reusable components in `shared/widgets/`

## Development Workflow
- **Setup**: `flutter pub get` after cloning
- **Run**: `flutter run` (ensure Firebase config)
- **Test**: `flutter test`
- **Lint**: `flutter analyze` (uses flutter_lints)
- **Build**: `flutter build apk` for Android

## Firebase Integration
- Use Firebase Auth for multi-role authentication
- Firestore for events, bookings, user profiles
- Structure collections: `events`, `bookings`, `users`, `organizers`

## Payment & SMS
- Chapa API for secure Ethiopian payments
- AfroMessage for instant SMS ticket delivery
- Handle payment callbacks and booking confirmations

## Location Features
- Request location permissions for nearby events
- Use geolocation for event filtering and discovery

## Multi-Role System
- **Attendees**: Browse, book events
- **Organizers**: Create, manage events
- **Admins**: System oversight, user management

Reference: [README.md](README.md) for full feature specs</content>
<parameter name="filePath">c:\Users\hp\spota\spota-events\.github\copilot-instructions.md