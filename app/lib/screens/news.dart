import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                              topLeft: Radius.circular(1),
                              topRight: Radius.circular(1)),
                          child: Image.asset(
                            'assets/images/burger9.jpg',
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                            height: 250,
                          ),
                        ),
                        SizedBox(height: 20,),
            Text("Самый вкусный Черный бургер от Бекболота"),
            Text("Гамбургёр Бекболот Акылбек уулу"),
            Text(""),
            Text(""),
          ],
        ),
      ),
    );
  }
}
