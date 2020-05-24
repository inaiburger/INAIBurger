import 'package:flutter/material.dart';
import 'package:inaiburger/models/crazy_burger.dart';
import 'package:inaiburger/screens/slider.dart';
import '../models/component_images.dart';

class CrazyCustomBurger extends StatefulWidget {
  @override
  _CrazyCustomBurgerState createState() => _CrazyCustomBurgerState();
}

class _CrazyCustomBurgerState extends State<CrazyCustomBurger> {
  int classicBurgerCount = 0;
  List<AnimSliderWidget> widgets = [];
  int price = 0;
  Future _asyncSimpleDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Ingredient '),
            children: <Widget>[
              Container(
                  height: 100,
                  width: 200,
                  child: Ink.image(
                    image: AssetImage(componentImagesMeat[0]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widgets.add(AnimSliderWidget(4,crslider));
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )),
              Container(
                  height: 100,
                  width: 200,
                  child: Ink.image(
                    image: AssetImage(componentImagesLettuce[0]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widgets.add(AnimSliderWidget(2,crslider));
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )),
              Container(
                  height: 100,
                  width: 200,
                  child: Ink.image(
                    image: AssetImage(componentImagesGar[2]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widgets.add(AnimSliderWidget(3,crslider));
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )),
            ],
          );
        });
  }

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
          title: Text('Contacts'),
          backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        ),
        backgroundColor: Colors.transparent,
        body: ListView(children: <Widget>[
          AnimSliderWidget(0,crslider),
          ...widgets,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  size: 35,
                  color: Color.fromRGBO(163, 8, 11, 1),
                ),
                onPressed: () {
                  print(crslider);
                  setState(() {
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.add_circle,
                  size: 35,
                  color: Color.fromRGBO(163, 8, 11, 1),
                ),
                onPressed: () {
                  _asyncSimpleDialog(context);
                },
              ),
            ],
          ),
          AnimSliderWidget(1,crslider),
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
        ]),
      ),
    ]);
  }
}
