import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pass_app_ultron_techonology/Splesh_screen/Skip1.dart';
import 'package:pass_app_ultron_techonology/consts/firebase_constent.dart';
import 'package:pass_app_ultron_techonology/user_screen/Home_screen/home.dart';
import '../consts/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ChangeScreen();
  }

  /// Create a method to change the screen
  ChangeScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      // using GetX;
      // Get.to(() => Skip1());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const Skip1());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize MediaQueryData
    final mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: punk,
      body: Stack(
        children: [
          Positioned(
            top: 30, // Position at the top
            left: (mq.size.width - 300) / 2, // Center horizontally
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Vector.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            left: (mq.size.width - 350) /
                2, // Center horizontally with a bit of space
            top: 330, // Position at the top
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/girl-white-dog.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.0, -0.5),
            child: Text(
              'COMMUNITY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Irish Grover',
                fontWeight: FontWeight.w400,
                letterSpacing: 9.10,
              ),
            ),
          ),
          const Align(
            alignment: Alignment(0.0, -0.6),
            child: Text(
              'PAWSOME',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Irish Grover',
                fontWeight: FontWeight.w400,
                letterSpacing: 4.16,
              ),
            ),
          ),
          Positioned(
            left: mq.size.width * 0.0, // 0% of the screen width
            bottom: mq.size.height * 0.0, // 0% of the screen height
            child: Transform.rotate(
              angle: 3.14159265359, // 180 degrees in radians
              child: Stack(
                children: [
                  Container(
                    width: mq.size.width,
                    height: mq.size.height * 0.2, // 20% of the screen height
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(-300),
                        topRight: const Radius.circular(-300),
                        bottomLeft: Radius.elliptical(
                            mq.size.width * 0.8,
                            mq.size.height *
                                0.10), // Adjusted for dynamic values
                        bottomRight: Radius.elliptical(
                            mq.size.width * 0.8,
                            mq.size.height *
                                0.10), // Adjusted for dynamic values
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 3, // Spread radius
                          blurRadius: 3, // Blur radius
                          offset: const Offset(0, 4), // Offset
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: mq.size.width * 0.41, // 40% of the screen width
                    bottom: mq.size.height * 0.15, // 25% of the screen height
                    child: Transform.rotate(
                      angle: 3.14159265359, // 180 degrees in radians
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Loading...',
                          style: TextStyle(
                            color: punk,
                            fontSize: 12,
                            fontFamily: 'Itim',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: mq.size.width * 0.10, // 8% of the screen width
            top: mq.size.height * 0.94, // 78% of the screen height
            child: Container(
              width: mq.size.width * 0.40, // 35% of the screen width
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFFAC1B4),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: mq.size.width * 0.10, // 8% of the screen width
            top: mq.size.height * 0.94, // 78% of the screen height
            child: Container(
              width: mq.size.width * 0.80, // 35% of the screen width
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFFAC1B4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
