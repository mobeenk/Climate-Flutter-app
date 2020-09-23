import 'package:clima/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;

  double getLongitude() {
    return this._longitude;
  }

  double getLatitude() {
    return this._latitude;
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

//
