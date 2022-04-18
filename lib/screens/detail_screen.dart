import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzy/screens/cart_screen.dart';
import 'package:pizzy/screens/homepage.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;

  const DetailScreen({required this.queryDocumentSnapshot});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int cheeseValue = 0;
  int onionValue = 0;
  int cornValue = 0;
  int totalItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingButton(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: appBar(context),
          ),
          itemImage(),
          middledata(),
          footerDetails()
        ],
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

  Widget itemImage() {
    return Center(
      child: SizedBox(
        height: 280,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget middledata() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow.shade700,
                size: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  widget.queryDocumentSnapshot['ratings'].toString(),
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Text(
                  widget.queryDocumentSnapshot['cat'],
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.rupeeSign,
                      size: 20, color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.queryDocumentSnapshot['price'].toString(),
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget footerDetails() {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add more stuff",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'cheese',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 22),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(EvaIcons.minus)),
                            Text('$cheeseValue',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade500)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(EvaIcons.plus)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'onion',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 22),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(EvaIcons.minus)),
                            Text('$onionValue',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade500)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(EvaIcons.plus)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'corn',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 22),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(EvaIcons.minus)),
                            Text('$cornValue',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey.shade500)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(EvaIcons.plus)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'L',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget floatingButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50)),
            child: const Center(
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const CartScreen(),
                          type: PageTransitionType.bottomToTop));
                },
                child: const Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                )),
            Positioned(
                left: 35,
                child: CircleAvatar(
                  foregroundColor: Colors.red,
                  radius: 10,
                  child: Text('$totalItems'),
                ))
          ],
        )
      ],
    );
  }
}
