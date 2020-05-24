import 'package:flutter/material.dart';
import 'package:inaiburger/models/crazy_burger.dart';
import 'package:inaiburger/screens/cart_screen.dart';
import '../models/component_images.dart';

class CrazyConstructorScreen extends StatefulWidget {
  @override
  _CrazyConstructorScreenState createState() => _CrazyConstructorScreenState();
}

class _CrazyConstructorScreenState extends State<CrazyConstructorScreen> {
  int img1 = 0;
  int img6 = 0;
  int number = -1;

  List<int> integers = [];
  List<int> prices = [];
  Map<String, int> customBurger = {
    'img1': 1,
    'img6': 1,
  };
  List<int> integers2 = [];
  Map<int, int> mapId = {
    0: 0,
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
    8: 0,
    9: 0,
  };
  List<List> lists = [
    componentImagesMeat,
    componentImagesLettuce,
    componentImagesGar
  ];
  List componenty = [componentsMeat, componentsTom, componentsChe];

  @override
  Widget build(BuildContext context) {
    customBurger['img1'] = img1;
    customBurger['img6'] = img6;
    return Stack(children: <Widget>[
      Image.asset(
        'assets/images/background.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
            title: Text("Сделай свой Бургер"),
            backgroundColor: Color.fromRGBO(163, 8, 11, 1),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Image.asset(componentImages[customBurger['img1']],
                        fit: BoxFit.contain),
                    onTap: () {
                      showComponents(0, componentImages.length);
                    },
                  ),
                  if (integers.isNotEmpty)
                    ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: integers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child:
                              Image.asset(lists[integers[index]][mapId[index]]),
                          onTap: () {
                            showAddedComponents([
                              integers[index],
                              integers2[index],
                              lists[integers[index]].length
                            ]);
                            print(integers[index]);
                            print(integers2[index]);
                            print(lists[integers[index]].length);
                          },
                        );
                      },
                    )
                  else
                    Container(
                      height: 10,
                    ),
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
                          setState(() {
                            if (number <= -1) {
                              number = -1;
                            } else {
                              number--;
                              addToCart.remove(integers2[integers2.length - 1]);
                              integers.removeLast();
                              integers2.removeLast();
                            }
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
                          integers2.length >= 9
                              ? showAlert(context)
                              : _asyncSimpleDialog(context);
                        },
                      ),
                      // FlatButton(
                      //   child: Text("Debug"),
                      //   onPressed: () {
                      //     print('integers: $integers');
                      //     print('integers2: $integers2');
                      //     print('map: $mapId');
                      //     print('number: $number');
                      //     print('cart: $addToCart');
                      //   },
                      // )
                    ],
                  ),
                  InkWell(
                    child: Image.asset(
                      componentImagesBunbot[customBurger['img6']],
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      showComponents(5, componentImagesBunbot.length);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // addToCart[10] = img1;
                      // integers2.forEach((f) {
                      //   setState(() {
                      //     addToCart[f] = mapId[f];
                      //   });
                      // });

                      // card.add('CrazyBurger');
                      // print(addToCart);
                      print(card);
                      print(integers);
                      print(integers2);
                      integers2.isNotEmpty
                          ? showTransactionConfirm()
                          : print("add ingreds");
                    },
                    color: Color.fromRGBO(163, 8, 11, 1),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ))
    ]);
  }

  showTransactionConfirm() {
    for (int i = 0; i < integers2.length; i++) {
      prices.add(componenty[integers[i]][mapId[i]].price);
    }
    int sum = prices.reduce((a, b) => a + b);
    sum = sum + CDATA[0][img1].price * 2;

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
                        'Всего:   $sum сом',
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FlatButton(
                              color: Colors.red[300],
                              child: Text(
                                'Отмена',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                prices.clear();
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              color: Colors.red[300],
                              child: Text('Принять',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                cart[ints[countCustomBurgers]] = sum;
                                card.add(ints[countCustomBurgers]);
                                burgerIdimages[ints[countCustomBurgers]] = [
                                  'assets/burger.png',
                                  sum,
                                  1
                                ];
                                // allBurgers[countCustomBurgers] = addToCart;
                                countCustomBurgers++;
                                print(countCustomBurgers);
                                Navigator.pop(context);
                                Navigator.pop(context);

                                integers.clear();
                                integers2.clear();
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

  Future showAlert(BuildContext context) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Лимит"),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                return Navigator.pop(context);
              },
            ),
            FlatButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                child: Text('ok'))
          ],
        ));
  }

  Future _asyncSimpleDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Выберите ингредиент'),
            children: <Widget>[
              Container(
                  height: 100,
                  width: 200,
                  child: Ink.image(
                    image: AssetImage(CDATA[4][0].imageUrl),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          integers.add(0);
                          number++;
                          integers2.add(number);
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
                          integers.add(1);
                          number++;
                          integers2.add(number);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )),
              Container(
                  height: 100,
                  width: 200,
                  child: Ink.image(
                    image: AssetImage(componentImagesGar[0]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          integers.add(2);
                          number++;
                          integers2.add(number);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  )),
            ],
          );
        });
  }

  showAddedComponents(List<int> intList) {
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
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33,
              padding: EdgeInsets.all(10),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      List imageList;
                      imageList = lists[intList[0]];
                      return Material(
                        color: Colors.transparent,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                child: InkWell(
                                  child: Image.asset(
                                    imageList[index],
                                    fit: BoxFit.contain,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      intList[0] = index;
                                      mapId[integers2[intList[1]]] = intList[0];
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                width: 200,
                              ),
                              Text(componenty[intList[0]][index].title),
                            ]),
                      );
                    },
                    itemCount: intList[2],
                  )),
            ),
          );
        });
  }

  showComponents(int inkIndex, int length) {
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
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33,
              padding: EdgeInsets.all(10),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        List imageList;
                        switch (inkIndex) {
                          case 0:
                            imageList = componentImages;
                            break;

                          case 5:
                            imageList = componentImagesBunbot;
                            break;
                          default:
                        }
                        return Material(
                          color: Colors.transparent,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    child: Image.asset(
                                      imageList[index],
                                      fit: BoxFit.contain,
                                    ),
                                    onTap: () {
                                      print('inkIndex: $inkIndex');
                                      setState(() {
                                        switch (inkIndex) {
                                          case 0:
                                            img1 = index;
                                            img6 = index;
                                            break;

                                          case 5:
                                            img6 = index;
                                            img1 = index;
                                            break;
                                          default:
                                        }
                                        inkIndex = index;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  width: 200,
                                ),
                                Text(CDATA[0][index].title),
                              ]),
                        );
                      },
                      itemCount: length)),
            ),
          );
        });
  }
}
