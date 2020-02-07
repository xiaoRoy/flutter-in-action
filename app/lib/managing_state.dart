import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ManagingStateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManagingStateScreen(),
    );
  }
}

class ManagingStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Managing State'),
      ),
      body: TapBoxBParent(),
    );
  }
}

class TapBoxCParentWidget extends StatefulWidget {
  @override
  TapBoxCParentState createState() {
    return TapBoxCParentState();
  }
}

class TapBoxCParentState extends State<TapBoxCParentWidget> {
  bool _isActive = false;

  void _handleTapBoxChanged(bool isActive) {
    setState(() {
      _isActive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxC(
      isActive: _isActive,
      onActiveChange: _handleTapBoxChanged,
    );
  }
}

class TapBoxC extends StatefulWidget {
  final bool isActive;
  final ValueChanged<bool> onActiveChange;

  TapBoxC({Key key, this.isActive = false, @required this.onActiveChange});

  @override
  State<StatefulWidget> createState() {
    return TapBoxCState();
  }
}

class TapBoxCState extends State<TapBoxC> {
  bool _isHighLight = false;

  void _handleTapDown(TapDownDetails tapDownDetails) {
    setState(() {
      _isHighLight = true;
    });
  }

  void _handleTapUp(TapUpDetails tapUpDetails) {
    setState(() {
      _isHighLight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isHighLight = false;
    });
  }

  void _handleTap() {
    widget.onActiveChange(!widget.isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTap: _handleTap,
        onTapCancel: _handleTapCancel,
        child: Container(
          width: 200.0,
          height: 200.0,
          child: Center(
            child: Text(
              widget.isActive ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              color:
                  widget.isActive ? Colors.lightGreen[700] : Colors.grey[600],
              border: _isHighLight
                  ? Border.all(color: Colors.teal[700], width: 10.0)
                  : null),
        ));
  }
}

class TapBoxBParent extends StatefulWidget {
  @override
  TapBoxBParentState createState() {
    return TapBoxBParentState();
  }
}

class TapBoxBParentState extends State<TapBoxBParent> {
  bool _isActive = false;

  void _handleActiveChange(bool isActive) {
    setState(() {
      _isActive = isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxB(_isActive, _handleActiveChange);
  }
}

typedef void ActiveChangeCallback(bool isActive);

class TapBoxB extends StatelessWidget {
  final isActive;
  final ActiveChangeCallback activeChangeCallback;

  TapBoxB(this.isActive, this.activeChangeCallback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        activeChangeCallback(!isActive);
      },
      child: TapBox(isActive),
    );
  }
}

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TapBoxAState();
  }
}

class _TapBoxAState extends State<TapBoxA> {
  bool _isActive = false;

  void _handleState() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => setState(() {
      //   _isActive = !_isActive;
      // }),
      onTap: _handleState,
      child: TapBox(_isActive),
    );
  }
}

class TapBox extends StatelessWidget {
  final isActive;

  TapBox(this.isActive);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: Center(
        child: Text(
          isActive ? 'Active' : 'Inactive',
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.lightGreen[700] : Colors.grey[600],
      ),
    );
  }
}
