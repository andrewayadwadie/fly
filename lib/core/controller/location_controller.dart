import 'package:get/get.dart';
import 'package:location/location.dart';

class BugLocationController extends GetxController {
  //  @override
  // void onInit()  {
  //  getAddress();
  //   super.onInit();
  // }
  double _lat = 0.0;
  double _lng = 0.0;
  // List<geocode.GeocodingResult>? adreesList  ;

  // get addressList =>adreesList;

  get locationLat => _lat;
  get locationLng => _lng;

  Future<LocationData> getBugLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Exception();
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception();
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  void getSelectedLocation(double latitute, double langtute) {
    _lat = latitute;
    _lng = langtute;

    update();
  }

  // Future<List<geocode.GeocodingResult>?> getAddress()async{
  //   var googleGeocoding =geocode. GoogleGeocoding(apiKey);
  //    var response = await googleGeocoding.geocoding.getReverse(
  //     geocode.LatLon(_lat,_lng), );

  //     List<geocode.GeocodingResult>? result =response!.results;
  //      return result;

  // }
}
