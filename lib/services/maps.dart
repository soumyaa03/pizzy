import 'package:flutter/cupertino.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

String finaladdress = 'Searching adresss';

class GenerateMaps extends ChangeNotifier {
  late Position position;
  Future getLocation() async {
    Position positionData = await Geolocator.getCurrentPosition();
    position = positionData;
    print(positionData);
    // GeoData geoData = await Geocoder2.getDataFromCoordinates(
    //     latitude: position.latitude,
    //     longitude: position.longitude,
    //     googleMapApiKey: 'AIzaSyBlGSkNgo5xBoTOdZ3dkZtampcTqtEZaiw');
    // AIzaSyBlGSkNgo5xBoTOdZ3dkZtampcTqtEZaiw <API Key>
    //finaladdress = geoData.address;
    List<Placemark> placemarks = await placemarkFromCoordinates(
        positionData.latitude, positionData.longitude);
    finaladdress = placemarks[0].subLocality.toString() +
        placemarks[0].street.toString() +
        placemarks[0].locality.toString();
    print(placemarks[0].subAdministrativeArea);

    notifyListeners();
  }
}
