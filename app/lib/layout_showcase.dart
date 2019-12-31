

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
        child: SizedBoxRow(),
      ),
    );
  }
}

class SizedBoxRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BlueBox(),
        SizedBox(
          width: 50,
          height: 50,
          child: BlueBox(),
        ),
        BlueBox(),
        SizedBox(width: 50,),
        BlueBox(),
        SizedBox(width: 25,),
        BlueBox(),
      ],
    );
  }
}

class BlueBoxColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BlueBox(),
        BlueBox(),
        BlueBox(),
      ],
    );
  }
}

class ExpandedBlueBoxRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BlueBox(),
        Expanded(
          child: BlueBox(),
        ),
        Expanded(
          child: BlueBox(),
        ),
      ],
    );
  }
}

class FlexibleBlueBoxRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BlueBox(),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: BlueBox(),
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 2,
          child: BlueBox(),
        ),
      ],
    );
  }
}


class FixedBlueBoxRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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