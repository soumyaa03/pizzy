import 'package:flutter/cupertino.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String finaladdress = 'Searching adresss';

class GenerateMaps extends ChangeNotifier {
  bool isLoaded = false;

  Future getLocation() async {
    Position positionData = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        positionData.latitude, positionData.longitude);
    finaladdress = placemarks[0].subLocality.toString() +
        placemarks[0].street.toString() +
        placemarks[0].locality.toString();
    isLoaded = true;

    notifyListeners();
  }
}
