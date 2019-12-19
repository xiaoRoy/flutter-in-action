### Building Beautiful UIs with Flutter

[Link](https://codelabs.developers.google.com/codelabs/flutter/#0)

#### Add a UI for composing messages

A __stateful widget__, a widget that has mutable state.

__State__ is information that can be read synchronously when the widget is built and that might change during the lifetime of the widget.

In Flutter, if you want to visually present stateful data in a widget, you should encapsulate this data in a __State__ object. You can then associate your State object with a widget that extends the StatefulWidget class.

#### Add a responsive Send button

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

__IconTheme__

Icons inherit their color, opacity, and size from an IconTheme widget, which uses an IconThemeData object to define these characteristics

__Build Context__

A __BuildContext__ object is a handle to the location of a widget in your app's widget tree. Each widget has its own BuildContext, which becomes the parent of the widget returned by the StatelessWidget.build or State.build function. This means the _buildTextComposer() method can access the BuildContext object from its encapsulating State object; you don't need to pass the context to the method explicitly.

__More About Widget__

[Flutter Widget of the Week](https://www.youtube.com/watch?v=CI7x0mAZiY0)