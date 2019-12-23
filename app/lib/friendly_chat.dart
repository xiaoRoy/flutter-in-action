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

class ChatSceenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _chatMessages = <ChatMessage>[];

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
    ChatMessage message = ChatMessage(
      message: text,
      animationController: AnimationController(
          duration: Duration(milliseconds: 700), vsync: this),
    );
    setState(() {
      _chatMessages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, index) => _chatMessages[index],
              itemCount: _chatMessages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    for(ChatMessage message in _chatMessages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

const String _userName = 'Smith';

class ChatMessage extends StatelessWidget {
  final String message;
  final AnimationController animationController;
  ChatMessage({this.message, this.animationController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController, 
        curve: Curves.easeOut
        ),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(_userName[0]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_userName, style: Theme.of(context).textTheme.subhead),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(message),
                ),
              ],
            ),
          ],
        ),
      ),
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
