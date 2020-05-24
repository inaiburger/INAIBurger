import 'package:flutter/material.dart';

class Soon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Скоро"), backgroundColor: Color.fromRGBO(163, 8, 11, 1),),
      body: Center(child: Text("На стадии разработки",style: TextStyle(fontSize: 24),),),
    );
  }
}