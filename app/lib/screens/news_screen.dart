import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inaiburger/models/component_images.dart';
import 'package:inaiburger/models/newsapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

import 'news.dart';

class NewsScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<AllNews>>(
        future: lfetchData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? AllNewsList(lnews: snapshot.data)
              : Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     // _makePostRequest();
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: ListView.builder(
//             itemCount: dummynews.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   print('Card:  $card');
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (BuildContext context) => News()),
//                   );
//                 },
//                 child: Card(
//                   child: Column(children: <Widget>[
//                     Stack(
//                       children: <Widget>[
//                         ClipRRect(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(1),
//                               topRight: Radius.circular(1)),
//                           child: Image.asset(
//                             '${dummynews[index][1]}',
//                             width: double.infinity,
//                             fit: BoxFit.fitWidth,
//                             height: 180,
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 1,
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 30),
//                             child: Stack(children: <Widget>[
//                               Text(
//                                 dummynews[index][0],
//                                 style: TextStyle(
//                                   fontFamily: 'Varela',
//                                   fontSize: 18,
//                                   foreground: Paint()
//                                     ..style = PaintingStyle.stroke
//                                     ..strokeWidth = 1.5
//                                     ..color = Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 dummynews[index][0],
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'Varela',
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ]),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           Icon(
//                             Icons.star_border,
//                             color: Color.fromRGBO(163, 8, 11, 1),
//                           ),
//                           Icon(Icons.favorite_border,
//                               color: Color.fromRGBO(163, 8, 11, 1))
//                         ],
//                       ),
//                     )
//                   ]),
//                 ),
//               );
//             }));
//   }
// }

class AllNewsListScreen extends StatelessWidget {
  AllNewsListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<AllNews>>(
        future: lfetchData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? AllNewsList(lnews: snapshot.data)
              : Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}

class AllNewsList extends StatefulWidget {
  final List<AllNews> lnews;
  const AllNewsList({Key lkey, this.lnews}) : super(key: lkey);
  @override
  _AllNewsListState createState() => _AllNewsListState();
}

class _AllNewsListState extends State<AllNewsList> {
  bool isLoaded = false;

  @override
  void initState() {
    loadShared();
    super.initState();
  }

  void loadShared() async {
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? ListView.builder(
            itemCount: widget.lnews.length,
            itemBuilder: (context, index) {
              var langTitleRu = '${widget.lnews[index].title}';
              return Column(children: [
                Card(
                  elevation: 15,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                      splashColor: Color.fromRGBO(163, 8, 11, 1),
                      onTap: () {
                        Navigator.pushNamed(context, '/detailNews', arguments: [
                          widget.lnews[index].title,widget.lnews[index].content
                        ]);
                        
                      },
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              langTitleRu,
                              style: TextStyle(fontSize: 18),
                            )),
                        Divider(
                          color: Colors.black45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.date_range),
                            Text('${(widget.lnews[index].created)}'),
                          ],
                        )
                      ])),
                ),
              ]);
            })
        : CupertinoActivityIndicator();
  }
}
