import 'package:flutter/material.dart';
import 'package:inaiburger/models/component_images.dart';

import 'constructor_screen.dart';
import 'crazy_construcktor_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, int> intArguments = {
      'img1': 1,
      'img2': 1,
      'img3': 1,
      'img4': 1,
      'img5': 1,
      'img6': 1,
    };
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Expanded(
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: List<Widget>.generate(dummyburgers.length, (index) {
                return InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            ClipRect(
                              child: Center(
                                child: Image.asset(
                                  dummyburgers[index][1],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(dummyburgers[index][0],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: index);
                  },
                  splashColor: Colors.orange,
                );
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                  // heroTag: "btn1",
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, '/constructor',
                        arguments: intArguments);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(child: Text('Classic',style: TextStyle(color: Colors.white),)))),
              FlatButton(
                // heroTag: "btn2",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CrazyConstructorScreen()),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Center(child: Text('Crazy',style: TextStyle(color: Colors.white)))),
                color: Colors.redAccent,
              )
            ],
          ),
        ]));
  }
}

Widget burgerItem(String itemImage) {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRect(
                child: Center(
                  child: Image.asset(
                    itemImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          Text('Burger',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    ),
    onTap: () {},
    splashColor: Colors.orange,
  );
}

class DetailBurger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
