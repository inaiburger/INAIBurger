import 'package:flutter/material.dart';
import 'package:inaiburger/models/component_images.dart';

class NewsScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    // _makePostRequest();
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: dummynews.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print('Card:  $card');
                  // Navigator.of(context)
                  //         .pushNamed('/detail_news', arguments: index);
                },
                child: Card(
                  child: Column(children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(1),
                              topRight: Radius.circular(1)),
                          child: Image.asset(
                            '${dummynews[index][1]}',
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                            height: 180,
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Stack(children: <Widget>[
                              Text(
                                dummynews[index][0],
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 18,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 1.5
                                    ..color = Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                dummynews[index][0],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Color.fromRGBO(163, 8, 11, 1),
                          ),
                          Icon(Icons.favorite_border,
                              color: Color.fromRGBO(163, 8, 11, 1))
                        ],
                      ),
                    )
                  ]),
                ),
              );
            }));
  }
}
