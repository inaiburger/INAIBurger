import 'package:flutter/material.dart';

import 'contacts_screen.dart';
import 'crazy_construcktor_screen.dart';

class ConstructorMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        'assets/images/constructorPage1.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(163, 8, 11, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.width * 0.45,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ContactScreen()));
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/burger.png')),
                          Text(
                            'Classic',
                            style: TextStyle(color: Colors.white),
                          )
                        ])),
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(163, 8, 11, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.width * 0.45,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CrazyConstructorScreen()),
                      );
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                  'assets/images/crazyBurger3.png')),
                          Text(
                            'Custom',
                            style: TextStyle(color: Colors.white),
                          )
                        ])),
              )
            ])
          ],
        ),
      ),
    ]);
  }
}
