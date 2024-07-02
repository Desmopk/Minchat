import 'package:flutter/material.dart';
import 'package:minchat/pages/chat_screen.dart';
import 'package:minchat/pages/websocket_service.dart';

void main()
{
  return runApp(MinChat());
}
class MinChat extends StatelessWidget {
  final WebsocketService webSocketService = WebsocketService('ws://echo.websocket.org/.ws');

  MinChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(webSocketService: webSocketService,),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey)),
    );
  }
}

