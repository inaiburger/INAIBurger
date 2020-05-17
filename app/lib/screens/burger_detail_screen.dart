import 'package:flutter/material.dart';
import 'package:inaiburger/models/burger.dart';
import 'package:inaiburger/models/component_images.dart';

import '../dummy_data.dart';

class BurgerDetail extends StatelessWidget {
  final List<Burger> availableBurgers = DUMMY_BURGERS;

  BurgerDetail();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final String description =
        availableBurgers[args].description.reduce((value, element) {
      return value + element;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Details',
            style: TextStyle(
                fontFamily: 'Varela', fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        Hero(
            tag: dummyburgers[args][1],
            child: Image.asset(availableBurgers[args].imageUrl,
                height: 150.0, width: 100.0, fit: BoxFit.contain)),
        SizedBox(height: 20.0),
        Center(
          child: Text('${availableBurgers[args].price}' + ' som',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532))),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(availableBurgers[args].title,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: FloatingActionButton.extended(
                backgroundColor: Color(0xFFF17532),
                onPressed: () {
                  card.contains(dummyburgers[args][0])
                      ? print('Already exists')
                      : card.add(dummyburgers[args][0]);
                  Navigator.of(context).pop();
                },
                label: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(child: Text('Add to Cart'))))),
        SizedBox(height: 20.0),
      ]),
    );
  }
}
