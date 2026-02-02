# Excellis Travel

A flight booking app for Agents

## Project Requirement

The app is working with below configuration

`Flutter: 3.38.5`

`Dart: 3.10.4`

`Android SDK version: 36.1.0`

`Emulator version: 36.3.10.0`

`Java version: 21.0.8`


## Run Locally

Clone the project

```bash
  git clone https://github.com/jayantaex/reiselab.git
```

Figma Link
```bash
https://www.figma.com/design/oyAEkXbrNADglxNUMkVvEH/Excellis-Travel-Flight-Booking-App?node-id=783-25&t=eIS6ff1allAXEryL-0
```

Go to the project directory

```bash
  cd reiselab
```

Install dependencies

```bash
  flutter pub get
```

Start the app

```bash
  flutter run --debug
```


## Release

Generate SHA Key [DEBUG]

```bash
  keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Generate Keystore file from project root directory

```bash
  keytool -genkeypair \
  -v \
  -keystore android/app/release.jks \
  -alias upload \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000
```



Setup key-properties
 
 create a key.properties file under /android with the below variables

```bash
storeFile=release.jks
storePassword=YOUR_STORE_PASSWORD
keyAlias=YOUR_RELEASE_ALIAS
keyPassword=YOUR_KEY_PASSWORD
```


Generate SHA Key [RELEASE]

```bash
  keytool -list -v -keystore android/app/release.jks -alias YOUR_RELEASE_ALIAS
```


## Firebase setup

Setup firebase for push notification. After successfully setup firebase make the variable inside the `main.dart` file `true` 

Release Apk

```bash
  flutter build apk --release
```

OR

| Flag  | Result              |
| ----- | --------------------|
| patch | 1.2.3+45 → 1.2.4+46 |
| minor | 1.2.3+45 → 1.3.0+46 |
| major | 1.2.3+45 → 2.0.0+46 |

```bash
  ./build_flutter.sh patch
```

```bash
  ./build_flutter.sh minor
```

```bash
  ./build_flutter.sh major
```



## APP DOCUMENTATION: EXCELLIS TRAVEL


# Excellis Travel Documentation

## 1. Project Overview
Excellis Travel is a comprehensive **Flight Booking platform** specifically designed for Agents. It integrates with the **Amadeus API** for flight searches and a custom backend for:
* Wallet management
* User authentication
* Sales tracking

---

## 2. Technical Stack

| Category | Technology |
| :--- | :--- |
| **Framework** | Flutter 3.5.4 (SDK ^3.5.4) |
| **State Management** | BLoC (`flutter_bloc` & `equatable`) |
| **Routing** | `go_router` |
| **HTTP Client** | Dio (with custom interceptors & `pretty_dio_logger`) |
| **Local Storage** | **Hive:** Structured data (Airports, Aircrafts) <br> **Shared Preferences:** Simple key-value pairs |
| **Dependency Injection** | Manual Injection via Static Module Classes |
| **Localization** | `easy_localization` |
| **Payment Gateway** | Razorpay |
| **Analytics** | Firebase Core & Messaging |

---

## 3. Architecture (Clean Feature-First BLoC)
The project follows a modular, feature-first approach. Each feature in `lib/features/` is self-contained and follows these layers:

* **Module Class:** (e.g., `auth_module.dart`)
    * Orchestrates Dependency Injection (DI).
    * Defines route names, paths, and widget builders.
    * Injects Repositories into BLoCs and BLoCs into Screens.
* **Presentation:**
    * `screens/`: High-level page widgets.
    * `widgets/`: Feature-specific reusable components.
* **BLoC:**
    * `bloc/`: Contains Events, States, and Business Logic.
* **Data:**
    * `repository/`: Single point of truth for the BLoC; decides between remote and local data.
    * `data_source/`: Implementation of API calls (Remote) or DB queries (Local).
    * `models/`: DTOs (Data Transfer Objects) with JSON serialization.

---

## 4. Core Directory Structure
* **`lib/core/`**:
    * `network/`: Contains `ApiClient` (Backend), `AmadeusClient` (OAuth2 logic), and API wrappers.
    * `services/`: Global services like `LocalDB` (Hive) and `FirebaseNotificationService`.
    * `theme/`: Global AppTheme with Light/Dark mode support.
    * `common/`: Shared BLoCs (Location/Cities) and generic models.
    * `widgets/`: App-wide reusable UI components.
* **`lib/features/`**: Individual app modules (Auth, Flight Booking, Wallet, etc.).
* **`lib/utils/`**: Generic helper classes, formatters, and `StorageService`.

---

## 5. Key Functional Modules

### A. Flight Search & Booking
* **Airport Search:** Leverages Hive (`LocalDB`) for high-speed offline searching.
* **Pricing Logic:** Amadeus prices are dynamically adjusted with Agent Markups.
* **Passenger Management:** Saved passengers stored locally for quick selection.

### B. Markup System
* Agents can set Global Markups (Percentage or Flat).
* Markup visibility can be toggled on/off during the booking flow.
* Final prices on tickets and invoices include these markups automatically.

### C. Dual-Wallet System
1.  **Standard Wallet:** User-funded via Razorpay for direct bookings.
2.  **Credit Wallet:** Credit line provided by Admin/Parent agent for flexible booking.
3.  **Repayment Dashboard:** Tracking and clearing credit debts.

### D. Reporting & Downloads
* **Sales Dashboard:** Real-time sales volume and commission tracking.
* **Flutter Downloader:** Handles PDF ticket and invoice generation.

---

## 6. Development Workflow

### Adding a New Feature
1.  Create a new directory in `lib/features/`.
2.  Implement **Data Source** -> **Repository** -> **BLoC** -> **Presentation** layers.
3.  Create a `[Feature]Module` class to define routes and DI.
4.  Register the routes in `lib/app_router.dart`.

### Code Generation
This project uses `build_runner`. Run the following command after modifying models or Hive adapters:
```bash
dart run build_runner build --delete-conflicting-outputs