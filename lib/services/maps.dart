import 'package:flutter/cupertino.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String finaladdress = 'Searching adresss';

class GenerateMaps extends ChangeNotifier {
  late Position positionData;
  late GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Future getLocation() async {
    positionData = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        positionData.latitude, positionData.longitude);
    finaladdress = placemarks[0].subLocality.toString() +
        placemarks[0].street.toString() +
        placemarks[0].locality.toString();

    notifyListeners();
  }

  getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker marker = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: 'My title', snippet: 'Country Name'));
    markers[markerId] = marker;
  }

  Widget fetchMaps() {
    // ignore: void_checks

    return GoogleMap(
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: (loc) async {
          List<Placemark> placemarks =
              await placemarkFromCoordinates(loc.latitude, loc.longitude);
          notifyListeners();
          markers.isEmpty
              ? getMarkers(loc.latitude, loc.longitude)
              : markers.clear();
        },
        markers: Set<Marker>.of(markers.values),
        initialCameraPosition: CameraPosition(
            target: LatLng(positionData.latitude, positionData.longitude),
            zoom: 18),
        onMapCreated: (GoogleMapController mapcontroller) {
          googleMapController = mapcontroller;
          notifyListeners();
        });
  }
}
