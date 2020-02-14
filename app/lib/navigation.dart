import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationApp extends StatelessWidget {
  static const homeRoute = '/';

  static const secondRoute = '${homeRoute}second';

  static const thirdRoute = '${homeRoute}third';

  static const fourthRoute = '${homeRoute}fourth';

  static const selectionRoute = '${homeRoute}selection';

  static const todoListRoute = '${homeRoute}todoList';

  static const animationRoute = '${homeRoute}animation';

  final _routes = {
    homeRoute: (BuildContext context) => FirstRoute(),
    secondRoute: (BuildContext context) => SecondRoute(),
    thirdRoute: (BuildContext context) => ThirdScreen(),
    todoListRoute: (cotext) => TodoListRoute(),
    animationRoute: (_) => AnimationMainPage(),
    // selectionRoute: (BuildContext context) => SelectionScreen(),
  };

  Route<dynamic> _onGenerateRoute(RouteSettings routeSettings) {
    Route route;
    if (routeSettings.name == fourthRoute) {
      final ScreenInfo screenInfo = routeSettings.arguments;
      route = MaterialPageRoute(builder: (BuildContext buildContext) {
        return FourthScreen(screenInfo.title, screenInfo.description);
      });
    }
    return route;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homeRoute,
      routes: _routes,
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

class AnimationSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: FlutterHero(),
        ),
      ),
    );
  }
}

class FlutterHero extends Hero {
  static const imageUrl =
      'https://flutter.dev/assets/flutter-lockup-c13da9c9303e26b8d5fc208d2a1fa20c1ef47eb021ecadf27046dea04c0cebf6.png';
  FlutterHero({Key key})
      : super(key: key, tag: "flutterHero", child: Image.network(imageUrl));
}

class AnimationMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Main'),
      ),
      body: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnimationSecondPage()));
          },
          child: FlutterHero()),
    );
  }
}

class TodoDetailBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return TodoDetailScaffold(todo: todo);
  }
}

class TodoDetailScaffold extends StatelessWidget {
  final Todo todo;

  TodoDetailScaffold({Key key, @required Todo todo})
      : this.todo = todo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

class TodoDetailPage extends StatelessWidget {
  final Todo todo;

  TodoDetailPage({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoDetailScaffold(todo: todo);
  }
}

class TodoListRoute extends StatelessWidget {
  final todos = List<Todo>.generate(44, (index) {
    return Todo('Todo $index',
        'A description of what needs to be done for Todo $index');
  });

  void _navigateToTodoDetail(BuildContext context, Todo todo) {
    Navigator.push(context, MaterialPageRoute<void>(builder: (context) {
      return TodoDetailPage(todo: todo);
    }));
  }

  void _navigateToTodoDetailB(BuildContext context, Todo todo) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (context) {
              return TodoDetailBPage();
            },
            settings: RouteSettings(arguments: todo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: todos.asMap().entries.map((MapEntry<int, Todo> entry) {
          final index = entry.key;
          final todo = entry.value;
          return GestureDetector(
            onTap: () {
              if (index % 2 == 0) {
                _navigateToTodoDetail(context, todo);
              } else {
                _navigateToTodoDetailB(context, todo);
              }
            },
            child: Card(
              child: ListTile(
                title: Text(todo.title),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Todo {
  final title;
  final description;

  Todo(this.title, this.description);
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'Nope!');
                },
                child: Text('Nope!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationButton(
      description: 'Pick an option, any option!',
      navigation: _navigateToSelectionScreen,
    );
  }

  void _navigateToSelectionScreen(BuildContext context) async {
    final String result = await Navigator.push(context,
        MaterialPageRoute<String>(builder: (context) {
      return SelectionScreen();
    }));
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(result),
      ));
  }
}

class FirstRoute extends StatelessWidget {
  void _navigateToSecondRoute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SecondRoute();
    }));
  }

  void _navigateToSecondRouteNamed(BuildContext context) {
    Navigator.pushNamed(context, NavigationApp.secondRoute);
  }

  void _navigateToThirdScreen(BuildContext context) {
    final screenInfo = ScreenInfo(
        'Third Screen', 'This message is extracted in the build method.');
    print("screenInfo:${screenInfo.hashCode}");
    Navigator.pushNamed(context, NavigationApp.thirdRoute,
        arguments: screenInfo);
  }

  void _navigateToFourScreen(BuildContext context) {
    final screenInfo = ScreenInfo('Fourth Screen',
        'This message is extracted in the onGenerateRoute function.');
    print("screenInfo:${screenInfo.hashCode}");
    Navigator.pushNamed(context, NavigationApp.fourthRoute,
        arguments: screenInfo);
  }

  void _navigateTodoList(BuildContext context) {
    Navigator.pushNamed(context, NavigationApp.todoListRoute);
  }

  void _navigateToAnimationPage(BuildContext context) {
    Navigator.pushNamed(context, NavigationApp.animationRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NavigationButton(
            description: 'Navigate to Second Route',
            navigation: _navigateToSecondRouteNamed,
          ),
          NavigationButton(
            description: 'Navigate to Third Route',
            navigation: _navigateToThirdScreen,
          ),
          NavigationButton(
            description: 'Navigate to Fourth Route',
            navigation: _navigateToFourScreen,
          ),
          SelectionButton(),
          NavigationButton(
            description: 'Navigate to Todo List',
            navigation: _navigateTodoList,
          ),
          NavigationButton(
            description: 'Navigate To Animation',
            navigation: _navigateToAnimationPage,
          ),
        ],
      )),
    );
  }
}

typedef void Navigation(BuildContext context);

class NavigationButton extends StatelessWidget {
  final String description;
  final Navigation navigation;

  NavigationButton(
      {Key key, @required String description, @required Navigation navigation})
      : this.description = description,
        this.navigation = navigation,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          height: 36.0,
          child: RaisedButton(
            onPressed: () {
              navigation(context);
            },
            child: Text(description),
          )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  void _backToFirstRoute(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _backToFirstRoute(context);
          },
          child: Text('Back to First Route'),
        ),
      ),
    );
  }
}

class ScreenInfo {
  final title;
  final description;

  ScreenInfo(this.title, this.description);
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenInfo screenInfo = ModalRoute.of(context).settings.arguments;
    print("screenInfo:${screenInfo.hashCode}");
    return Scaffold(
      appBar: AppBar(
        title: Text(screenInfo.title),
      ),
      body: Center(
        child: Text(screenInfo.description),
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  final String title;
  final String description;

  FourthScreen(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
            color: Colors.lightBlue,
            child: Center(
              child: Text(description),
              //   // child: Text('description'),
              // ),
            )));
  }
}
