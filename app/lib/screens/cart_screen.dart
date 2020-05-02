import 'package:flutter/material.dart';
import '../models/component_images.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

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
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            burgerIdimages['${card[index]}'][0].toString(),
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
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black54)),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          color: Colors.black38,
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
                                            width: 30,
                                            child: Center(
                                                child: Text(
                                                    '${burgerIdimages[card[index]][2]}'))),
                                        Container(
                                          color: Colors.black38,
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
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.4,
                //   child: Center(
                //     child: totalText()
                //     // Text(
                //     //   'Total:  $total\$',
                //     //   style: TextStyle(fontSize: 20),
                //     // ),
                //   ),
                // ),

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