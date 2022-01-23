import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fly/core/controller/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TestMapScreen extends StatefulWidget {
  const TestMapScreen({Key? key}) : super(key: key);

  @override
  State<TestMapScreen> createState() => _TestMapScreenState();
}

class _TestMapScreenState extends State<TestMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> compeleteController = Completer();
  LatLng currentLocation = initialCameraPosition.target;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          compeleteController.complete(controller);
        },
        onCameraMove: (CameraPosition newPos) {
          setState(() {
            currentLocation = newPos.target;
          });
        },
      ),
      floatingActionButton: GetBuilder<LocationController>(
          init: LocationController(),
          builder: (locatioController) {
            return FloatingActionButton(
              onPressed: () async {
                LocationData _myLocation =
                    await locatioController.getLocation();
                _animateCamera(_myLocation);
              },
              child: const Icon(Icons.gps_fixed),
            );
          }),
    );
  }

  Future<void> _animateCamera(LocationData _location) async {
    final GoogleMapController controller = await compeleteController.future;
    CameraPosition _cameraPostion = CameraPosition(
        target: LatLng(
          _location.latitude!,
          _location.longitude!,
        ),
        zoom: 16.4746);
        log("animated camera to lat : ${_location.altitude} and long : ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPostion));
  }
}
