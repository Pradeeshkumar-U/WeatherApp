import 'package:geolocator/geolocator.dart';

// ignore: must_be_immutable
class MyLocation {
  String error = '';

  Future<void> checker() async {
    try {
      bool check;
      LocationPermission permission;
      check = await Geolocator.isLocationServiceEnabled();
      if (!check) {
        permission = await Geolocator.requestPermission();
        error = 'Enable location services';
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          error = 'Location services denied';
        }
      }
      if (permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        error = 'Location services disabled';
      }
    } catch (e) {
      error = 'unexpected error! ($e)';
    }
  }
}
