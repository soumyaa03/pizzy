import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:pizzy/services/authentication.dart';
import 'package:provider/provider.dart';

class ManageData extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future fetchdata(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future submitData(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance.collection('MyOrders').doc().set(data);
  }
}
//Provider.of<Authentication>(context, listen: false).getUid
