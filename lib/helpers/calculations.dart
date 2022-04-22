import 'package:flutter/material.dart';
import 'package:pizzy/services/managedata.dart';
import 'package:provider/provider.dart';

class Calculation extends ChangeNotifier {
  late String size;
  int cheese = 0;
  int onion = 0;
  int corn = 0;
  int cartData = 0;
  bool isSelected = false,
      medium = false,
      small = false,
      large = false,
      selected = false;
  int get getCheese => cheese;
  int get getOnion => onion;
  int get getCorn => corn;
  int get getCartData => cartData;
  bool get getSelected => selected;
  String get getSize => size;

  addCheese() {
    cheese++;
    notifyListeners();
  }

  addOnion() {
    onion++;
    notifyListeners();
  }

  addCorn() {
    corn++;
    notifyListeners();
  }

  removeCheese() {
    cheese--;
    notifyListeners();
  }

  removeOnion() {
    onion--;
    notifyListeners();
  }

  removeCorn() {
    corn--;
    notifyListeners();
  }

  selectSmallSize() {
    small = !small;
    size = 'S';
    notifyListeners();
  }

  selectMediumSize() {
    medium = !medium;
    size = 'M';
    notifyListeners();
  }

  selectLargeSize() {
    large = !large;
    size = 'L';
    notifyListeners();
  }

  removeAllData() {
    cheese = 0;
    onion = 0;
    corn = 0;
    small = false;
    medium = false;
    large = false;
    notifyListeners();
  }

  addtoCart(BuildContext context, dynamic data) async {
    if (small != false || medium != false || large != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.pinkAccent,
              height: 50,
              child: const Center(
                child: Text(
                  'Choose Size',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
    }
  }
}
