import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationApp extends StatelessWidget {
  static const homeRoute = '/';

  static const secondRoute = '${homeRoute}second';

  static const thirdRoute = '${homeRoute}third';

  static const fourthRoute = '${homeRoute}fourth';

  static const selectionRoute = '${homeRoute}selection';

  static const todoListRoute = '${homeRoute}todoList';

  final _routes = {
    homeRoute: (BuildContext context) => FirstRoute(),
    secondRoute: (BuildContext context) => SecondRoute(),
    thirdRoute: (BuildContext context) => ThirdScreen(),
    todoListRoute: (cotext) => TodoListRoute(),
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

class TodoListRoute extends StatelessWidget {
  final todos = List<Todo>.generate(44, (index) {
    return Todo('Todo $index',
        'A description of what needs to be done for Todo $index');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: todos.map((Todo todo) {
          return Card(
            child: ListTile(
              title: Text(todo.title),
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
