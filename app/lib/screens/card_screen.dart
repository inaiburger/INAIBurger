import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int img1 = 0;
  int img2 = 1;
  int img3 = 2;
  int img4 = 3;
  int img5 = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Ink.image(
                    image: AssetImage(componentImagesMeat[img1]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        showComponents(0);
                      },
                    ),
                  )),
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Ink.image(
                    image: AssetImage(componentImagesMeat[img2]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        showComponents(1);
                      },
                    ),
                  )),
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Ink.image(
                    image: AssetImage(componentImagesMeat[img3]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        showComponents(2);
                      },
                    ),
                  )),
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Ink.image(
                    image: AssetImage(componentImagesMeat[img4]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        showComponents(3);
                      },
                    ),
                  )),
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Ink.image(
                    image: AssetImage(componentImagesMeat[img5]),
                    fit: BoxFit.contain,
                    child: InkWell(
                      onTap: () {
                        showComponents(4);
                      },
                    ),
                  )),
            ],
          ),
        ));
  }

  List<String> componentImages = [
    'assets/buntop.png',
    'assets/images/lettuce.png',
    'assets/images/tomato.png',
    'assets/images/meat.png',
    'assets/bunbot.png'
  ];
  List<String> componentImagesLettuce = [
    'assets/images/lettuce.png',
    'assets/images/green2.png',
    'assets/images/green3.png',
    'assets/images/green4.png',
  ];
  List<String> componentImages3 = [];

  List<String> componentImagesMeat = [
    'assets/images/meat.png',
    'assets/images/meat2.png',
    'assets/images/meat3.png',
    'assets/images/beckon.png',
    'assets/images/beckon2.png',
    'assets/images/chicken.png',
  ];
  List<String> componentImagesBunbot = [

  ];

  showComponents(inkIndex) {
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
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Material(
                        color: Colors.black,
                        child: Container(
                          child: InkWell(
                            child: Image.asset(
                              componentImagesMeat[index],
                              fit: BoxFit.contain,
                            ),
                            onTap: () {
                              setState(() {
                                switch (inkIndex) {
                                  case 0:
                                    img1 = index;
                                    break;
                                  case 1:
                                    img2 = index;
                                    break;
                                  case 2:
                                    img3 = index;
                                    break;
                                  case 3:
                                    img4 = index;
                                    break;
                                  case 4:
                                    img5 = index;
                                    break;
                                  default:
                                }
                                inkIndex = index;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 200,
                        ),
                      );
                    },
                    itemCount: componentImagesMeat.length,
                  )),
            ),
          );
        });
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Text(('data')),
    );
  }
}
// Widget productsList(int plIndex) {
//   return ListView.builder(
//     physics: BouncingScrollPhysics(),
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//       return Material(
//         color: Colors.black,
//         child: Container(
//           child: InkWell(
//             child: Image.asset(
//               componentImages[index],
//               fit: BoxFit.contain,
//             ),
//             onTap: () {
//               setState(() {
//                 plIndex = index;
//               });
//               Navigator.of(context).pop();
//             },
//           ),
//           margin: const EdgeInsets.symmetric(horizontal: 8),
//           width: 200,
//         ),
//       );
//     },
//     itemCount: componentImages.length,
//   );
// }

// Widget products(String assetImage) {
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     physics: ClampingScrollPhysics(),
//     child: Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(height: 10),
//           // ListView.builder(
//           //   scrollDirection: Axis.horizontal,
//           //   itemBuilder: (context, index) {
//           //     return Container(
//           //       child: Image.asset(componentImages[index]),
//           //       margin: const EdgeInsets.symmetric(horizontal: 8),
//           //       width: 100,
//           //     );
//           //   },
//           //   itemCount: componentImages.length,
//           // ),
//           Container(
//             height: 100,
//             child: PageView(
//               controller: PageController(viewportFraction: 0.8),
//               scrollDirection: Axis.horizontal,
//               pageSnapping: true,
//               children: <Widget>[
//                 Container(
//                   child: Image.asset(assetImage),
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   width: 100,
//                 ),
//                 Container(
//                   child: Image.asset(assetImage),
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   width: 100,
//                 ),
//                 Container(
//                   child: Image.asset(assetImage),
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   width: 100,
//                 ),
//                 Container(
//                   child: Image.asset(assetImage),
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   width: 100,
//                 ),
//                 Container(
//                   child: Image.asset(assetImage),
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   width: 100,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//   Widget productsBun() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       physics: ClampingScrollPhysics(),
//       child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(height: 10),
//             Container(
//               height: 100,
//               child: PageView(
//                 controller: PageController(viewportFraction: 0.8),
//                 scrollDirection: Axis.horizontal,
//                 pageSnapping: true,
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     color: Colors.redAccent,
//                     width: 100,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     color: Colors.blueAccent,
//                     width: 100,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     color: Colors.greenAccent,
//                     width: 100,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     color: Colors.yellow,
//                     width: 100,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     color: Colors.purpleAccent,
//                     width: 100,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
