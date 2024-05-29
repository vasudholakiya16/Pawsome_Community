
import 'package:flutter/material.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/images.dart';

import 'package:velocity_x/velocity_x.dart';

Widget applogoWidget1() {
  return Image.asset(dog0)
      .box
      .color(const Color(0x7FF59A86)) // Set the color to 0xFFCA7867
      .size(65, 65)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}

Widget search_Bar() {
  return const Icon(Icons.search)
      .box
      .color(const Color.fromARGB(
      126, 223, 223, 223)) // Set the color to 0xFFCA7867
      .size(55, 55)
      .padding(const EdgeInsets.all(10))
      .roundedFull
      .make();
}

Widget categoryScreen(String imagePath, String title, BuildContext context) {
  final screenHeight = MediaQuery
      .of(context)
      .size
      .height;
  final screenWidth = MediaQuery
      .of(context)
      .size
      .width;

  // Adjust dimensions based on screen size
  final containerHeight = screenHeight * 0.16;
  final containerWidth = screenWidth * 0.2;
  final imageHeight = containerHeight * 0.55;
  final imageWidth = containerWidth * 0.8;
  final fontSize = screenWidth * 0.04;

  return Align(
    alignment: Alignment.centerLeft,

    child: Padding(
      padding: EdgeInsets.all(screenWidth * 0.010),
      // Adjusted margin around the Padding widget
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: containerHeight,
            width: containerWidth,
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
            // Adjusted margin within the Row
            decoration: BoxDecoration(
              color: const Color(0x7FF59A86),
              borderRadius: BorderRadius.circular(screenWidth * 0.1),
            ),
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image
                    .asset(imagePath)
                    .box
                    .color(whiteColor)
                    .topLeftRounded()
                    .size(imageWidth, imageHeight)
                    .padding(EdgeInsets.all(screenWidth * 0.02))
                    .roundedFull
                    .make(),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                  ),
                ).centered(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}