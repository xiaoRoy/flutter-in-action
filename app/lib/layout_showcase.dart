

import 'package:flutter/material.dart';

class LayoutShowcaseApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layout Showcase",
      home: LayoutShowcaseScreen(),
    );
  }
}


class LayoutShowcaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Shwocase'),
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: BlueBoxRows(),
      ),
    );
  }
}


class BlueBoxRows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BlueBox(),
        BlueBox(),
        BlueBox(),
      ],
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: 50.0,
       height: 50.0,
       decoration: BoxDecoration(
         color: Colors.blue,
         border: Border.all(),
       ),
    );
  }
}