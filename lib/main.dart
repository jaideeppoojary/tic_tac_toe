import 'package:flutter/material.dart';
import 'home_page.dart ';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe Game',
      theme: ThemeData(
        splashColor: Color(0xffff4754),
      ),
      home: HomePage(),
    );
  }
}
