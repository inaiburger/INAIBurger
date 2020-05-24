import 'package:flutter/material.dart';

List<String> componentImages = [
  'assets/images/buntop.png',
  'assets/images/buntop2.png',
];
List<String> componentImagesBunbot = [
  'assets/images/bunbot.png',
  'assets/images/bunbot2.png',
];
List<String> componentImagesLettuce = [
  'assets/images/lettuce.png',
  'assets/images/tomato.png',
  'assets/images/ing-perb.png',
  'assets/images/ing-marog.png',
  'assets/images/ing-luk.png',
];
List<String> componentImagesGar = [
  'assets/images/slicecheese.png',
  'assets/images/cheese-dor.png',
  'assets/images/ing-yaco.png',
];
List<String> componentImagesMeat = [
  'assets/images/meat5.png',
  'assets/images/coutlet-gov.png',
  'assets/images/steyk-indeyka.png',
  'assets/images/coutlet-losos.png',
  'assets/images/meat2.png',
];
List<String> componentImagesMeat2 = [
  'assets/images/meat5.png',
  'assets/images/coutlet-gov.png',
  'assets/images/steyk-indeyka.png',
  'assets/images/coutlet-losos.png',
  'assets/images/meat2.png',
];

List dummyburgers = [
  [
    'Toasty Buns Burgers',
    'assets/images/burger1.png',
    250,
    'detail of burger 1 detail of burger 1 detail of burger 1 detail of burger 1 detail of burger 1 detail of burger 1 '
  ],
  [
    'Backyard Burgers',
    'assets/images/burger2.png',
    300,
    'detail of burger 2 detail of burger 2 detail of burger 2 detail of burger 2 detail of burger 2 detail of burger 2 '
  ],
  [
    'Beefcakes Burgers',
    'assets/images/burger3.png',
    180,
    'detail of burger 3 detail of burger 3 detail of burger 3 detail of burger 3 detail of burger 3 detail of burger 3 '
  ],
  [
    'Buzz Burgers',
    'assets/images/burger4.png',
    150,
    'detail of burger 4 detail of burger 4 detail of burger 4 detail of burger 4 detail of burger 4 detail of burger 4 '
  ],
  [
    'Buffalo Burgers',
    'assets/images/burger6.png',
    350,
    'detail of burger 5 detail of burger 5 detail of burger 5 detail of burger 5 detail of burger 5 detail of burger 5 '
  ],
  [
    'Knuckle Burger',
    'assets/images/burger7.png',
    500,
    'detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 '
  ],
  [
    'Luger Burger',
    'assets/images/burger1.png',
    300,
    'detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 '
  ],
  [
    'The Lola Burger',
    'assets/images/burger3.png',
    180,
    'detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 detail of burger 6 '
  ],
];

List dummynews = [
  ['Самый вкусный Черный бургер от Бекболота', 'assets/images/burger9.jpg'],
  ['Самый вкусный Черный бургер от Бекболота', 'assets/images/burger2.png'],
  ['Самый вкусный Черный бургер от Бекболота', 'assets/images/burger9.jpg'],
  ['Самый вкусный Черный бургер от Бекболота', 'assets/images/burger9.jpg'],
  ['Самый вкусный Черный бургер от Бекболота', 'assets/images/burger9.jpg'],
  ['Самый вкусный Черный бургер от Бекболота', 'assets/images/burger9.jpg'],
  ['Самый вкусный Черный бургер от Бекболота', 'assets/images/burger9.jpg'],
];

List card = [];

Map burgerIdimages = {
  'Toasty Buns Burgers': ['assets/images/burger1.png', 250, 1],
  'Backyard Burgers': ['assets/images/burger2.png', 300, 1],
  'Beefcakes Burgers': ['assets/images/burger3.png', 180, 1],
  'Buzz Burgers': ['assets/images/burger4.png', 150, 1],
  'Buffalo Burgers': ['assets/images/burger6.png', 350, 1],
  'Knuckle Burger': ['assets/images/burger7.png', 500, 1],
  'CrazyBurger': ['assets/images/burger9.jpg', 320, 1]
};
List<int> transaction = [];

Map addToCart = {};
List<Widget> columnSuper = [];

Map slider = {
};
Map crslider = {
  0:0,
  1:0,
};
Map cart ={};
int countCustomBurgers = 0;
List<int> ints = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
List<int> integers = [];
Map<int,Map> allBurgers = {};