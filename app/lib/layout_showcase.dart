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
        child: FlexibleContainerColumn(),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Flutter McFlutter',
                  style: Theme.of(context).textTheme.headline,
                ),
                Text('Experienced App Developer'),
              ],
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('123 Main Street'),
            Text('(014) 555-0198'),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.accessibility),
            Icon(Icons.timer),
            Icon(Icons.phone_android),
            Icon(Icons.phone_iphone),
          ],
        )
      ],
    );
  }
}

class ImageRow extends StatelessWidget {
  static const _url =
      'https://github.com/flutter/website/blob/master/examples/layout/sizing/images/pic2.jpg?raw=true';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Image.network(_url)],
    );
  }
}

class IconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.widgets,
          size: 50,
          color: Colors.blue,
        ),
        Icon(
          Icons.widgets,
          size: 50,
          color: Colors.red,
        ),
        Icon(
          Icons.work,
          size: 50,
          color: Colors.lightBlue,
        ),
      ],
    );
  }
}

class TextRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          'Hey!',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Futura',
            color: Colors.blue,
          ),
        ),
        Text(
          'Hey!',
          style: TextStyle(
            fontSize: 50,
            fontFamily: 'Futura',
            color: Colors.green,
          ),
        ),
        Text(
          'Hey!',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Futura',
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class SpacerBlueBoxRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BlueBox(),
        Spacer(
          flex: 1,
        ),
        BlueBox(),
        Spacer(
          flex: 1,
        ),
        BlueBox(),
      ],
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
        SizedBox(
          width: 50,
        ),
        BlueBox(),
        SizedBox(
          width: 25,
        ),
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

class FlexibleContainerColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlexibleContainer(
          color: Colors.lightBlue,
          height: 100,
          felx: 5,
        ),
        FlexibleContainer(
          color: Colors.lightBlue,
          felx: 2,
        ),
        FlexibleContainer(
          color: Colors.lightBlue,
          felx: 1,
        ),
      ],
    );
  }
}

class FlexibleContainer extends StatelessWidget {
  final Color color;
  final int felx;
  final double width;
  final double height;

  const FlexibleContainer(
      {Key key,
      double width,
      double height,
      @required this.color,
      this.felx = 1})
      : this.width = width,
        this.height = height,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: felx,
      // fit: FlexFit.tight,
      child: Container(
        color: color,
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(vertical: 16.0),
      ),
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
