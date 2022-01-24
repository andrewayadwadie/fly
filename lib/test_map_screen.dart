import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fly/core/controller/location_controller.dart';
import 'package:fly/utils/style.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TestMapScreen extends StatefulWidget {
  const TestMapScreen({Key? key}) : super(key: key);

  @override
  State<TestMapScreen> createState() => _TestMapScreenState();
}

class _TestMapScreenState extends State<TestMapScreen> {
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> compeleteController = Completer();
  LatLng currentLocation = initialCameraPosition.target;
  //BitmapDescriptor? _locationIcon;

  Marker? _origin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              mapType: MapType.normal,
              onTap: _setMarker,
              markers: {
                if (_origin != null) _origin!,
              },
              onMapCreated: (GoogleMapController controller) {
                compeleteController.complete(controller);
              },
              onCameraMove: (CameraPosition newPos) {
                setState(() {
                  currentLocation = newPos.target;
                });
              },
            ),
            /// set mark
            _origin == null
                ? InkWell(
                    onTap: () => _setMarker(currentLocation),
                    child: const SizedBox(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.location_on,
                          color: redColor,
                        )),
                  )
                : const SizedBox(
                    width: 10,
                    height: 10,
                  ),
          
          ///choose mark and pop 
            _origin != null
                ? GetBuilder<BugLocationController>(builder: (control) {
                    return InkWell(
                      onTap: () {
                        control.getSelectedLocation(currentLocation.latitude,
                            currentLocation.longitude);
                        Navigator.pop(context);
              
                      },
                      child: Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                              color: lightPrimaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "إختار",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  })
                : const SizedBox(
                    width: 10,
                    height: 10,
                  )
          ],
        ),
      ),
      /// get my location 
      floatingActionButton:
          GetBuilder<BugLocationController>(builder: (locatioController) {
        return FloatingActionButton(
          onPressed: () async {
            LocationData _myLocation = await locatioController.getBugLocation();
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

  void _setMarker(LatLng _location) {
    Marker newMarker = Marker(
      markerId: MarkerId(_location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: _location,
      infoWindow: InfoWindow(
          title: "Info",
          snippet: "${currentLocation.latitude}, ${currentLocation.longitude}"),
    );

    setState(() {
      _origin = newMarker;
    });
  }


}
