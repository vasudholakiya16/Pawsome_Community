import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUser(User user) async {
    await _db.collection('user').doc(user.uid).set({
      'uid': user.uid,
      'email_': user.email,
      'displayName': user.displayName,
      'photoURL': user.photoURL,
    });
  }
}
