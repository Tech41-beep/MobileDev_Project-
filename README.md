# MobileDev_Project-
# SplitMate 💸

**SplitMate** is a simple expense-sharing mobile application built with Flutter. It helps users manage shared expenses, track contributions, and calculate balances between friends during trips or group activities.

The application focuses on a simple user experience, offline functionality, and easy expense management.

## ✨ Features

- **Expense Management** – Add, edit, and manage shared expenses.
- **Participant Management** – Manage people participating in shared expenses.
- **Balance Calculation** – Calculate how much each participant owes or should receive.
- **Offline Storage** – Store application data locally using SQLite.
- **Multiple Currencies** – Support for KHR and USD.
- **Dark Mode** – A consistent dark-themed user interface.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Mobile application framework |
| Dart | Programming language |
| SQLite | Local database |
| Material Design | User interface components |

## 📁 Project Structure

```text
Mobile_Project/
├── lib/
│   ├── main.dart
│   ├── model/
│   │   ├── trip.dart
│   │   ├── participant.dart
│   │   ├── expense.dart
│   │   └── balance.dart
│   └── service/
│       ├── expense_service.dart
│       ├── balance_service.dart
│       └── storage_service.dart
│
├── test/
│   ├── model/
│   └── service/
│
├── README.md
└── pubspec.yaml
```

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

- Flutter SDK
- Dart SDK
- Visual Studio Code or Android Studio
- Android Emulator or a physical device

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Tech41-beep/MobileDev_Project-.git
   ```

2. Navigate to the project directory:

   ```bash
   cd MobileDev_Project-
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## 🧪 Testing

Run the following command to execute project tests:

```bash
flutter test
```

## 🎓 Project Information

- **Project Name:** SplitMate
- **Platform:** Mobile Application
- **Framework:** Flutter
- **Storage:** SQLite
- **Currency:** KHR and USD
- **Development Status:** In Progress

## 👨‍💻 Developer

**Tech41-beep**

GitHub: [@Tech41-beep](https://github.com/Tech41-beep)

---

*Built with Flutter and Dart ❤️*
