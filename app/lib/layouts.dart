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
      body: Container(child: StarRating(4, 44)),
    );
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
    if(_countOfReview != 1){
      review  += 's';
    }
    return Text(review,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 20
      ),
    )
    ; 
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
