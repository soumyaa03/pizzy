import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzy/screens/cart_screen.dart';
import 'package:pizzy/services/maps.dart';
import 'package:provider/provider.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Provider.of<GenerateMaps>(context, listen: false).fetchMaps(),
          Positioned(
              child: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: CartScreen(), type: PageTransitionType.fade));
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            color: Colors.black,
          ))
        ],
      ),
    );
  }
}
