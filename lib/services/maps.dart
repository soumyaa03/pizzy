import 'package:flutter/cupertino.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

String finaladdress = 'Searching adresss';

class GenerateMaps extends ChangeNotifier {
  bool isLoaded = false;
  late Position positionData;
  Position get getposi => positionData;

  Future getLocation() async {
    positionData = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        positionData.latitude, positionData.longitude);
    finaladdress = placemarks[0].subLocality.toString() +
        placemarks[0].street.toString() +
        placemarks[0].locality.toString();
    isLoaded = true;

    notifyListeners();
  }
}
