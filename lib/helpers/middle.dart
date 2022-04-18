import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzy/screens/detail_screen.dart';
import 'package:pizzy/services/managedata.dart';
import 'package:provider/provider.dart';

class Middle extends ChangeNotifier {
  Widget middleFavtext() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 8.0),
      child: RichText(
          text: const TextSpan(
              text: 'Favourite',
              style: TextStyle(
                  shadows: [BoxShadow(color: Colors.black, blurRadius: 1)],
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 36),
              children: <TextSpan>[
            TextSpan(
                text: ' dishes?',
                style: TextStyle(
                    shadows: [BoxShadow(color: Colors.grey, blurRadius: 0)],
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.grey))
          ])),
    );
  }

  Widget middleFavData(BuildContext context, String collection) {
    return SizedBox(
        height: 270,
        child: FutureBuilder(
            future: Provider.of<ManageData>(context, listen: false)
                .fetchdata(collection),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset('animations/pizza.json'),
                );
              }

              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot data = snapshot.data[index];
                    return GestureDetector(
                      onTap: (() {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: DetailScreen(
                                    queryDocumentSnapshot:
                                        snapshot.data[index]),
                                type: PageTransitionType.topToBottom));
                      }),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ]),
                          height: 200,
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 200,
                                width: 180,
                                child: Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 200,
                                      width: 180,
                                      child: Image.network(
                                        data['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        left: 140,
                                        top: -10,
                                        child: IconButton(
                                          icon: const Icon(
                                            EvaIcons.heart,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {},
                                        ))
                                  ],
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 8.0),
                                child: Text(
                                  data['cat'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 4.0),
                              //   child: Text(
                              //     snapshot.data[index].data()['category'],
                              //     style: const TextStyle(
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.w800,
                              //         color: Colors.red),
                              //   ),
                              // )
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                    ),
                                    Text(
                                      data['ratings'].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.cyan),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.rupeeSign,
                                            color: Colors.black,
                                            size: 14,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                              data['price'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }

  Widget businessLunchtext() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 8.0),
      child: RichText(
          text: const TextSpan(
              text: 'Business',
              style: TextStyle(
                  shadows: [BoxShadow(color: Colors.black, blurRadius: 1)],
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 36),
              children: <TextSpan>[
            TextSpan(
                text: ' Lunch',
                style: TextStyle(
                    shadows: [BoxShadow(color: Colors.red, blurRadius: 0)],
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.grey))
          ])),
    );
  }

  Widget businessData(BuildContext context, String collection) {
    return Container(
      height: 400,
      child: FutureBuilder(
          future: Provider.of<ManageData>(context, listen: false)
              .fetchdata(collection),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Lottie.asset('animations/pizza.json'));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot data = snapshot.data[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['cat'],
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      data['dis'],
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.rupeeSign,
                                          size: 10,
                                        ),
                                        Text(
                                          data['price'],
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 200,
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
