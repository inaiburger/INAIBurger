import 'package:flutter/material.dart';
import '../models/component_images.dart';

class ConstructorScreen extends StatefulWidget {
  @override
  _ConstructorScreenState createState() => _ConstructorScreenState();
}

class _ConstructorScreenState extends State<ConstructorScreen> {
  int img1 = 0;
  int img2 = 0;
  int img3 = 0;
  int img4 = 0;
  int img5 = 0;
  int img6 = 0;
  Map<String, int> customBurger = {
    'img1': 1,
    'img2': 1,
    'img3': 1,
    'img4': 1,
    'img5': 1,
    'img6': 1,
  };
  double hgt = 80;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(args);
    customBurger['img1'] = img1;
    customBurger['img2'] = img2;
    customBurger['img3'] = img3;
    customBurger['img4'] = img4;
    customBurger['img5'] = img5;
    customBurger['img6'] = img6;
    return Stack(children: <Widget>[
      Image.asset(
        'assets/images/background.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
            title: Text("Make Burger on your own"),
            backgroundColor: Color.fromRGBO(163, 8, 11, 1),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        showComponents(0);
                      },
                      child: Image.asset(componentImages[customBurger['img1']]),
                    ),
                    
                    InkWell(
                      onTap: (){
                        showComponents(1);
                      },
                      child: Image.asset(componentImagesLettuce[customBurger['img2']]),
                    ),
                    InkWell(
                      onTap: (){
                        showComponents(2);
                      },
                      child: Image.asset(componentImagesMeat[customBurger['img3']]),
                    ),
                    InkWell(
                      onTap: (){
                        showComponents(3);
                      },
                      child: Image.asset(componentImagesGar[customBurger['img4']]),
                    ),
                    InkWell(
                      onTap: (){
                        showComponents(4);
                      },
                      child: Image.asset(componentImagesMeat2[customBurger['img5']]),
                    ),
                    InkWell(
                      onTap: (){
                        showComponents(5);
                      },
                      child: Image.asset(componentImagesBunbot[customBurger['img6']]),
                    ),
                    SizedBox(height: 30,),
                    Divider(),
                    FlatButton(
                      child: Text(
                        'Add to card',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color.fromRGBO(163, 8, 11, 1),
                      onPressed: () {
                        print(customBurger);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ))
    ]);
  }

  showComponents(inkIndex) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33,
              padding: EdgeInsets.all(10),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        List imageList;
                        switch (inkIndex) {
                          case 0:
                            imageList = componentImages;
                            break;
                          case 1:
                            imageList = componentImagesLettuce;
                            break;
                          case 2:
                            imageList = componentImagesMeat;
                            break;
                          case 3:
                            imageList = componentImagesGar;
                            break;
                          case 4:
                            imageList = componentImagesMeat2;
                            break;
                          case 5:
                            imageList = componentImagesBunbot;
                            break;
                          default:
                        }
                        return Material(
                          color: Colors.transparent,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    child: Image.asset(
                                      imageList[index],
                                      fit: BoxFit.contain,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        switch (inkIndex) {
                                          case 0:
                                            img1 = index;
                                            img6 = index;
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
                                          case 5:
                                            img6 = index;
                                            img1 = index;
                                            break;
                                          default:
                                        }
                                        inkIndex = index;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  width: 200,
                                ),
                                Text("Name of \$ingred"),
                              ]),
                        );
                      },
                      itemCount: 5)),
            ),
          );
        });
  }
}
