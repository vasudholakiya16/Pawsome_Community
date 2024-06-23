import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/consts/firebase_constent.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthControllerDoctor extends GetxController {
  // is loading variables
  var isloading = false.obs;

// text Controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Login Method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Signup Method
  Future<UserCredential?> SignupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Store Data Method
  storeUserData({Name, password, email}) async {
    DocumentReference store =
        firestore.collection(doctorConllections).doc(currentUser!.uid);
    store.set({
      'name': Name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': "00",
      'order_count': "00",
      'wishlist_count': "00",
    });
  }

  //Signout Method

  signoutMethod(context, callback) async {
    try {
      await auth.signOut();
      callback();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
