

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
          child: Text('Hello World!'),
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