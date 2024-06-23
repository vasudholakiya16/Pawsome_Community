import 'package:pass_app_ultron_techonology/consts/firebase_constent.dart';

class FireStoreServices {
  static getUser(uid) {
    // Get user Data
    return firestore
        .collection(doctorConllections)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
