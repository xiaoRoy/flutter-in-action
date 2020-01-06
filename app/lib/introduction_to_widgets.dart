

import 'package:flutter/material.dart';

class WidgetIntroductionApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Introduction',
      home: WidgetIntroductionScreen(),
    );
  }
}

class WidgetIntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Introduction'),
      ),
      body: Container(),
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
    );
  }
}