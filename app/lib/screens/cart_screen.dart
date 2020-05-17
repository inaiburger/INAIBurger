import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import '../models/component_images.dart';

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
  Future _showAlert(BuildContext context, String message, int index) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                return Navigator.pop(context);
              },
            ),
            FlatButton(
                onPressed: () {
                  setState(() {
                    card.remove('${card[index]}');
                    addToCart.clear();
                    columnSuper.clear();
                    print(addToCart);
                  });
                  return Navigator.pop(context);
                },
                child: Text('Yes'))
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
      return Center(
        child: Text(
          'Empty',
          style: TextStyle(fontSize: 50),
        ),
      );
    } else {
      return Column(children: <Widget>[
        FlatButton(
          child: Text('Debug Print'),
          onPressed: () => print(card),
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
                        if ('${card[index]}' == 'CrazyBurger')
                          Container(
                              width: 80,
                              child: ColumnSuper(
                                innerDistance: -17,
                                invert: true,
                                children: columnSuper,
                              ))
                        else
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
                                child: Text('${card[index]}'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    '${burgerIdimages[card[index]][1]} som',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black45),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Color.fromRGBO(163, 8, 11, 1),
                                    ),
                                    onPressed: () {
                                      _showAlert(context,
                                          'Do you want to delete?', index);
                                    },
                                  ),
                                  Container(
                                    height: 30,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black38,borderRadius: BorderRadius.all(Radius.circular(6))
                                          ),
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
                                            color: Colors.black38,borderRadius: BorderRadius.all(Radius.circular(6))
                                          ),
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
                          'Delete all',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                  color: Color.fromRGBO(163, 8, 11, 1),
                  onPressed: () {
                    setState(() {
                      card.clear();
                    });
                  },
                ),
                FlatButton(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Text(
                          'Buy',
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
