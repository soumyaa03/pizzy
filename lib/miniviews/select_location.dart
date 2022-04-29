import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'package:pizzy/screens/cart_screen.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition:
                CameraPosition(target: LatLng(12, 12), zoom: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Positioned(
                child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const CartScreen(),
                        type: PageTransitionType.fade));
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: Colors.black,
            )),
          )
        ],
      ),
    );
  }

  getMarkers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker marker = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat, long),
        infoWindow:
            const InfoWindow(title: 'My title', snippet: 'Country Name'));
    markers[markerId] = marker;
  }
}
