# Flutter Lab Repository Audit

Audit date: 2026-09-24

## Purpose

This document records a double-check of the repository after cleaning the Flutter lab programs. The goal is to make sure existing programs were not silently skipped or deleted and that the current files retain the original lab functionality.

## Repository inventory

The repository currently contains **17 tracked paths**: 15 program/source files plus `README.md` and the Experiment 1 study notes.

### Original lab practice files preserved

1. `widgetsRowStateless`
   - Row Widget example
   - Stack Widget example
   - StatelessWidget structure

2. `statefullWidget`
   - StatefulWidget
   - Counter variable
   - Click Me button
   - `setState()`

3. `statefullwidgetWith++,--,andReset`
   - Increment
   - Decrement
   - Reset
   - Click Me
   - All four buttons remain in a Row

4. `enable and disble switch`
   - StatefulWidget
   - Enable / Disable text
   - Switch control
   - `setState()`

5. `desktop and mobile view`
   - Wallpaper using `NetworkImage`
   - `MediaQuery` screen-width check
   - Mobile layout
   - Desktop layout
   - Desktop menu buttons remain in a Row

6. `Home,....buttons`
   - Home
   - Menu
   - Contact Us
   - Help
   - Buttons remain in the AppBar's top-right `actions`
   - Center message changes using `setState()`

7. `food items list and cart`
   - Pizza
   - Burger
   - Biryani
   - Healthy Salad
   - Idli
   - Fruit Bowl
   - Veg Sandwich
   - Reusable `FoodCard`
   - Add to Cart SnackBar

8. `student info`
   - Name input
   - Branch input
   - CGPA input
   - Add Student button
   - Reusable `StudentCard`

9. `studentPortal`
   - Student profile image
   - Student name
   - Roll number
   - Branch
   - Phone
   - Email
   - Reusable information card

### Extended / assignment programs

10. `01_named_routes_navigation.dart`
    - `initialRoute`
    - `routes`
    - Home Screen
    - Second Screen
    - Third Screen
    - Go Back
    - Go to Home with navigation-stack clearing

11. `02_animations_fade_slide_scale_rotation.dart`
    - AnimationController
    - Fade
    - Slide
    - Scale
    - Rotation
    - `initState()` and `dispose()`

12. `03_student_registration_form.dart`
    - Student Name
    - Email
    - Phone Number
    - Department
    - Gender
    - Terms & Conditions
    - Required-field validation
    - Email validation
    - 10-digit phone validation
    - Successful submission message

13. `04_product_rest_api.dart`
    - HTTP GET request
    - JSON decoding
    - Product image
    - Product title
    - Price
    - Category
    - Loading indicator
    - Error handling
    - Scrollable product list

14. `05_smart_water_intake_tracker.dart`
    - 2000 mL daily goal
    - Positive-value validation
    - Entry count
    - Remaining water
    - Completion percentage
    - Reset confirmation
    - Local storage
    - Daily date-based storage keys

### Documentation files

15. `README.md`
16. `docs/flutter_lab_experiment_1_notes.md`
17. `docs/repository_audit.md` (this file)

## Double-check against the previous repository tree

The repository tree before the cleaning/refactor pass contained the same 15 original program/source paths listed above. The later work added documentation and did not remove those program paths.

The Git history also shows individual commits for the old programs and later refactor commits. Therefore, the cleanup was performed as updates to existing files rather than deleting the original program paths.

## What was changed

The old source programs were cleaned mainly by:

- consistent indentation
- `const` constructors and widgets where appropriate
- clearer comments
- clearer state variable names in some programs
- reusable widgets for repeated UI
- safer scrolling for the student profile screen
- image fallback in the student profile screen
- preservation of the requested button behavior

These changes are formatting/clarity improvements or direct implementations of the lab requirements; the original program topics were not removed.

## Important correction made during this audit

The Smart Water Intake Tracker originally saved `total` and `entries` using generic storage keys. That could make an older day's values appear as today's values. The current version uses date-based keys such as:

```text
water_total_YYYY-MM-DD
water_entries_YYYY-MM-DD
```

This matches the requirement that the application tracks **today's** water intake.

## Dependencies

The simple widget programs use only Flutter Material widgets.

The extended programs that use external packages require the corresponding dependencies in a normal Flutter project's `pubspec.yaml`:

- `http` for the REST API program
- `shared_preferences` for the Smart Water Intake Tracker

## Output screenshots

No actual program output screenshots are claimed in this audit. Screenshots should be captured from the successfully running programs and added only when they represent the real output.

## Final audit result

- Existing program paths: **preserved**
- Existing program topics: **preserved**
- Silent program deletion: **none found in the repository tree checked**
- Assignment programs: **present**
- Experiment 1 notes: **present**
- Indentation/comments: **cleaned**
- Smart Water daily-storage issue: **corrected**
