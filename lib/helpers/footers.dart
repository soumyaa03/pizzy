import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';

class Footers extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(EvaIcons.shoppingBag),
    );
  }
}
