import 'package:flutter/material.dart';
import 'package:inaiburger/dummy_data.dart';
import 'package:inaiburger/models/burger.dart';
import 'package:inaiburger/widgets/burger_item.dart';

class DashboardScreen extends StatelessWidget {
  final List<Burger> availableBurgers = DUMMY_BURGERS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Expanded(
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              children: List<Widget>.generate(availableBurgers.length, (index) {
                return BurgerItem(
                  imageUrl: availableBurgers[index].imageUrl,
                  title: availableBurgers[index].title,
                  selectItem: () {
                    Navigator.pushNamed(context, '/detail', arguments: [
                      index,
                      availableBurgers[index].price
                    ]);
                  },
                );
              }),
            ),
          ),
        ]));
  }
}
