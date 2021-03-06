### Install

#### Get the Flutter SDK

1. Download the SDK and unzip it. 
2. Setup the environment path.

__Permission Issue__

`shlock: open(/usr/local/flutter/flutter/bin/cache/shlock1315): Permission denied`

`sudo chown -R Jerry: /usr/local/flutter/flutter`

#### Run the flutte SDK

The Dart SDK is bundled with Flutter; it is not necessary to install Dart separately. 

#### iOS setup

1. Install the latest stable version of Xcode.

2. Configure the Xcode command-line tools to use the newly-installed version of Xcode by running the following from the command line:

   ```bash
    sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -runFirstLaunch
   ```

3. Make sure the Xcode license agreement is signed by either opening Xcode once and confirming or running `sudo xcodebuild -license` from the command line.

#### Deploy to iOS devices(To be Read)

[Link](https://flutter.dev/docs/get-started/install/macos#deploy-to-ios-devices)

####  Android setup

### Set up an editor

Open the Command Palette (Ctrl+Shift+P (Cmd+Shift+P on macOS)) in VS Code

### Test drive

#### Try hot reload

Flutter offers a fast development cycle with Stateful Hot Reload, the ability to reload the code of a live running app without restarting or losing app state.

#### Profile or release runs

Debug mode trades performance for useful developer features such as hot reload and step debugging.

### Write your first Flutter app, part 1

####  Step 1: Create the starter Flutter app

#### Observations

- arrow (`=>`) notation. Use arrow notation for one-line functions or methods.
- Everything is a widget.
- The `Scaffold` widget, from the Material library, provides a default app bar, title, and a body property that holds the widget tree for the home screen.
- A widget’s main job is to provide a build() method that describes how to display the widget in terms of other, lower level widgets.

#### Step 2: Use an external package

__Add the dependency__

pubspec.yaml manages the asstes and dependencies for a Flutte app.

```shell
flutter pub get
```

Performing  get also auto-generates the pubspec.lock file with a list of all packages pulled into the project and their version numbers

__Import it__

```dart
import 'package:english_words/english_words.dart';
```

#### Step 3: Add a Stateful widget

Stateless widgets are immutable, meaning that their properties can’t change—all values are final.

Stateful widgets maintain state that might change during the lifetime of the widget. Stateful widgets consist of 2 parts. The `StatefulWidget` create a instance of `State` __The `StatefulWidget` class is, itself, immutable, but the `State` class persists over the lifetime of the widget.__

####  Step 4: Create an infinite scrolling ListView

```dart
final _suggestions = <WordPair>[]; //Prefixing an identifier with an underscore enforces privacy in the Dart language.
```

```dart
final index = i ~/ 2; //The expression i ~/ 2 divides i by 2 and returns an integer result. 
```

### Write Your First Flutter App, part 2

#### Add icons to the list

`Icons` and `Colors` to define the Icon.

#### Add interactivity

In Flutter's reactive style framework, calling setState() triggers a call to the build() method for the State object, resulting in an update to the UI.

#### Navigate to a new screen

__Route and Navigator__

A page is called route in Flutter.

In Flutter, the Navigator manages a stack containing the app's routes. Pushing a route onto the Navigator's stack, updates the display to that route. Popping a route from the Navigator's stack, returns the display to the previous route.

#### Change the UI using Themes

You can easily change an app's theme by configuring the `ThemeData` class.