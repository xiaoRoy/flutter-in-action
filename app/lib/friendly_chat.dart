import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  //for the StateLessWidget
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Friendly Chat"),),
  //   );
  // }
  @override
  State<StatefulWidget> createState() {
    return ChatSceenState();
  }
}

class ChatSceenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textEditingController,
                  onSubmitted: _handleSummitted,
                  decoration:
                      InputDecoration.collapsed(hintText: "Sent a message"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () =>
                      _handleSummitted(_textEditingController.text),
                ),
              ),
            ],
          )),
    );
  }

  void _handleSummitted(String text) {
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
      ),
      body: _buildTextComposer(),
    );
  }
}

class ChatSceenB extends StatelessWidget {
  //for the StateLessWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friendly Chat"),
      ),
    );
  }
}

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Friendly Chat",
      home: ChatScreen(),
      // theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
