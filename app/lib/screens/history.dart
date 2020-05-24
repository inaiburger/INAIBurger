import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        centerTitle: true,
        title: Text('Заказы'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 8,
            margin: EdgeInsets.all(8),
            
            child: Container(padding: EdgeInsets.all(15),child: Text('12094012940:  1600 som',style: TextStyle(fontSize: 30),)),
          ),
          Card(
            elevation: 8,
            margin: EdgeInsets.all(8),
            child: Container(padding: EdgeInsets.all(15),child: Text('12948892849:  320 som',style: TextStyle(fontSize: 30),)),
          )
        ],
      ),
    );
  }
}
