import 'package:flutter/material.dart';

class BurgerItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> description;
  final int price;
  final Function selectItem;

  BurgerItem(
      { this.id,
      @required this.selectItem,
      @required this.title,
      @required this.imageUrl,
       this.description,
       this.price});

  void selectBurger(BuildContext context) {
    Navigator.pushNamed(context, '/detail', arguments: id).then((result) {
      if (result != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRect(
                  child: Center(
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            Text(title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
      splashColor: Colors.orange,
    );
  }
}
