import 'package:flutter/material.dart';
import '../models/component_images.dart';

class CrazyConstructorScreen extends StatefulWidget {
  @override
  _CrazyConstructorScreenState createState() => _CrazyConstructorScreenState();
}

class _CrazyConstructorScreenState extends State<CrazyConstructorScreen> {
  int img1 = 0;
  int img6 = 0;
  int number = -1;
  Map<String, int> customBurger = {
    'img1': 1,
    'img6': 1,
  };
  List<int> integers = [];
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
  Map addToCart = {};
  List<List> lists = [
    componentImagesMeat,
    componentImagesLettuce,
    componentImagesGar
  ];

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
            title: Text("Make Crazy Burger"),
            backgroundColor: Color.fromRGBO(163, 8, 11, 1),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Ink.image(
                        image:
                            AssetImage(componentImages[customBurger['img1']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(0);
                          },
                        ),
                      )),
                  if (integers.isNotEmpty)
                    ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: integers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 90,
                          child: Center(
                              child: Ink.image(
                            image: AssetImage(
                                lists[integers[index]][mapId[index]]),
                            fit: BoxFit.fitWidth,
                            child: InkWell(
                              onTap: () {
                                print(
                                    '${integers[index]}, ${integers2[index]}');
                                showAddedComponents(
                                    integers[index], integers2[index]);
                              },
                            ),
                          )),
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
                              addToCart.remove(integers2[integers2.length-1]);
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
                      FlatButton(
                        child: Text("Debug Print"),
                        onPressed: () {
                          print('integers: $integers');
                          print('integers2: $integers2');
                          print('map: $mapId');
                          print('number: $number');
                          print('cart: $addToCart');
                        },
                      )
                    ],
                  ),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Ink.image(
                        image: AssetImage(
                            componentImagesBunbot[customBurger['img6']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(5);
                          },
                        ),
                      )),
                  FlatButton(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      addToCart[10]=img1;
                      integers2.forEach((f) {
                        setState(() {
                          addToCart[f] = mapId[f];
                          
                        });
                      });
                      card.add('CrazyBurger');
                      print(addToCart);
                      print(card);
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

  Future showAlert(BuildContext context) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Влезет????"),
          actions: <Widget>[
            FlatButton(
              child: Text('Нет, прошу прощения'),
              onPressed: () {
                return Navigator.pop(context);
              },
            ),
            FlatButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                child: Text('Сори'))
          ],
        ));
  }

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

  showAddedComponents(inkIndex, inkIndex2) {
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
                            imageList = lists[inkIndex];
                            break;
                          case 1:
                            imageList = lists[inkIndex];
                            break;
                          case 2:
                            imageList = lists[inkIndex];
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
                                      setState(() {
                                        inkIndex = index;
                                        mapId[integers2[inkIndex2]] = inkIndex;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  width: 200,
                                ),
                                Text("Burger cheto cheto vse vy lohi"),
                              ]),
                        );
                      },
                      itemCount: 5)),
            ),
          );
        });
  }

  showComponents(inkIndex) {
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
                  // image: DecorationImage(
                  //   image: new ExactAssetImage('assets/images/burger3.png'),
                  //   fit: BoxFit.fitWidth,
                  //   colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop)
                  // ),
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
                          case 1:
                            imageList = componentImagesLettuce;
                            break;
                          case 2:
                            imageList = componentImagesMeat;
                            break;
                          case 3:
                            imageList = componentImagesGar;
                            break;
                          case 4:
                            imageList = componentImagesMeat2;
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
                                Text("Burger cheto cheto vse vy lohi"),
                              ]),
                        );
                      },
                      itemCount: 5)),
            ),
          );
        });
  }
}
