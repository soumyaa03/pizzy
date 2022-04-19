import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizzy/services/maps.dart';

class Headers extends ChangeNotifier {
  Widget appbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.user)),
          Row(
            children: [
              const Icon(FontAwesomeIcons.locationArrow),
              Text(
                finaladdress,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 40,
              ))
        ],
      ),
    );
  }

  Widget headertext() {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: RichText(
          text: const TextSpan(
              text: 'What would you like',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 29),
              children: <TextSpan>[
            TextSpan(
                text: ' to eat?',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 46,
                    color: Colors.red))
          ])),
    );
  }

  Widget headerMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.redAccent, blurRadius: 15),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white),
                height: 40,
                width: 100,
                child: const Center(
                  child: Text(
                    'All Foods',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.blueAccent, blurRadius: 15),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white),
                height: 40,
                width: 100,
                child: const Center(
                  child: Text(
                    'Pizza',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.purpleAccent, blurRadius: 15),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white),
                height: 40,
                width: 100,
                child: const Center(
                  child: Text(
                    'Pasta',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
