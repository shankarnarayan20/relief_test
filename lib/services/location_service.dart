import 'package:geolocator/geolocator.dart';

String currentAddress;

class LocationService {
  Position _currentPosition;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  String getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;

      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
    return currentAddress;
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
      currentAddress = "${place.subLocality}";
    } catch (e) {
      print(e);
    }
  }
}
