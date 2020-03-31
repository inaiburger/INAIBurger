import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            width: double.infinity,
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      burgerItem(),
                      burgerItem(),
                      burgerItem(),
                      burgerItem(),
                      burgerItem(),
                      burgerItem(),
                      burgerItem(),
                      burgerItem(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget burgerItem() {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRect(
                child: Image.asset(
                  'assets/burger.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Center(
                    child: Text(
                      'Burger',
                      style: TextStyle(
                          color: Colors.white,

                          ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
    onTap: () {
      print('object');
    },
    splashColor: Colors.orange,
  );
}
