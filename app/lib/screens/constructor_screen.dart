import 'package:flutter/material.dart';
import 'package:inaiburger/models/crazy_burger.dart';
import '../models/component_images.dart';

class ConstructorScreen extends StatefulWidget {
  @override
  _ConstructorScreenState createState() => _ConstructorScreenState();
}

class _ConstructorScreenState extends State<ConstructorScreen> {
  int price = 0;
  int img1 = 0;
  int img2 = 0;
  int img3 = 0;
  int img4 = 0;
  int img5 = 0;
  int img6 = 0;
  Map<String, int> customBurger = {};
  double hgt = 80;
  List data = [
    componentsBuntop,
    componentsTom,
    componentsMeat,
    componentsChe,
    componentsMeat,
    componentsBunbot,
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);
    slider['img1'] = img1;
    slider['img2'] = img2;
    slider['img3'] = img3;
    slider['img4'] = img4;
    slider['img5'] = img5;
    slider['img6'] = img6;
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: InkWell(
                        onTap: () {
                          showComponents(0, componentImages.length);
                        },
                        child: Image.asset(
                          componentImages[slider['img1']],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showComponents(1, componentImagesLettuce.length);
                      },
                      child:
                          Image.asset(componentImagesLettuce[slider['img2']]),
                    ),
                    InkWell(
                      onTap: () {
                        showComponents(2, componentImagesMeat.length);
                      },
                      child: Image.asset(componentImagesMeat[slider['img3']]),
                    ),
                    InkWell(
                      onTap: () {
                        showComponents(3, componentImagesGar.length);
                      },
                      child: Image.asset(componentImagesGar[slider['img4']]),
                    ),
                    InkWell(
                      onTap: () {
                        showComponents(4, componentImagesMeat2.length);
                      },
                      child: Image.asset(componentImagesMeat2[slider['img5']]),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: InkWell(
                        onTap: () {
                          showComponents(5, componentImagesBunbot.length);
                        },
                        child: Image.asset(
                          componentImagesBunbot[slider['img6']],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(),
                    FlatButton(
                      child: Text(
                        'Добавить в Корзину',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color.fromRGBO(163, 8, 11, 1),
                      onPressed: () {
                        print(slider);
                        showTransactionConfirm();
                      },
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          ))
    ]);
  }

  showTransactionConfirm() {
    print(data[slider["img1"]][slider["img1"]].price);
    List prices = [];
    prices.add(data[0][slider["img1"]].price);
    prices.add(data[1][slider["img2"]].price);
    prices.add(data[2][slider["img3"]].price);
    prices.add(data[3][slider["img4"]].price);
    prices.add(data[4][slider["img5"]].price);
    prices.add(data[5][slider["img6"]].price);
    int sum = prices.reduce((a, b) => a + b);

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

  showComponents(int inkIndex, int itemC) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 300),
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
                                          case 1:
                                            img2 = index;
                                            break;
                                          case 2:
                                            img3 = index;
                                            break;
                                          case 3:
                                            img4 = index;
                                            break;
                                          case 4:
                                            img5 = index;
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
                                Text(data[inkIndex][index].title),
                              ]),
                        );
                      },
                      itemCount: itemC)),
            ),
          );
        });
  }
}
