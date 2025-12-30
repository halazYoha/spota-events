# Spota Events: Team Contribution Parts

This document outlines the 5 distinct modules for our team submission. Each member should focus on one part to minimize conflicts.

## 1. Auth & Initial Setup
**Focus**: Application entry point, Authentication flow, and Onboarding.
- **Files/Directories**:
    - `lib/main.dart`, `lib/app/app.dart`
    - `lib/features/auth/` (Login, Signup, Forgot Password screens)
    - `lib/app/providers/auth_provider.dart`
- **Tasks**:
    - Ensure Login/Signup screens match Figma.
    - Handle form validation and error states.
    - Manage the "Welcome" or "Onboarding" screens if any.

## 2. Event Discovery (Home)
**Focus**: The main attendee experience for finding events.
- **Files/Directories**:
    - `lib/features/events/` (Home Screen, Event Cards, Search, Filter)
    - `lib/features/home/` (if separate from events)
- **Tasks**:
    - Polish the Home Screen UI (Featured events, Categories).
    - Implement Search and Filter UI (even if mock data).
    - Ensure Event Cards look premium and display correct info.

## 3. Booking & Payments
**Focus**: The flow from clicking "Book" to "CONFIRMED".
- **Files/Directories**:
    - `lib/features/booking/`
    - `lib/features/events/screens/event_details_screen.dart` (The "Book Now" button source)
- **Tasks**:
    - Refine the Booking Process (Select Ticket -> Enter Details -> Payment).
    - specific Payment Method implementations (Telebirr, Chapa mock setup).
    - Ticket Confirmation Screen and PDF/QR view.

## 4. Organizer Portal
**Focus**: The dashboard for event creators.
- **Files/Directories**:
    - `lib/features/organizer/`
    - `lib/features/organizer/screens/organizer_dashboard.dart`
    - `lib/features/organizer/screens/create_event_screen.dart`
- **Tasks**:
    - Enhance the Organizer Dashboard stats and charts.
    - Polish the "Create Event" form wizard.
    - manage "My Events" list for organizers.

## 5. Profile & Core Foundation
**Focus**: User settings, common UI elements, and app-wide themes.
- **Files/Directories**:
    - `lib/features/profile/` (User Profile, Edit Profile, Settings)
    - `lib/core/` (Themes, Constants, Utils)
    - `lib/shared/` (Common Widgets like Buttons, Input Fields)
- **Tasks**:
    - Ensure `AppTheme` is consistent across the app.
    - Polish the User Profile screen (Attendee side).
    - Maintain shared widgets used by other teams.

---
**Submission Note**:
We will push our changes in rounds. Round 1: Everyone ensures their screens build and run. Round 2: Integration testing.
