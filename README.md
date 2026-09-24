# Flutter Lab Programs – Shamala Madhuri Mam

A beginner-friendly collection of Flutter lab programs, corrected practice files, assignment programs and study notes.

## Repository structure

### Original lab practice programs – cleaned and commented

| File | Topic |
|---|---|
| `widgetsRowStateless` | Row and Stack widgets using StatelessWidget |
| `statefullWidget` | Basic StatefulWidget counter |
| `statefullwidgetWith++,--,andReset` | Increment, Decrement, Reset and Click Me buttons in a Row |
| `enable and disble switch` | Enable / Disable Switch using StatefulWidget |
| `desktop and mobile view` | Responsive UI using MediaQuery and wallpaper |
| `Home,....buttons` | Home, Menu, Contact Us and Help buttons in the AppBar |
| `food items list and cart` | Food list, reusable card and Add to Cart SnackBar |
| `student info` | Student information input and reusable student card |
| `studentPortal` | Student profile card with image, phone and email |

The older files have been kept at their original paths so the lab history is not lost. Their code has been cleaned with consistent indentation, simpler structure and explanatory comments.

### Assignment / extended lab programs

- `01_named_routes_navigation.dart` – Named Routes with three screens.
- `02_animations_fade_slide_scale_rotation.dart` – Fade, Slide, Scale and Rotation animations.
- `03_student_registration_form.dart` – Student registration form with validation.
- `04_product_rest_api.dart` – REST API product list with loading and error handling.
- `05_smart_water_intake_tracker.dart` – Water intake tracker with validation, reset confirmation, entry count, remaining water, completion percentage and local storage.

## Study guide

- `docs/flutter_lab_experiment_1_notes.md` – Notes prepared from the supplied **Flutter exp1.pdf**.

The Experiment 1 notes preserve the source document's main topics: Flutter introduction, Dart, benefits of Flutter, lab learning outcomes, tools, Flutter SDK installation, `flutter doctor`, PATH setup, Android Studio, Android SDK tools, Android licenses, project creation, `lib/main.dart`, and VS Code Flutter setup.

## Flutter basics – quick revision

### Flutter
Flutter is an open-source UI toolkit developed by Google for building applications from a single Dart codebase.

### Dart
Dart is the programming language used by Flutter.

### Widget
A widget is a building block of a Flutter user interface. Examples include `Text`, `Icon`, `Row`, `Column`, `Container` and `Scaffold`.

### StatelessWidget
Use `StatelessWidget` when the widget does not need to change its own data while the app is running.

### StatefulWidget
Use `StatefulWidget` when the UI depends on data that can change while the app is running.

### setState()
`setState()` tells Flutter that state has changed and the affected widget should be rebuilt.

```dart
setState(() {
  count++;
});
```

## Common widgets

- `MaterialApp` – root Material application.
- `Scaffold` – basic screen structure.
- `AppBar` – top application bar.
- `Text` – displays text.
- `Icon` – displays an icon.
- `Row` – arranges children horizontally.
- `Column` – arranges children vertically.
- `Stack` – places widgets on top of one another.
- `Container` – controls size, spacing and decoration.
- `ListView` – creates a scrollable list.
- `TextField` – accepts text input.
- `ElevatedButton` – clickable button.
- `Switch` – ON/OFF control.

## Responsive UI

`MediaQuery.of(context).size.width` can be used to read the current screen width.

```dart
final width = MediaQuery.of(context).size.width;

if (width < 600) {
  // Mobile layout
} else {
  // Desktop / larger-screen layout
}
```

## Named Routes

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/second': (context) => SecondScreen(),
    '/third': (context) => ThirdScreen(),
  },
)
```

Navigation examples:

```dart
Navigator.pushNamed(context, '/second');
Navigator.pop(context);
Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
```

## Forms and validation

The Student Registration Portal demonstrates `Form`, `GlobalKey<FormState>`, `TextFormField`, validators and a submit button.

Required validation rules:

- Mandatory fields cannot be empty.
- Email must have a valid format.
- Phone number must contain exactly 10 digits.
- Terms and Conditions must be accepted.

## Animations

The animation assignment demonstrates four effects:

- Fade
- Slide
- Scale
- Rotation

Useful Flutter widgets include `FadeTransition`, `SlideTransition`, `ScaleTransition` and `RotationTransition`.

## REST API

Typical API flow:

1. Show a loading indicator.
2. Send a GET request.
3. Decode the JSON response.
4. Convert the data into Dart objects/maps.
5. Display the products in a scrollable list.
6. Show an error message when the request fails.

The product assignment displays image, title, price and category.

## Smart Water Intake Tracker

Required features:

- Record daily water intake.
- Confirm before reset.
- Reject zero and negative values.
- Count today's entries.
- Show remaining water.
- Show completion percentage.
- Save data locally with `shared_preferences` in a normal Flutter project.

Example for a 2000 mL goal:

```text
500 + 250 + 750 = 1500 mL consumed
Remaining = 500 mL
Entries = 3
Completion = 75%
```

## Dependencies for the extended programs

The repository contains standalone Dart source files rather than one complete Flutter application project. When running the programs in a normal Flutter project, add the required packages to `pubspec.yaml` for the programs that use them, especially `http` and `shared_preferences`.

## Running in DartPad / FlutLab

For simple programs that use only Flutter Material widgets, paste the file into a Flutter project or compatible online Flutter editor.

For programs that require external packages, make sure the package is available in the project's dependency configuration before running.

## Submission checklist

1. Check indentation.
2. Read the comments and understand the main widgets.
3. Run each program.
4. Test every button, switch and input field.
5. Fix analyzer errors before submission.
6. Capture the actual output screenshot from the running program.
7. Keep the experiment question and program together when submitting.
