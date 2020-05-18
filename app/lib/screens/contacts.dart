import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        centerTitle: true,
        title: Text("Контакты"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Адрес"),
            Text("Главный офис"),
            Text("БЦ Victory"),
            Text("Бишкек,Ибраимова 103"),
            Text("Связаться с нами"),
            Text("Telephone : +996 772 900 900"),
            Text("E-mail : inaiburger@gmail.com")
          ],
        ),
      ),
    );
  }
}
