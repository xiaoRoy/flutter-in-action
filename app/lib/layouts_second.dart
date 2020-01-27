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
      body: StackDemostration(),
    );
  }
}

class StackDemostration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _makeStack();
  }

  Widget _makeStack() {
    return Stack(
      children: <Widget>[
        Container(
          width: 250,
          height: 250,
          color: Colors.grey,
        ),
        Container(
          padding: EdgeInsets.all(5.0),
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
