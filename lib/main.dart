import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minchat/pages/chat_screen.dart';
import 'package:minchat/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minchat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HomePage()
    );
  }
}
