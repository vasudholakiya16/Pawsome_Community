import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

// Widget uploadyourLicense(BuildContext context) {
//   double screenWidth = MediaQuery.of(context).size.width;

//   // Calculate size based on screen width, e.g., 20% of screen width
//   double size = screenWidth * 0.15; // Adjust this factor as needed

//   return DottedBorder(
//     color: Colors.black, // Color of the dashed border
//     strokeWidth: 1, // Width of the dashed border
//     dashPattern: const [5, 3], // Pattern of dashes and gaps
//     borderType: BorderType.RRect,
//     radius: const Radius.circular(12),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Icon(Icons.upload_file, color: Colors.black, size: 25)
//             .p8()
//             .box
//             // Set the color to 0x7FD37E6C
//             .size(size, size)
//             .padding(const EdgeInsets.all(8))
//             .rounded
//             .make(),
//         const SizedBox(width: 5), // Add some space between the image and text
//         const Text(
//           "Upload Your License",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.normal,
//             color: Colors.black, // Adjust color as needed
//           ),
//         ),
//       ],
//     ).paddingAll(6), // Padding inside the dotted border
//   ).paddingAll(8); // Padding outside the dotted border
// } // Assuming you are using the VelocityX package

Widget uploadyourLicense(BuildContext context, VoidCallback onPress) {
  double screenWidth = MediaQuery.of(context).size.width;

  // Calculate size based on screen width, e.g., 15% of screen width
  double size = screenWidth * 0.15; // Adjust this factor as needed

  return GestureDetector(
    onTap: onPress,
    child: DottedBorder(
      color: Colors.black, // Color of the dashed border
      strokeWidth: 1, // Width of the dashed border
      dashPattern: const [5, 3], // Pattern of dashes and gaps
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.upload_file, color: Colors.black, size: 25)
              .p8()
              .box
              // Set the color to 0x7FD37E6C
              .size(size, size)
              .padding(const EdgeInsets.all(8))
              .rounded
              .make(),
          const SizedBox(width: 5), // Add some space between the image and text
          const Text(
            "Upload Your License",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black, // Adjust color as needed
            ),
          ),
        ],
      ).paddingAll(6), // Padding inside the dotted border
    ).paddingAll(8), // Padding outside the dotted border
  );
}
