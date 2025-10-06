# Hotel Management & Event Booking App Blueprint

## Overview

A Flutter application for browsing and booking hotels, restaurants, and banquet halls, and for viewing and advertising events. The app will have two main user roles:
1.  **Clients/Guests:** Can browse establishments, view details, see upcoming events, and book services.
2.  **Business Owners/Managers:** Can post and manage their listings (e.g., hotels, restaurants) and advertise events.

## Features & Design

### Core Features:
- User authentication (for both clients and business owners).
- Establishment listing (Hotels, Restaurants, Banquet Halls).
- Event listing and advertising.
- Search and filtering for establishments and events.
- Booking and reservation management.
- A visually appealing and intuitive user interface.

### UI/UX Design:
- **Theme:** A modern and clean theme with a consistent color scheme and typography.
- **Navigation:** A bottom navigation bar for easy access to the main screens (Home, Post Ad, Profile).
- **Layout:** Use of Cards with rounded corners and beautiful shadows to display listings.
- **Imagery:** High-quality placeholder images for establishments.

## Project Structure

```
.
├── lib
│   ├── models
│   │   └── establishment.dart
│   ├── screens
│   │   ├── home_screen.dart
│   │   ├── post_ad_screen.dart
│   │   └── profile_screen.dart
│   └── main.dart
├── pubspec.yaml
└── blueprint.md
```

## Plan

1.  **Set up Project:** Initialize a new Flutter project.
2.  **Add Dependencies:** Add `google_fonts` for custom typography.
3.  **Create Blueprint:** Document the project plan in `blueprint.md`.
4.  **Define Data Model:** Create the `Establishment` model in `lib/models/establishment.dart`.
5.  **Implement Theme:** Define a modern theme in `lib/main.dart` using `ThemeData` and `google_fonts`.
6.  **Set up Navigation:** Use a `BottomNavigationBar` in `main.dart` for the main screens.
7.  **Build Initial Screens:**
    *   `HomeScreen`: Display a list of establishments using `Card` widgets and a `TabBar` to filter between "All", "Hotels", "Restaurants", and "Banquets".
    *   `PostAdScreen`: A simple form for adding a new listing/event.
    *   `ProfileScreen`: Placeholder for user profile.
8.  **Refine UI:**
    *   Use `Card` widgets with `ClipRRect` for rounded corners.
    *   Add placeholder images for listings.
    *   Ensure a consistent and modern look and feel.
