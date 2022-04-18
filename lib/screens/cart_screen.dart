import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzy/screens/homepage.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: appBar(context),
            ),
            headerText(),
            cartData(),
            shippingData(
              context,
            )
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const HomePage(),
                      type: PageTransitionType.bottomToTop));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        Padding(
          padding: const EdgeInsets.only(left: 280.0),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.red,
              )),
        )
      ],
    );
  }

  Widget headerText() {
    return Column(
      children: const [
        Text('Your', style: TextStyle(color: Colors.grey, fontSize: 18)),
        Text('Cart',
            style: TextStyle(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold))
      ],
    );
  }

  Widget cartData() {
    return SizedBox(
      height: 300,
    );
  }

  Widget shippingData(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
      ], borderRadius: BorderRadius.circular(40), color: Colors.white),
      height: 130,
      width: 400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(FontAwesomeIcons.locationArrow),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: const Text('Nayapalli')),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(EvaIcons.clock),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: const Text('4 pm - 6 pm')),
                  )
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
            ],
          )
        ],
      ),
    );
  }
}
