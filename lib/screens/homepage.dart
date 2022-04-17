import 'package:flutter/material.dart';
import 'package:pizzy/helpers/headers.dart';
import 'package:pizzy/helpers/middle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Headers().appbar(context),
            Headers().headertext(),
            Headers().headerMenu(context),
            const Divider(),
            Middle().middleFavtext(),
            Middle().middleFavData(context, 'fav'),
            Middle().businessLunchtext(),
            const Divider(),
            Middle().businessData(context, 'fav')
          ],
        ),
      )),
    );
  }
}
