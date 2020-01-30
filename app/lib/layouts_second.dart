import 'package:flutter/material.dart';

class LayoutSecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Second',
      home: LayoutSecondScreen(),
    );
  }
}

class LayoutSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Second'),
      ),
      // body: ListViewDemostration(ColorItem.converToColorItems(Colors.blue)),
      body: ListTitleDemostration(),
    );
  }
}

class ListTitleDemostration extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildOneLineListTile(),
        _buildOneLineListTileWithLeadingWidget(),
        _buildOneLineListTitlWithTrailingWidget(),
        _buildOneLineListTileWithBoth(),
        _buildOneLineDenseListTile(),
        _buildListTile(),
        _buildThreeLineListTile()
      ],
    );
  }

  Widget _buildOneLineListTile() {
    return Card(child: ListTile(title: Text('One-line ListTile'),));
  }

  Widget _buildOneLineListTileWithLeadingWidget() {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line ListTile with leading widget'),
      ),
    );
  }

  Widget _buildOneLineListTitlWithTrailingWidget() {
    return Card(
      child: ListTile(
        title: Text('One-line ListTile with trailing widget'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  Widget _buildOneLineListTileWithBoth() {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line ListTile with both widgets'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  Widget _buildOneLineDenseListTile() {
    return Card(
      child: ListTile(
        title: Text('One-line dense ListTile'),
        dense: true,
      ),
    );
  }

  Widget _buildListTile() {
    return Card(
      child: ListTile(
        leading: FlutterLogo(size: 56.0,),
        title: Text('Two-line ListTile '),
        subtitle: Text('Here is a second line'),
        trailing: Icon(Icons.more_vert),
        enabled: true,
        onTap: () {print("When the tile is tapped, the whole row has an ink splash effect.");},
      ),
    );
  }

  Widget _buildThreeLineListTile() {
    return Card(
      child: ListTile(
        isThreeLine: true,
        leading: FlutterLogo(size: 72.0,),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}

class CardDemostration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.0,
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '1625 Main Street',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Big City, CA 99944'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              '(408) 555-1212',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: Text("what@what.com"),
            leading: Icon(
              Icons.email,
              color: Colors.blue[500],
            ),
          )
        ],
      ),
    );
  }
}

class StackDemostration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _makeStack();
  }

  Widget _makeStack() {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.yellowAccent,
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.black.withAlpha(0),
                Colors.black12,
                Colors.black45,
              ],
            )),
            child: Text(
              'Foreground Text',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewDemostration extends StatelessWidget {
  final List<ColorItem> colorItems;

  ListViewDemostration(this.colorItems);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: colorItems.length * 4,
      itemBuilder: (BuildContext context, int index) {
        final realIndex = index % colorItems.length;
        final colorItem = colorItems[realIndex];
        return _makeItem(index, colorItem);
      },
    );
  }

  Widget _makeItem(int index, ColorItem colorItem) {
    final isEven = index % 2 == 0;
    Widget item;
    if (isEven) {
      item = Container(
        height: 50,
        alignment: Alignment.center,
        color: colorItem.color,
        child: Text(colorItem.colorInfo),
      );
    } else {
      item = Container(
        height: 50,
        color: colorItem.color,
        child: Center(
          child: Text(colorItem.colorInfo),
        ),
      );
    }
    return item;
  }
}

class ColorItem {
  static const List<int> primaryColorKeys = <int>[
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    900
  ];
  final Color color;
  final String colorInfo;

  ColorItem(this.color, int colorKey) : colorInfo = 'Color Entry: $colorKey';

  static List<ColorItem> converToColorItems(MaterialColor materialColor) {
    return primaryColorKeys
        .map((colorKey) {
          final color = materialColor[colorKey];
          ColorItem colorItem;
          if (color != null) {
            colorItem = ColorItem(color, colorKey);
          }
          return colorItem;
        })
        .where((colorItem) => colorItem != null)
        .toList();
  }
}

class GridViewDemostration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      scrollDirection: Axis.vertical,
      children: _buildGridTile(44),
    );
  }

  List<Container> _buildGridTile(int count) {
    return List.generate(
        count,
        (index) => Container(
              alignment: Alignment.center,
              color: Colors.black12,
              child: Text('$index'),
            ));
  }
}

class ContainerDemostration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTextRow(['here', 'what']),
          _buildTextRow(['there', 'why'])
        ],
      ),
    );
  }

  Widget _buildTextRow(List<String> textList) {
    final children = textList.map((text) {
      return _buildDecoratedText(text);
    });
    return Row(children: children.toList());
  }

  Widget _buildDecoratedText(String text) => Expanded(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black38),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
}
