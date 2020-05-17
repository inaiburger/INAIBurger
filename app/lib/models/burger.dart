import 'package:flutter/foundation.dart';

class Burger {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> description;
  final int price;

  const Burger({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.price,
  });
}

class Component{
  final String id;
  final String title;
  final List list;

  const Component({
    @required this.id,
    @required this.title,
    @required this.list
  });
}
