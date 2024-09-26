import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/Splesh_screen/Skip1.dart';
import 'package:pass_app_ultron_techonology/consts/firebase_constent.dart';

class HomeDoctor extends StatefulWidget {
  const HomeDoctor({super.key});

  @override
  State<HomeDoctor> createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  void initState() {
    super.initState();
    doctorScreen();
  }

  /// Create a method to change the screen
  doctorScreen() {
    // using GetX;
    // Get.to(() => Skip1());
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        Get.to(() => const Skip1());
      } else {
        Get.to(() => const HomeDoctor());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
