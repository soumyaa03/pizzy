import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class GetMapUi extends ChangeNotifier {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late GoogleMapController googleMapController;
  Future<Position> posdata = Geolocator.getCurrentPosition();
  getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker marker = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: 'My title', snippet: 'Country Name'));
    markers[markerId] = marker;
  }

  Future fetchMaps() async {
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
        initialCameraPosition: CameraPosition(target: LatLng(), zoom: 18),
        onMapCreated: (GoogleMapController mapcontroller) {
          googleMapController = mapcontroller;
          notifyListeners();
        });
  }
}
