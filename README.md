
# Ecommerce Insights Flutter App

This project is a Flutter-based application designed to provide insights into ecommerce orders, including data visualization and metrics management. It supports responsive layouts for mobile, tablet, and web platforms.

---

## Table of Contents
- [Prerequisites](#prerequisites)
- [Cloning the Repository](#cloning-the-repository)
- [Running the Application](#running-the-application)
- [Design Decisions and Approaches](#design-decisions-and-approaches)
- [Contributing](#contributing)
- [Contact](#contact)

---

## Prerequisites

Before you clone and run this application, ensure you have the following installed:

1. [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0 or higher recommended)
2. [Dart SDK](https://dart.dev/get-dart)
3. An IDE such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
4. A device or emulator for testing (Android, iOS, or web)

---

## Cloning the Repository

Follow these steps to clone the repository:

1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the repository.
3. Run the following command:

   ```bash
   git clone https://github.com/moghoneim-code/flutter_ecommerce_insights.git
   ```

4. Navigate into the project directory:

   ```bash
   cd ecommerce-insights
   ``` 

5. Install dependencies:

   ```bash
   flutter pub get
   ```

---

## Running the Application

To run the application, follow these steps:

1. Ensure you have a connected device, emulator, or web browser for testing.
2. Use the following command to start the application:

   ```bash
   flutter run
   ```

### For running on specific platforms:

- **Android Emulator:** Start an emulator in Android Studio and use `flutter run`.
- **iOS Simulator:** Start the iOS simulator and use `flutter run` (requires a macOS environment).
- **Web:** Ensure a web browser is installed and use:

   ```bash
   flutter run -d chrome
   ```

---

## Design Decisions and Approaches

### Responsive Design

The application is designed to work seamlessly across mobile, tablet, and web platforms. Here's an explanation of the approach:

#### Dynamic Layouts Using `MediaQuery`

`MediaQuery` is used to detect the screen width and adapt the layout dynamically.

**Example:**

```dart
final screenWidth = MediaQuery.of(context).size.width;
if (screenWidth > 600) {
  // Web/Desktop layout / tablet
}  else {
  // Mobile layout
}
```

- ** You Will find the Order.dart model in the shared folder , as it is used in the different screens.
- ** Please Note :  the feature [graph] doesn't have a data layer as there is no data to be fetched from the server, because i passed the data as a list of objects in the screen itself.

This ensures the app looks good on various devices without the need for separate codebases.

#### Custom Widgets for Responsivity

Widgets like `ResponsiveCard` abstract the layout logic for wide and narrow screens.

**Example:**

```dart
Widget build(BuildContext context) {
  final isWideScreen = MediaQuery.of(context).size.width > 600;
  return isWideScreen ? buildWideLayout(context) : buildNarrowLayout(context);
}
```

This approach allows flexibility while keeping the code clean and modular.

#### Scalable UI with Flexible Widgets

Widgets like `ListView.builder` and `Expanded` are used to handle dynamic content and prevent overflow issues.

---

### Why This Approach?

- **Maintainability:** Abstracting responsive logic into widgets like `ResponsiveCard` ensures the code is modular and easy to update.
- **Reusability:** Common responsive components can be reused across the application, reducing duplication.
- **Future-proofing:** By detecting screen sizes dynamically, the app can easily adapt to new devices or form factors.

---

### Using `Provider` for State Management

The `Provider` package is used for managing application state because:

- It is simple yet powerful for managing state at various levels of the widget tree.
- It keeps the UI reactive by notifying listeners whenever state changes.
- It integrates seamlessly with Flutter’s widget lifecycle.

---


## Contributing

Contributions are welcome! Please feel free to fork the repository, submit issues, or create pull requests.

For major changes, please open an issue first to discuss what you would like to change.

---

## Contact

For questions or support, please contact:

- **Email:** mghoneam7@gmail.com
- **GitHub:** [moghoneim-code](https://github.com/moghoneim-code)
