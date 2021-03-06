import 'package:flutter/material.dart';
import 'package:inaiburger/models/component_images.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class ConstructorScreen extends StatefulWidget {
  @override
  _ConstructorScreenState createState() => _ConstructorScreenState();
}

class _ConstructorScreenState extends State<ConstructorScreen> {
  int img1 = 0;
  int img2 = 1;
  int img3 = 2;
  int img4 = 3;
  int img5 = 4;
  int img6 = 4;
  Map<String, int> customBurger = {
    'img1': 1,
    'img2': 1,
    'img3': 1,
    'img4': 1,
    'img5': 1,
    'img6': 1,
  };
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
            backgroundColor: Colors.redAccent,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 20,
                  ),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Ink.image(
                        image:
                            AssetImage(componentImages[customBurger['img1']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(0);
                          },
                        ),
                      )),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Ink.image(
                        image: AssetImage(
                            componentImagesLettuce[customBurger['img2']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(1);
                          },
                        ),
                      )),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Ink.image(
                        image: AssetImage(
                            componentImagesMeat[customBurger['img3']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(2);
                          },
                        ),
                      )),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Ink.image(
                        image: AssetImage(
                            componentImagesGar[customBurger['img4']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(3);
                          },
                        ),
                      )),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Ink.image(
                        image: AssetImage(
                            componentImagesMeat2[customBurger['img5']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(4);
                          },
                        ),
                      )),
                  Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Ink.image(
                        image: AssetImage(
                            componentImagesBunbot[customBurger['img6']]),
                        fit: BoxFit.fitWidth,
                        child: InkWell(
                          onTap: () {
                            showComponents(5);
                          },
                        ),
                      )),
                  Divider(),
                  FlatButton(
                    child: Text(
                      'Add to card',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromRGBO(163, 8, 11, 80),
                    onPressed: () {
                      print(customBurger);
                    },
                  )
                ],
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
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  // image: DecorationImage(
                  //   image: new ExactAssetImage('assets/images/burger3.png'),
                  //   fit: BoxFit.fitWidth,
                  //   colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop)
                  // ),
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
                                Text("Burger cheto cheto vse vy lohi"),
                              ]),
                        );
                      },
                      itemCount: 5)),
            ),
          );
        });
  }
}

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  BitmapDescriptor pinLocationIcon;

  MapType defaultMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.redAccent,
      //     child: Icon(Icons.layers),
      //     onPressed: () {
      //       setState(() {
      //         defaultMapType = defaultMapType == MapType.normal
      //             ? MapType.hybrid
      //             : MapType.normal;
      //       });
      //     }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: PlatformMap(
        mapType: defaultMapType,
        initialCameraPosition: CameraPosition(
          target: const LatLng(42.863962, 74.579154),
          zoom: 12.0,
        ),
        markers: Set<Marker>.of([
          Marker(
              markerId: MarkerId('marker_1'),
              position: LatLng(42.833834, 74.621427),
              consumeTapEvents: true,
              infoWindow: InfoWindow(
                  title: 'InaiBurger CosmoPark', snippet: 'bekbolot kot'),
              onTap: () {
                print('Marker');
              }),
          Marker(
              markerId: MarkerId('marker_2'),
              position: LatLng(42.857489, 74.609731),
              consumeTapEvents: true,
              infoWindow:
                  InfoWindow(title: 'InaiBurger Vefa', snippet: 'bekbolot kot'),
              onTap: () {
                print('asd');
              }),
          Marker(
              markerId: MarkerId('marker_3'),
              position: LatLng(42.875990, 74.614007),
              consumeTapEvents: true,
              infoWindow:
                  InfoWindow(title: 'InaiBurger Tsum', snippet: 'bekbolot kot'),
              onTap: () {
                print('Marker');
              }),
        ]),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: (location) => print('onTap: $location'),
        // onCameraMove: (cameraUpdate) => print('onCameraMove: $cameraUpdate'),
        compassEnabled: true,
        zoomGesturesEnabled: true,
        // onMapCreated: (controller) {
        //   Future.delayed(Duration(seconds: 2)).then((_) {
        //     controller.animateCamera(
        //         CameraUpdate.newCameraPosition(const CameraPosition(
        //       bearing: 270.0,
        //       target: LatLng(51.5160895, -0.1294527),
        //       tilt: 30.0,
        //       zoom: 18,
        //     )
        //     )
        //     );
        //   });
        // },
      ),
    );
  }
}