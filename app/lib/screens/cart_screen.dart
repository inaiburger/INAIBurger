import 'package:flutter/material.dart';
import '../models/component_images.dart';
import 'history.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

List<List> imagelists = [
  componentImagesMeat,
  componentImagesLettuce,
  componentImagesGar
];

class _CartScreenState extends State<CartScreen> {
  int total = 0;
  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Нет'),
              onPressed: () {
                return Navigator.pop(context);
              },
            ),
            FlatButton(
                onPressed: () {
                  setState(() {
                      card.clear();
                      cart.clear();
                      burgerIdimages = {
                        'Toasty Buns Burgers': [
                          'assets/images/burger1.png',
                          250,
                          1
                        ],
                        'Backyard Burgers': [
                          'assets/images/burger2.png',
                          300,
                          1
                        ],
                        'Beefcakes Burgers': [
                          'assets/images/burger3.png',
                          180,
                          1
                        ],
                        'Buzz Burgers': ['assets/images/burger4.png', 150, 1],
                        'Buffalo Burgers': [
                          'assets/images/burger6.png',
                          350,
                          1
                        ],
                        'Knuckle Burger': ['assets/images/burger7.png', 500, 1],
                        'CrazyBurger': ['assets/images/burger9.jpg', 1111, 1]
                      };
                      countCustomBurgers = 0;
                    });
                  return Navigator.pop(context);
                },
                child: Text('Да'))
          ],
        ));
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
                        'Total:   $total som',
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
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              color: Colors.red[300],
                              child: Text('Accept',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
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
    if (card.isEmpty) {
      return Column(children: [
        FlatButton(
          child: Icon(Icons.history),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => History()),
            );
          },
        ),
        SizedBox(height: 100,),
        Center(
          child: Text(
            'Пусто',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ]);
    } else {
      return Column(children: <Widget>[
        // FlatButton(
        //   child: Text('Debug Print'),
        //   onPressed: () {
        //     print("card: $card");
        //     print("cart: $cart");
        //     // print("burgerIdimages; $burgerIdimages");
        //     print("countCustomBurgers: $countCustomBurgers");
        //     print("AllBurgers : $allBurgers");
        //   },
        // ),
        FlatButton(
          child: Text("Заказы"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => History()),
            );
          },
        ),
        Expanded(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: card.length,
              itemBuilder: (context, index) {
                transaction.add(burgerIdimages[card[index]][1] *
                    burgerIdimages[card[index]][2]);
                List rev = transaction.reversed.toList();
                List newRev = rev.sublist(0, index + 1).toList();
                int sum = 0;
                for (int e in newRev) {
                  sum += e;
                }
                total = sum;
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      
                          Container(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              burgerIdimages[card[index]][0],
                              fit: BoxFit.contain,
                            ),
                          ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(8),
                                  child: burgerIdimages[card[index]][0] ==
                                          'assets/burger.png'
                                      ? Text("Свой бургер $index")
                                      : Text("${card[index]}")),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  card[index] == int
                                      ? Text(cart[index])
                                      : Text(
                                          '${burgerIdimages[card[index]][1]} som',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black45),
                                        ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Color.fromRGBO(163, 8, 11, 1),
                                    ),
                                    onPressed: () {
                                      // _showAlert(context,
                                      //     'Do you want to delete?', index);
                                    },
                                  ),
                                  Container(
                                    height: 30,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6))),
                                          width: 30,
                                          height: 30,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.remove,
                                              size: 18,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (burgerIdimages[card[index]]
                                                        [2] <=
                                                    1) {
                                                  return;
                                                } else {
                                                  burgerIdimages[card[index]]
                                                      [2]--;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                            width: 20,
                                            child: Center(
                                                child: Text(
                                                    '${burgerIdimages[card[index]][2]}'))),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6))),
                                          width: 30,
                                          height: 30,
                                          child: InkWell(
                                            child: Icon(
                                              Icons.add,
                                              size: 18,
                                            ),
                                            onTap: () {
                                              setState(() {
                                                burgerIdimages[card[index]]
                                                    [2]++;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        Card(
          elevation: 8,
          child: Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          'Удалить',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                  color: Color.fromRGBO(163, 8, 11, 1),
                  onPressed: () {
                    _showAlert(context,"Удалить всё?");
                    
                  },
                ),
                FlatButton(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          'Заказать',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                  color: Color.fromRGBO(163, 8, 11, 1),
                  onPressed: () {
                    showTransactionConfirm();
                  },
                ),
              ],
            ),
          ),
        ),
      ]);
    }
  }
}
