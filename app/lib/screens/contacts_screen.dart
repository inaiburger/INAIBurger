import 'package:flutter/material.dart';
import 'package:inaiburger/screens/slider.dart';
import '../models/component_images.dart';

class ContactScreen extends StatelessWidget {
  int classicBurgerCount = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/background.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(children: <Widget>[
          AnimSliderWidget(0),
          AnimSliderWidget(2),
          AnimSliderWidget(1),
          AnimSliderWidget(3),
          AnimSliderWidget(1),
          AnimSliderWidget(4),
          Center(
            child: FlatButton(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                      child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ))),
              color: Color.fromRGBO(163, 8, 11, 1),
              onPressed: () {
                print(slider);
                cart[classicBurgerCount] = slider;
                print("===================");
                print(cart);
                classicBurgerCount++;
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 15,)
        ]),
      ),
    ]);
  }
}
