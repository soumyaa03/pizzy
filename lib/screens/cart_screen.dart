import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzy/miniviews/select_location.dart';
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
      body: SingleChildScrollView(
        child: Padding(
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
      height: 400,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('MyOrders').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('animations/pizza.json'),
              );
            } else {
              return ListView(
                  children: snapshot.data.docs
                      .map<Widget>((DocumentSnapshot documentSnapshot) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 5,
                            spreadRadius: 5)
                      ]),
                  height: 210,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8.0, bottom: 8.0),
                        child: SizedBox(
                            height: 190,
                            width: 180,
                            child: Image.network(
                              documentSnapshot['image'],
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              documentSnapshot['name'],
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            Text(
                              'price : ${documentSnapshot['price'].toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'onion : ${documentSnapshot['onion'].toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'cheese : ${documentSnapshot['cheese'].toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'corn : ${documentSnapshot['corn'].toString()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Text(
                                documentSnapshot['size'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList());
            }
          }),
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
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: SelectLocation(),
                              type: PageTransitionType.fade));
                    },
                    icon: const Icon(Icons.edit))
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
