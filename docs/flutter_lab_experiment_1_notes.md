# Flutter Lab – Experiment 1 Notes

> **Source:** `Flutter exp1.pdf` supplied for this lab repository.
>
> This note keeps the terminology and procedure from the supplied lab document and reorganizes it into a quick-study format. The source document is 16 pages and mainly covers Flutter introduction and Experiment 1 installation/setup.

## 1. Introduction to Mobile App Development

The source explains that mobile applications are widely used for communication, entertainment, education, healthcare, banking and e-commerce. It highlights the need for responsive, visually appealing and efficient applications.

Flutter is introduced as a cross-platform framework that can share one codebase across platforms. The document highlights Flutter's widget-based UI, hot reload, integration with APIs/databases and its Dart programming language.

## 2. What is Flutter?

Flutter is described in the source as an open-source UI toolkit developed by Google for building natively compiled applications for Android, iOS, web and desktop from a single codebase.

Important points from the source:

- Flutter uses the Dart programming language.
- Flutter provides a widget-based architecture.
- Hot reload lets developers quickly see code changes.
- Flutter provides a reactive programming model and a high-performance rendering engine.

## 3. Why Flutter?

The source lists these reasons:

1. **Single Codebase** – one codebase can target multiple platforms.
2. **Hot Reload** – quickly view changes while developing.
3. **Custom UI Design** – widgets can be customized.
4. **Native Performance** – Flutter compiles to native ARM code.
5. **Strong Community & Support** – Google support and a large ecosystem.
6. **Integration Capabilities** – REST APIs, Firebase, databases, payment gateways and other services can be integrated.

## 4. Purpose of the Lab

The lab is intended to give practical experience in:

- UI design
- Functional logic
- State management
- Form handling
- Local storage
- API integration
- Animations
- Firebase authentication

The source also states learning outcomes such as responsive UI, StatefulWidgets, routing/navigation, Provider, forms and validation, local/remote storage, animations and Firebase integration.

## 5. Tools and Technologies Mentioned

The source lists:

- Flutter SDK
- Dart programming language
- Android Studio / Visual Studio Code
- Firebase Authentication
- `http` plugin for API calls
- `shared_preferences` plugin
- `sqflite` plugin for SQLite
- Provider package
- Google Fonts
- Custom Widgets
- Animations

## 6. Experiment No. 1 – Installation

### Aim

Install and configure Flutter, Android Studio and the required development tools.

### Step 1 – Install Flutter SDK

The source directs the student to the Flutter documentation:

`https://docs.flutter.dev/get-started`

For Windows, the source procedure is:

1. Open the Flutter installation documentation.
2. Choose **Windows** as the development platform.
3. Choose the Android application setup.
4. Download the latest stable Flutter SDK bundle.
5. Create a `Flutter` folder in the C drive.
6. Inside it, create a `src` folder.
7. Extract the Flutter SDK into the `src` folder.

The source therefore uses a path similar to:

```text
C:\Flutter\src\flutter
```

### Step 2 – Run `flutter doctor`

The source explains that you can open a command prompt from:

```text
C:\Flutter\src\flutter\bin
```

and run:

```bash
flutter doctor
```

This command is used in the source to check the Flutter installation and identify missing components.

### Step 3 – Add Flutter to PATH

If `flutter` is not recognized when Command Prompt is opened normally, the source instructs the student to add the Flutter `bin` directory to the system environment variables.

Path shown in the source:

```text
C:\Flutter\src\flutter\bin
```

After adding the path, open Command Prompt again and run:

```bash
flutter doctor
```

### Step 4 – Dart SDK

The source specifically states that a separate Dart SDK installation is not needed after Flutter installation because Dart is included with the Flutter bundle.

### Step 5 – Install Android Studio

The source procedure is:

1. Download Android Studio.
2. Open the downloaded installer.
3. Complete the installation wizard.
4. Open Android Studio.
5. Install the Flutter plugin from the Plugins section.
6. Restart the IDE.

### Step 6 – Android SDK Tools

The source instructs the student to open **SDK Manager** and go to **SDK Tools**.

It specifically mentions selecting **Android SDK Command-line Tools (latest)** and downloading it.

Then run:

```bash
flutter doctor
```

### Step 7 – Android licenses

The source gives this command:

```bash
flutter doctor --android licenses
```

Accept the required licenses by entering `y` as prompted, then run:

```bash
flutter doctor
```

again to check the setup.

### Step 8 – Set Flutter SDK path in Android Studio

The source describes creating a new Flutter project and selecting the Flutter SDK path in Android Studio. The example path shown is:

```text
C:\Flutter\src\flutter
```

Then:

1. Select **New Flutter Project**.
2. Choose the Flutter project generator.
3. Select the Flutter SDK path.
4. Enter the project name.
5. Select the required platforms.
6. Click **Create**.

### Step 9 – Find `main.dart`

The source identifies the main program file as:

```text
Project → lib → main.dart
```

### Step 10 – Install Visual Studio Code Flutter extension

The source also describes VS Code setup:

1. Download and install Visual Studio Code.
2. Open VS Code.
3. Install the Flutter extension.
4. Open **View → Command Palette**, or press:

```text
Ctrl + Shift + P
```

5. Type:

```text
Flutter: New Project
```

6. Select **Application**.
7. Choose/create the folder where projects will be stored.
8. Enter the project name.
9. Press Enter to create the project.

## 7. Quick Viva Questions

### What is Flutter?
Flutter is an open-source UI toolkit developed by Google for building applications from a single codebase.

### Which language does Flutter use?
Dart.

### What is hot reload?
It lets developers quickly see changes made to the application during development.

### Is separate Dart SDK installation required after Flutter installation?
The supplied document says no; Dart is included in the Flutter bundle.

### What command checks the Flutter installation?
```bash
flutter doctor
```

### What command is used for Android licenses in the supplied procedure?
```bash
flutter doctor --android licenses
```

### Where is the main Flutter program normally located in a project?
```text
lib/main.dart
```

## 8. Source Page Map

- **Pages 1–4:** Introduction, Flutter definition, benefits, purpose, learning outcomes and tools.
- **Pages 5–8:** Flutter SDK installation, folder setup, `flutter doctor` and PATH configuration.
- **Pages 9–12:** Dart/Android Studio setup, Flutter plugin, SDK tools and Android licenses.
- **Pages 13–16:** Flutter SDK path, project creation, `lib/main.dart` and VS Code Flutter project setup.

The original PDF contains screenshots for the installation steps. The repository keeps these notes as a searchable study guide; the original binary PDF should be retained separately if binary upload is enabled.
