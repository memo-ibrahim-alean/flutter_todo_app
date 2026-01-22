# Todo App

A Flutter application for managing daily tasks with persistent local storage using Hive.

## Features

- ✅ Add tasks with validation
- ✅ Mark tasks as complete/incomplete
- ✅ Delete tasks
- ✅ Real-time task counter (total & completed)
- ✅ Persistent storage using Hive (data survives app restart)
- ✅ Clean, modular code structure
- ✅ Input validation with error messages

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Local Storage:** Hive
- **State Management:** setState

## Project Structure

```
lib/
├── models/
│   └── task.dart           # Task data model
├── screens/
│   └── home_screen.dart    # Main screen
├── widgets/
│   ├── task_input.dart     # Input form widget
│   └── task_list.dart      # Task list widget
└── main.dart               # App entry point
```

## How to Use

1. **Add Task:** Enter task name and tap "Add Task"
2. **Mark Complete:** Tap checkbox to mark task as done
3. **Delete Task:** Tap delete icon to remove task
4. **Data Persistence:** All tasks automatically saved to device

## Installation

```bash
flutter pub get
flutter run
```

## Learning Outcomes

This project demonstrates:

- State management with setState
- Local data persistence with Hive
- Widget composition and code organization
- Callbacks and lifting state up
- Input validation and error handling

