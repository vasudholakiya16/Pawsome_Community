import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/Splesh_screen/selection_screen.dart';

import '../consts/colors.dart';

class Skip3 extends StatefulWidget {
  const Skip3({super.key});

  @override
  State<Skip3> createState() => _Skip2State();
}

class _Skip2State extends State<Skip3> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: mq.size.height,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: mq.size.height * 0.45,
                  decoration: const BoxDecoration(
                    color: punk,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(700),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 0, top: 0, bottom: 0, right: 20),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/dog3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: mq.size.width * 0.36,
                  top: mq.size.height * 0.485,
                  child: SizedBox(
                    width: mq.size.width * 0.31,
                    height: mq.size.height * 0.5,
                    child: Stack(
                      children: [
                        Positioned(
                          left: mq.size.width * 0.087,
                          top: 0,
                          child: Container(
                            width: mq.size.width * 0.015,
                            height: mq.size.height * 0.015,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: mq.size.width * 0.143,
                          top: 0,
                          child: Container(
                            width: mq.size.width * 0.015,
                            height: mq.size.height * 0.015,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: mq.size.width * 0.199,
                          top: 0,
                          child: Container(
                            width: mq.size.width * 0.015,
                            height: mq.size.height * 0.015,
                            decoration: const ShapeDecoration(
                              color: punk,
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.1, 0.25),
                  child: SizedBox(
                    width: mq.size.width * 0.99,
                    height: mq.size.height * 0.1,
                    child: Text(
                      'Find partner for your pet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF636363),
                        fontSize: mq.size.width * 0.07,
                        fontFamily: 'Irish Grover',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.1, 0.4),
                  child: SizedBox(
                    width: mq.size.width * 0.80,
                    height: mq.size.height * 0.1,
                    child: Text(
                      'join and discover your favorite pet and find everything for your pets in your locality',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF636363),
                        fontSize: mq.size.width * 0.035,
                        fontFamily: 'Irish Grover',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0.8, 0.9),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const UserDoctor());
                    },
                    child: Container(
                      width: mq.size.width * 0.15,
                      height: mq.size.height * 0.07,
                      decoration: ShapeDecoration(
                        color: punk,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-3.0, 1.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const UserDoctor());
                    },
                    child: SizedBox(
                      width: mq.size.width * 0.75,
                      height: mq.size.height * 0.1,
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF636363),
                          fontSize: mq.size.width * 0.045,
                          fontFamily: 'Irish Grover',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          decoration: TextDecoration.none,
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
