import 'package:flutter/material.dart';

List<String> historyName = [];
List<int> historyPrice = [];

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(163, 8, 11, 1),
        centerTitle: true,
        title: Text('Заказы'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return Card(
            elevation: 8,
            margin: EdgeInsets.all(8),
            child: Container(
                padding: EdgeInsets.all(15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    child: Text(
                      '${historyName[index]}:  ${historyPrice[index]} som',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Icon(Icons.access_time)
                ])),
          );
        },
        itemCount: historyPrice.length,
      ),
    );
  }
}
