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
      appBar: AppBar(),
      body: GridViewDemostration(),
    );
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
      children: _buildGridTile(44),
    );
  }

  List<Container> _buildGridTile(int count) {
    return List.generate(count, (index) => Container(
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
