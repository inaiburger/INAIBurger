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
              position: LatLng(42.879136, 74.617872),
              consumeTapEvents: true,
              infoWindow: InfoWindow(
                  title: "БЦ Victory", snippet: '2 stock'),
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
