import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMapScreen extends StatefulWidget {
  const TestMapScreen({Key? key}) : super(key: key);
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<TestMapScreen> createState() => _TestMapScreenState();
}

class _TestMapScreenState extends State<TestMapScreen> {
  Completer<GoogleMapController> compeleteController = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: TestMapScreen.initialCameraPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          compeleteController.complete(controller);
        },
      ),
    );
  }
}
