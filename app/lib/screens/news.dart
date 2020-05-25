import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        centerTitle: true,
        title: Text("Новости"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(1), topRight: Radius.circular(1)),
              child: Image.asset(
                'assets/images/burger9.jpg',
                width: double.infinity,
                fit: BoxFit.fitWidth,
                height: 120,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(args[0],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(args[1],style: TextStyle(fontSize: 22),),
            ),
          ],
        ),
      ),
    );
  }
}
