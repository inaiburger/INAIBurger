// import 'package:flutter/material.dart';
// import 'package:inaiburger/screens/slider.dart';

// class CustomConstructor extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Image.asset(
//         'assets/images/background.png',
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         fit: BoxFit.fill,
//       ),
//       Scaffold(
//           appBar: AppBar(
//             title: Text("Make Crazy Burger"),
//             backgroundColor: Color.fromRGBO(163, 8, 11, 1),
//           ),
//           backgroundColor: Colors.transparent,
//           body: Center(
//             child: Container(
//               // width: MediaQuery.of(context).size.width * 1,
//               child: ListView(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 20,
//                   ),
//                   AnimSliderWidget(0),
//                   ListView.builder(
//                     physics: ScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 2,
//                     itemBuilder: (BuildContext context, int index) {
//                       return AnimSliderWidget(1);
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       IconButton(
//                         icon: Icon(
//                           Icons.remove_circle,
//                           size: 35,
//                           color: Color.fromRGBO(163, 8, 11, 1),
//                         ),
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.add_circle,
//                           size: 35,
//                           color: Color.fromRGBO(163, 8, 11, 1),
//                         ),
//                         onPressed: () {},
//                       ),
//                       FlatButton(
//                         child: Text("Debug"),
//                         onPressed: () {},
//                       )
//                     ],
//                   ),
//                   AnimSliderWidget(4),
//                   Center(
//                     child: FlatButton(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.6,
//                         child: Center(
//                           child: Text(
//                             'Add to cart',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       onPressed: () {},
//                       color: Color.fromRGBO(163, 8, 11, 1),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   )
//                 ],
//               ),
//             ),
//           ))
//     ]);
//   }
// }
