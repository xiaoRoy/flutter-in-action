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
      body: RecipeInfoWidget(),
    );
  }
}

class RecipeInfoWidget extends StatelessWidget {
  final title = Container(
    padding: EdgeInsets.all(20),
    child: Text(
      'Strawberry Pavlova',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
        fontSize: 30,
      ),
    ),
  );

  final subtitle = Text(
    '''avlova is a meringue-based dessert named after the Russian ballerina 
    Anna Pavlova. Pavlova features a crisp crust and soft, light inside,
    topped with fruit and whipped cream.
    ''',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: 'Georgia',
      fontSize: 25,
    ),
  );

  Image _makeImage() {
    return Image.asset(
      'images/pavlova.jpg',
      fit: BoxFit.cover,
    );
  }

  final descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
      height: 600,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 440,
              child: _makeRecipe(),
            ),
            _makeImage(),
          ],
        ),
      ),
    );
  }

  Container _makeRecipe() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: <Widget>[
          // title, 
          // subtitle,
          StarRating(4, 44),
          _makeHints(),
        ],
      ),
    );
  }

  Widget _makeHints() {
    return DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HintIcon(Icon(Icons.kitchen), 'PREP:', '25 min'),
              HintIcon(Icon(Icons.timer), 'COOK:', '1 h'),
              HintIcon(Icon(Icons.restaurant), 'FEEDS:', '4-6'),
            ],
          ),
        ));
  }
}

class HintIcon extends StatelessWidget {
  final Icon _icon;
  final String _firstHint;
  final String _secondHint;

  HintIcon(this._icon, this._firstHint, this._secondHint);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _icon,
        Text(_firstHint),
        Text(_secondHint),
      ],
    );
  }
}

class StarRating extends StatelessWidget {
  final int _rating;
  final int _countOfReview;

  StarRating(this._rating, this._countOfReview);

  List<Icon> _makeTheRating() {
    final ratingStars = <Icon>[];
    for (var index = 0; index < 5; index++) {
      var starColor;
      if (index < _rating) {
        starColor = Colors.green[500];
      } else {
        starColor = Colors.black;
      }
      ratingStars.add(Icon(Icons.star, color: starColor));
    }
    return ratingStars;
  }

  Text _makeReviews() {
    var review = '$_countOfReview Review';
    if (_countOfReview != 1) {
      review += 's';
    }
    return Text(
      review,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: _makeTheRating(),
            ),
            _makeReviews(),
          ],
        ));
  }
}

class TooLagerImageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Image.asset('images/pic1.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic2.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic3.jpg'),
        ),
      ],
    );
  }
}

class ImageRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic2.jpg'),
        Image.asset('images/pic3.jpg'),
      ],
    );
  }
}

class ImageColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset('images/pic1.jpg'),
        Image.asset('images/pic2.jpg'),
        Image.asset('images/pic3.jpg'),
      ],
    );
  }
}

class NonMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
