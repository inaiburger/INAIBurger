import 'package:flutter/material.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
              onTap: () {}),
          Marker(
              markerId: MarkerId('marker_2'),
              position: LatLng(42.857489, 74.609731),
              consumeTapEvents: true,
              infoWindow:
                  InfoWindow(title: 'InaiBurger Vefa', snippet: 'bekbolot kot'),
              onTap: () {}),
          Marker(
              markerId: MarkerId('marker_3'),
              position: LatLng(42.875990, 74.614007),
              consumeTapEvents: true,
              infoWindow:
                  InfoWindow(title: 'InaiBurger Tsum', snippet: 'bekbolot kot'),
              onTap: () {}),
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
