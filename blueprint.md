# Plan My Trip Blueprint

## Overview

A Flutter application for browsing and booking hotels, restaurants, and banquet halls, and for viewing and advertising events. The app will have two main user roles:
1.  **Clients/Guests:** Can browse establishments, view details, see upcoming events, and book services.
2.  **Business Owners/Managers:** Can post and manage their listings (e.g., hotels, restaurants) and advertise events.

## Features & Design

### Core Features:
- User authentication (for both clients and business owners).
- Establishment listing (Hotels, Restaurants, Banquet Halls).
- **Clickable establishment listings** navigating to a detail page.
- **Establishment Detail Page:**
    - Image gallery (interiors, extra images).
    - Detailed rental information (per day, per person).
    - Availability calendar showing future available dates (booked dates are disabled).
- Event listing and advertising.
- Search and filtering for establishments and events.
- Booking and reservation management.
- A visually appealing and intuitive user interface.
- **Enhanced Profile Screen:** Displays user's name, phone number, and a list of their previous bookings.
- **Rebranded App:** The app is now named "Plan My Trip" and features a relevant logo.

### UI/UX Design:
- **Theme:** A modern and clean theme with a consistent color scheme and typography.
- **Navigation:** A bottom navigation bar for easy access to the main screens (Home, Post Ad, Profile), and navigation to detail pages.
- **Layout:** Use of Cards with rounded corners and beautiful shadows to display listings.
- **Imagery:** High-quality placeholder images for establishments.

## Project Structure

```
.
├── lib
│   ├── models
│   │   ├── booking.dart
│   │   ├── establishment.dart
│   │   └── user.dart
│   ├── screens
│   │   ├── establishment_detail_screen.dart
│   │   ├── home_screen.dart
│   │   ├── post_ad_screen.dart
│   │   └── profile_screen.dart
│   └── main.dart
├── pubspec.yaml
└── blueprint.md
```

## Current Plan: Rebrand Application

1.  **Update `main.dart`:** Changed the application title to "Plan My Trip".
2.  **Update `home_screen.dart`:**
    *   Changed the app bar title to "Plan My Trip".
    *   Added a hotel icon (`Icons.hotel`) to the app bar to serve as a logo.
3.  **Update `blueprint.md`:** Reflect the rebranding changes in the blueprint.

---

## Completed Plan

1.  **Implement Establishment Detail Page:**
    *   **Update Blueprint:** Reflected the new detail page feature in `blueprint.md`.
    *   **Add Dependencies:** Added `table_calendar` for the date selection feature.
    *   **Update Data Model:** Enhanced `lib/models/establishment.dart` to include more images, rent details, and a list of booked dates.
    *   **Create Detail Screen:** Built `lib/screens/establishment_detail_screen.dart` to display the establishment's details, image gallery, and the availability calendar.
    *   **Enable Navigation:** Modified `lib/screens/home_screen.dart` to make establishment cards tappable and navigate to the new detail screen, passing the selected establishment data.
    *   **Refine UI:** Ensured the detail screen is well-designed and consistent with the app's theme.
2.  **Set up Project:** Initialized a new Flutter project.
3.  **Add Dependencies:** Added `google_fonts` for custom typography.
4.  **Create Blueprint:** Documented the project plan in `blueprint.md`.
5.  **Define Data Model:** Created the `Establishment` model in `lib/models/establishment.dart`.
6.  **Implement Theme:** Defined a modern theme in `lib/main.dart` using `ThemeData` and `google_fonts`.
7.  **Set up Navigation:** Used a `BottomNavigationBar` in `main.dart` for the main screens.
8.  **Build Initial Screens:**
    *   `HomeScreen`: Displayed a list of establishments using `Card` widgets and a `TabBar` to filter between "All", "Hotels", "Restaurants", and "Banquets".
    *   `PostAdScreen`: A simple form for adding a new listing/event.
    *   `ProfileScreen`: Placeholder for user profile.
9.  **Refine UI:**
    *   Used `Card` widgets with `ClipRRect` for rounded corners.
    *   Added placeholder images for listings.
    *   Ensured a consistent and modern look and feel.
10. **Enhance Profile Screen:**
    *   Created `User` and `Booking` models.
    *   Updated the profile screen to show user info and mock booking history.
