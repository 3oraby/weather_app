import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // ask the user to let the app use the location
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position? position = await Geolocator.getLastKnownPosition();
  if (position == null) {
    return "";
  }
  // get latitude and longitude
  double latitude = position.latitude;
  double longitude = position.longitude;

  // turn the latitude and longitude into city name
  List<Placemark> placemarks = await placemarkFromCoordinates(
    latitude,
    longitude,
  );

  if (placemarks.isNotEmpty) {
    return placemarks[0].locality ?? "";
  } else {
    return "";
  }
}
