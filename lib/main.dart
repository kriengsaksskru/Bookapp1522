import 'package:flutter/material.dart';
import 'package:BOOKAPP1522/Screens/Welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BOOKAPP1522',
      theme: new ThemeData(
        primaryColor: Colors.blue[500],
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
