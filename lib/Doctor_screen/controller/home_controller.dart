import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/consts/firebase_constent.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  var CurrentNavIndex = 0.obs;
  var username = '';
  var searchController = TextEditingController();
  getUsername() async {
    var n = await firestore
        .collection(doctorConllections)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });

    // print(username);
  }
}
