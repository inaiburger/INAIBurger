import 'package:flutter/material.dart';
import 'screens/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'inaiBurger',
      home: TabsScreen(),
      theme: ThemeData(primaryColor: Colors.brown[500]),
    );
  }
}
