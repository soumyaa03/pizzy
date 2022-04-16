import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        height: 300,
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
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (() {}),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 180,
                                  child: Image.network(
                                      snapshot.data[index].data()['image']),
                                ),
                                Positioned(
                                    left: 140,
                                    child: IconButton(
                                      icon: const Icon(EvaIcons.heart),
                                      onPressed: () {},
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                snapshot.data[index].data()['name'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                snapshot.data[index].data()['category'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
