import 'package:flutter/cupertino.dart';
import 'package:pass_app_ultron_techonology/consts/images.dart';

import 'package:velocity_x/velocity_x.dart';

Widget applogoWidget(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  // Calculate size based on screen width, e.g., 10% of screen width
  double size = screenWidth * 0.2; // Adjust this factor as needed

  return Image.asset(dog0)
      .box
      .color(const  Color(0x7FD37E6C)) // Set the color to 0xFFCA7867
      .size(size, size)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}

// Widget loginimg(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;
//   double screenHeight = MediaQuery.of(context).size.height;
//
//   // Calculate size based on screen dimensions
//   double imgWidth = screenWidth * 0.9; // Adjust this factor as needed
//   double imgHeight = screenHeight * 0.9; // Adjust this factor as needed
//
//   return Image.asset(loginBoy)
//       .box
//       .size(imgWidth, imgHeight)
//       .make();
// }
