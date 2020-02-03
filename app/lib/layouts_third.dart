import 'package:flutter/material.dart';

class LayoutsThirdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutThridScreen(),
    );
  }
}

class LayoutThridScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Third'),
      ),
      body: AlignDemonstration(),
    );
  }
}

class AlignDemonstration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildCenterDemonstration();
  }

  Widget _buildCenterDemonstration() {
    // return _makeFirstDemonstration();
    return ListView(
      children: <Widget>[
        _makeFirstDemonstration(),
        Divider(),
        _makeFirstADemonstration(),
        Divider(),
      ],
    );
  }

  Widget _makeFirstDemonstration() {
    return Center(
      child: _logBoxConstraints(_makeFirstWidget(), "WithCenter")
    );
  }

  Widget _makeFirstWidget() {
    return Container(
      width: 120.0,
      height: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: Alignment.topRight,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }

  Widget _logBoxConstraints(Widget child, String tag) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        print('$tag: $boxConstraints');
        return child;
      },
    );
  }

  Widget _makeFirstADemonstration() {
    return _logBoxConstraints(_makeFirstWidget(), "NoCenter");
  }
}

class CampingInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final description =
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.';
    return MaterialApp(
      home: CampingInfoScreen(CampingInfo('Oeschinen Lake Campground',
          'Kandersteg, Switzerland', 44, description)),
    );
  }
}

class CampingInfoScreen extends StatelessWidget {
  final CampingInfo campingInfo;

  CampingInfoScreen(this.campingInfo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildFakeIamge(),
          _makeTitleSection(),
          _buildActions(context),
          _buildDescriptionSection(),
        ],
      ),
    );
  }

  Widget _makeTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    campingInfo.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  campingInfo.subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(campingInfo.likeCount.toString()),
        ],
      ),
    );
  }

  Row _buildActions(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildActionColumm(color, Icons.call, 'CALL'),
        _buildActionColumm(color, Icons.near_me, 'ROUTE'),
        _buildActionColumm(color, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildActionColumm(Color color, IconData iconData, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(iconData, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }

  Widget _buildDescriptionSection() => Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          campingInfo.description,
          softWrap: true,
        ),
      );

  Widget _buildFakeIamge() {
    return Container(
      height: 240,
      color: Colors.teal,
    );
  }
}

class CampingInfo {
  final String title;
  final String subtitle;
  int likeCount;
  final String description;

  CampingInfo(this.title, this.subtitle, this.likeCount, this.description);
}
