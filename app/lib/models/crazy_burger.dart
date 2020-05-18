import 'package:flutter/material.dart';

class CrazyBurger {
  final String id;
  final String title;
  final String imageUrl;
  final int price;

  CrazyBurger(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.price});
}

class Component {
  final String imageUrl;
  final int price;
  final String title;
  const Component({this.imageUrl, this.price, this.title});
}

const List<Component> componentsBuntop = [
  Component(
      imageUrl: 'assets/images/buntop.png', price: 5, title: "Белая булочка"),
  Component(
      imageUrl: 'assets/images/buntop2.png',
      price: 10,
      title: "Черная булочка"),
];
const List<Component> componentsBunbot = [
  Component(
      imageUrl: 'assets/images/bunbot.png', price: 5, title: "Белая булочка"),
  Component(
      imageUrl: 'assets/images/bunbot2.png',
      price: 10,
      title: "Черная булочка"),
];
const List<Component> componentsTom = [
  Component(imageUrl: 'assets/images/lettuce.png', price: 5, title: "Салат"),
  Component(imageUrl: 'assets/images/tomato.png', price: 5, title: "Томаты"),
  Component(imageUrl: 'assets/images/ing-perb.png', price: 5, title: "Перец"),
  Component(imageUrl: 'assets/images/ing-marog.png', price: 5, title: "Огурцы"),
  Component(imageUrl: 'assets/images/ing-luk.png', price: 5, title: "Лук"),
];
const List<Component> componentsChe = [
  Component(
      imageUrl: 'assets/images/slicecheese.png',
      price: 20,
      title: "Плавленный сыр"),
  Component(
      imageUrl: 'assets/images/cheese-dor.png',
      price: 20,
      title: "Сып Мацарелла"),
  Component(imageUrl: 'assets/images/ing-yaco.png', price: 15, title: "Яйцо"),
];
const List<Component> componentsMeat = [
  Component(
      imageUrl: 'assets/images/meat5.png', price: 150, title: "Говяжий стейк"),
  Component(
      imageUrl: 'assets/images/coutlet-gov.png',
      price: 130,
      title: "Говяжья котлета"),
  Component(
      imageUrl: 'assets/images/steyk-indeyka.png',
      price: 120,
      title: "Стейк индейки"),
  Component(
      imageUrl: 'assets/images/coutlet-losos.png',
      price: 200,
      title: "Котлета из лосося"),
  Component(imageUrl: 'assets/images/meat2.png', price: 150, title: "Баранина"),
];

const CDATA = [
  componentsBuntop,
  componentsBunbot,
  componentsTom,
  componentsChe,
  componentsMeat
];
