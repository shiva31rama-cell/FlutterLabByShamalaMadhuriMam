# Flutter Lab Programs - Shamala Madhuri Mam

Beginner-friendly Flutter lab programs and notes.

## Existing programs

- `studentPortal` - Student Profile Card using basic widgets.
- `widgetsRowStateless` - Row and Stack widgets.
- `statefullWidget` - StatefulWidget counter with Click Me.
- `statefullwidgetWith++,--,andReset` - Increment, Decrement, Reset and Click Me.
- `enable and disble switch` - Stateful Switch example.
- `desktop and mobile view` - Responsive UI using MediaQuery and wallpaper.
- `Home,....buttons` - AppBar menu buttons with StatefulWidget and setState().
- `food items list and cart` - Scrollable food list and Add to Cart SnackBar.
- `student info` - Student information form and reusable card.

## Flutter basics

**Flutter:** Google's UI toolkit for building user interfaces from a single Dart codebase.

**Dart:** The programming language used by Flutter.

**Widget:** A building block of the Flutter UI. Examples: Text, Icon, Row, Column, Container and Scaffold.

**StatelessWidget:** Used when the widget does not need changing state.

**StatefulWidget:** Used when data can change while the app is running.

Example:
```dart
int count = 0;
setState(() {
  count++;
});
```
`setState()` tells Flutter to rebuild the UI using the new value.

## Common widgets

- `MaterialApp` - root Material application.
- `Scaffold` - basic screen structure.
- `AppBar` - top application bar.
- `Text` - displays text.
- `Icon` - displays an icon.
- `Row` - places children horizontally.
- `Column` - places children vertically.
- `Stack` - places widgets on top of one another.
- `Container` - controls size, padding, margin and decoration.
- `ListView` - creates a scrollable list.
- `TextField` - accepts text.
- `ElevatedButton` - clickable button.
- `Switch` - ON/OFF control.

## Responsive UI

`MediaQuery.of(context).size.width` gives the screen width.

```dart
double width = MediaQuery.of(context).size.width;

if (width < 600) {
  // Mobile layout
} else {
  // Larger-screen layout
}
```

## Named Routes

Use `initialRoute` and `routes` in `MaterialApp`:

```dart
MaterialApp(
  initialRoute: "/",
  routes: {
    "/": (context) => HomeScreen(),
    "/second": (context) => SecondScreen(),
    "/third": (context) => ThirdScreen(),
  },
)
```

Navigate with `Navigator.pushNamed(context, "/second")`.
Go back with `Navigator.pop(context)`.
Clear the navigation stack and return home with `Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false)`.

## Forms and validation

Use `Form`, `GlobalKey<FormState>`, `TextFormField`, validators and a submit button.

Student Registration Portal rules:
- Required fields cannot be empty.
- Email must be valid.
- Phone must contain exactly 10 digits.
- Terms and Conditions must be accepted.

## Animations

The animation task demonstrates Fade, Slide, Scale and Rotation. Useful Flutter transition widgets include `FadeTransition`, `SlideTransition`, `ScaleTransition` and `RotationTransition`.

## REST API

Typical flow: show loading -> send GET request -> decode JSON -> convert data -> display a scrollable list -> show an error when the request fails.

The product task displays product image, title, price and category.

## Smart Water Intake Tracker

Required features:
- Record daily water intake.
- Confirm before reset.
- Reject zero and negative values.
- Count today's entries.
- Show remaining amount to reach the daily goal.
- Show completion percentage.

Example for a 2000 mL goal with 500 + 250 + 750 mL:

`Total = 1500 mL`, `Remaining = 500 mL`, `Entries = 3`, `Completion = 75%`.

Local persistence can be implemented with `shared_preferences` in a normal Flutter project.

## Output screenshots

Screenshots should be captured from the actual running programs and committed as image files. This README does not claim screenshots that are not actually stored in the repository.

## Submission checklist

1. Check indentation.
2. Run the program and fix errors.
3. Test every button and control.
4. Keep useful comments.
5. Capture the actual output screenshot.
