import 'package:flutter/material.dart';

class ChapterThreeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChapterThreeScreen(),
    );
  }
}

class ChapterThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter Three'),
      ),
      body: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CouterState();
  }
}

class CouterState extends State {
  int _count = 0;

  List<Widget> _makeButtons() {
    final oneMore = RaisedButton(
      child: Text('One More'),
      onPressed: () {
        setState(() {
          _count++;
        });
      },
    );
    
    final oneLess = RaisedButton(
      child: Text('One Less'),
      onPressed: () {
        setState(() {
          _count--;
        });
      },
    );
    return <Widget>[oneMore, oneLess];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You have push the button this many times:'),
          Text(
            '$_count',
            style: Theme.of(context).textTheme.display1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _makeButtons()
          )
        ],
      ),
    );
  }
}
