### Building Beautiful UIs with Flutter

[Link](https://codelabs.developers.google.com/codelabs/flutter/#0)

#### Add a UI for composing messages

A __stateful widget__, a widget that has mutable state.

__State__ is information that can be read synchronously when the widget is built and that might change during the lifetime of the widget.

In Flutter, if you want to visually present stateful data in a widget, you should encapsulate this data in a __State__ object. You can then associate your State object with a widget that extends the StatefulWidget class.

#### Add a UI for displaying messages

##### Add a responsive Send button

__Row class__, A widget that displays its children in a horizontal array. [API Doc](https://api.flutter.dev/flutter/widgets/Row-class.html)

__Flexible class__, A widget that controls how a child of a `Row`, `Colum`n, or `Flex` flexes.

__fat arrow function declaration__

```dart
IconButton(
  icon: Icon(Icons.send),
  onPressed: () => _handleSummitted(_textEditingController.text),
);
```

In Dart syntax, the fat arrow function declaration => expression is shorthand for { return expression; }.

(only use in the single statement method ?)

Naming the argument `_` (underscore) is a convention to indicate that it won't be used.

__IconTheme__

To give the icons in your app an accent color, pass the color argument to IconButton. Alternatively, you can apply a different theme.

Icons inherit their color, opacity, and size from an IconTheme widget, which uses an IconThemeData object to define these characteristics

__Build Context__

A __BuildContext__ object is a handle to the location of a widget in your app's widget tree. Each widget has its own BuildContext, which becomes the parent of the widget returned by the StatelessWidget.build or State.build function. This means the _buildTextComposer() method can access the BuildContext object from its encapsulating State object; you don't need to pass the context to the method explicitly.

__`setState()`__

Only synchronous operations should be performed in `setState()`, because otherwise the framework could rebuild the widgets before the operation finishes.

#### Animate your app

__Specify an animation controller__

Animations in Flutter are encapsulated as Animation objects that contain a typed value and a status (such as forward, backward, completed, and dismissed). You can attach an animation object to a widget or listen for changes to the animation object. Based on changes to the animation object's properties, the framework can modify the way your widget appears and rebuild the widget tree.

When creating an `AnimationController`, you must pass it a `vsync` argument. The `vsync` prevents animations that are offscreen from consuming unnecessary resources. To use your `ChatScreenState` as the `vsync`, include a `TickerProviderStateMixin` mixin in the `ChatScreenState` class definition.

`class ChatSceenState extends State<ChatScreen> with TickerProviderStateMixin`

 In Dart, a mixin allows a class body to be reused in multiple class hierarchies.

##### Add a SizeTransition widget

SizeTransition - It inherts from AnimatedWidget which is a StatefulWidget.

##### Dispose the animation

dispose method - The framework calls this method when this `State` object will never build again.

#### Apply finishing touches

##### Make the Send button context-aware

onPressed property - The callback that is called when the button is tapped or otherwise activated.

If this is set to null, the button will be disabled.

##### Wrap longer lines

`Expanded` widget- A widget that expands a child of a Row, Column, or Flex so that the child fills the available space. Expanded allows a widget like Column to impose layout constraints (in this case the Column's width), on a child widget.

##### Customize for iOS and Android

defaultTargetPlatform top-level property

The TargetPlatform that matches the platform on which the framework is currently executing.

This is the default value of ThemeData.platform. Widgets from the material library should use Theme.of to determine the current platform for styling purposes, rather than using defaultTargetPlatform. 

#### Next Step

[Flutter Code Labs](https://codelabs.developers.google.com/?cat=Flutter)

[Flutter Sample Apps](https://github.com/flutter/flutter/tree/master/examples)

[Flutter Sampls](https://github.com/flutter/samples)

__More About Widget__

[Flutter Widget of the Week](https://www.youtube.com/watch?v=CI7x0mAZiY0)