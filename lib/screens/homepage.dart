import 'package:flutter/material.dart';
import 'package:pizzy/helpers/footers.dart';
import 'package:pizzy/helpers/headers.dart';
import 'package:pizzy/helpers/middle.dart';
import 'package:pizzy/services/maps.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<GenerateMaps>(context, listen: false).getLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footers().floatingActionButton(context),
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
