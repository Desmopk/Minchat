import 'dart:io';
import 'package:flutter/material.dart';
import 'websocket_service.dart';

class ChatScreen extends StatefulWidget {
  final WebsocketService webSocketService;

  const ChatScreen({required this.webSocketService,super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  void initState() {
    super.initState();

    widget.webSocketService.channel.stream.listen((message) {
      setState(() {
        _messages.add(message);
      });
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.webSocketService.sendMessage(_controller.text);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    widget.webSocketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,leading: const Icon(Icons.chat_outlined),
        title: const Text('Chat Screen'),actions: [IconButton(onPressed: (){exit(0);}, icon: const Icon(Icons.exit_to_app_outlined))],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IntrinsicWidth(
                            child: ListTile(minLeadingWidth: 0,
                                          horizontalTitleGap: 0,
                              title: Text(_messages[index]),
                              tileColor: const Color.fromRGBO(230, 230, 234, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,)
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
