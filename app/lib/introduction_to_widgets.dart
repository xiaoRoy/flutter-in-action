import 'package:flutter/material.dart';

class WidgetIntroductionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Introduction',
      home: Container(
        child: WidgetIntroductionScreen(),
      ),
    );
  }
}

class WidgetIntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Widget Introductions'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: _Counter(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {

  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {

  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    print('CounterIncrementor.build');
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}




class _Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterStateB();
  }
}

class CounterStateB extends State {
  int _counter = 0;

  void _increment() {
    setState(() => ++_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
       CounterIncrementor(onPressed: _increment,),
       CounterDisplay(count: _counter,)
      ],
    );
  }
}

class CounterState extends State {
  int _counter = 0;

  void _increment() {
    setState(() => ++_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
        Text('Count: $_counter')
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
      onTap: () => print('tappged'),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          CustomAppBar(
            title: Text(
              'Hello World!',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Custom'),
            ),
          ),
        ],
      ),
    );
  }
}
