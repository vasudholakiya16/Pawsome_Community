import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget applogoWidgetDoctor(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  // Calculate size based on screen width, e.g., 10% of screen width
  double size = screenWidth * 0.2; // Adjust this factor as needed

  return Image.asset("assets/images/logodoctor.png")
      .box
      .color(const Color(0x7FD37E6C)) // Set the color to 0xFFCA7867
      .size(size, size)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
