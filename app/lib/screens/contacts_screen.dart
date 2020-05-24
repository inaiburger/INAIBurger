import 'package:flutter/material.dart';
import 'package:inaiburger/models/crazy_burger.dart';
import 'package:inaiburger/screens/slider.dart';
import '../models/component_images.dart';

class ClassicCustomButger extends StatefulWidget {
  @override
  _ClassicCustomButgerState createState() => _ClassicCustomButgerState();
}

class _ClassicCustomButgerState extends State<ClassicCustomButger> {
  int classicBurgerCount = 0;

  int price = 0;
  showTransactionConfirm() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 200,
                width: 200,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Total:   $price som',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FlatButton(
                              color: Colors.red[300],
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                price = 0;
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              color: Colors.red[300],
                              child: Text('Accept',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                cart[ints[countCustomBurgers]] = price;
                                card.add(ints[countCustomBurgers]);
                                burgerIdimages[ints[countCustomBurgers]] = [
                                  'assets/burger.png',
                                  price,
                                  1
                                ];
                                allBurgers[countCustomBurgers]=slider;
                                countCustomBurgers++;
                                print(countCustomBurgers);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

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
          title: Text('Классический конструктор'),
          backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(children: <Widget>[
          AnimSliderWidget(0,slider),
          AnimSliderWidget(4,slider),
          AnimSliderWidget(3,slider),
          AnimSliderWidget(4,slider),
          AnimSliderWidget(2,slider),
          AnimSliderWidget(1,slider),
          Center(
            child: FlatButton(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                      child: Text(
                    "Добавить в Корзину",
                    style: TextStyle(color: Colors.white),
                  ))),
              color: Color.fromRGBO(163, 8, 11, 1),
              onPressed: () {
                price = price + CDATA[0][slider[0]].price;
                price = price + CDATA[4][slider[1]].price;
                price = price + CDATA[3][slider[2]].price;
                price = price + CDATA[4][slider[3]].price;
                price = price + CDATA[2][slider[4]].price;
                price = price + CDATA[1][slider[5]].price;
                showTransactionConfirm();
              },
            ),
          ),
          SizedBox(
            height: 15,
          )
        ]),
      ),
    ]);
  }
}
