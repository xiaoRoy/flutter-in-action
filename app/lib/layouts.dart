import 'package:flutter/material.dart';

class MoreLayoutsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'More Layouts',
      home: MoreLayoutsScreen(),
    );
  }
}

class MoreLayoutsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Layouts'),
      ),
      body: Container(
          child: Align(
        alignment: Alignment.bottomCenter,
        child: BottomTabWidget(),
      )),
    );
  }
}

class NonMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Center()
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Hello World!',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class BottomTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TabWidget(
            icon: Icon(Icons.call),
            title: 'CALL',
          ),
          TabWidget(
            icon: Icon(Icons.map),
            title: 'MAP',
          ),
          TabWidget(
            icon: Icon(Icons.share),
            title: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  final Icon icon;
  final String title;

  TabWidget({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        icon,
        Container(
          child: Text(title),
        )
      ],
    );
  }
}
