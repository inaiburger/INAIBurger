import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inaiburger/screens/burger_detail_screen.dart';
import 'package:inaiburger/screens/login_screen.dart';
import 'package:inaiburger/screens/news_screen.dart';
import 'screens/constructor_screen.dart';
import 'screens/crazy_construcktor_screen.dart';
import 'screens/news.dart';
import 'screens/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'inaiBurger',
      home: TabsScreen(),
      theme: ThemeData(primaryColor: Colors.brown[500]),
      routes: {
        '/constructor': (context) => ConstructorScreen(),
        '/crazy': (context) => CrazyConstructorScreen(),
        '/detail': (context) => BurgerDetail(),
        '/detailNews':(context)=>News()
      },
    );
  }
}
