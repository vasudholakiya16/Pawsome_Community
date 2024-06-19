import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/consts/images.dart';
import 'package:pass_app_ultron_techonology/user_screen/Auth_screen/loginscreen.dart';

class UserDoctor extends StatelessWidget {
  const UserDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 430,
            height: 850,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 431,
                    height: 932,
                    decoration: const BoxDecoration(color: Color(0xFFF48C76)),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.6),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3FFFFFFF),
                          blurRadius: 10,
                          offset: Offset(0, 0),
                          spreadRadius: 6,
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.4),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3FFFFFFF),
                          blurRadius: 10,
                          offset: Offset(0, 0),
                          spreadRadius: 6,
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.61),
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(() => const LoginScreen());
                      // print('Doctor tapped!');
                    },
                    child: Container(
                      width: 200,
                      height: 205,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(doctor),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0, -0.19),
                  child: Text(
                    'DOCTOR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0, 0.50),
                  child: Text(
                    'USER',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.30),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                      // print('User image tapped!');
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(user),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
