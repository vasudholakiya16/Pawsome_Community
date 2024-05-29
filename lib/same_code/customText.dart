// import 'package:flutter/material.dart';
// import 'package:pass_app_main/consts/colors.dart';
// import 'package:pass_app_main/consts/styles.dart';
//
// import 'package:velocity_x/velocity_x.dart';
//
// Widget customTextField({
//   String? title,
//   String? hint,
//   required RegExp validationRegulatorExpression,
//   TextEditingController? controller,
//   bool isPass = false,
//   // required String? Function(dynamic value) validator,
//   // Specify the controller type
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       title!.text.color(Colors.black).fontFamily(semibold).size(16).make(),
//       5.heightBox,
//       TextFormField(
//         obscureText: isPass,
//         // obscureText:isPass,
//         controller: controller,
//         decoration: InputDecoration(
//           hintStyle: const TextStyle(
//             fontFamily: semibold,
//           ),
//           hintText: hint,
//           isDense: true,
//           filled: true,
//           fillColor: Colors.white10,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           validator: (value) {
//             if (value != null && validationRegulatorExpression.hasMatch(value)) {
//               return null;
//             }
//             return "Enter a valid ${hint?.toLowerCase()}";
//           },
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color:darkFontGrey,
//             ),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//       5.heightBox,
//     ],
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:pass_app_main/consts/colors.dart';
// import 'package:pass_app_main/consts/styles.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// Widget customTextField({
//   String? title,
//   String? hint,
//   required RegExp validationRegulatorExpression,
//   TextEditingController? controller,
//   bool isPass = false,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       if (title != null) title.text.color(Colors.black).fontFamily(semibold).size(16).make(),
//       5.heightBox,
//       TextFormField(
//         obscureText: isPass,
//         controller: controller,
//         decoration: InputDecoration(
//           hintStyle: const TextStyle(
//             fontFamily: semibold,
//           ),
//           hintText: hint,
//           isDense: true,
//           filled: true,
//           fillColor: Colors.white10,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: darkFontGrey,
//             ),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//         validator: (value) {
//           if (value != null && validationRegulatorExpression.hasMatch(value)) {
//             return null;
//           }
//           return "Enter a valid ${hint?.toLowerCase()}";
//         },
//       ),
//       5.heightBox,
//     ],
//   );
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/colors.dart';
import '../consts/styles.dart';

Widget customTextField({
  required String hint,
  required String title,
  required TextEditingController controller,
  required bool isPass,
  required RegExp validationRegulatorExpression,
  required FormFieldValidator<String> validator,
  required VoidCallback toggleVisibility,
  required bool isPasswordVisible,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // if (title != null) title.text.color(Colors.black).fontFamily(semibold).size(16).make(),
//       5.heightBox,
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          obscureText: isPass && !isPasswordVisible,
          decoration: InputDecoration(
            labelText: title,
            hintText: hint,
            border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),

                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: darkFontGrey,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
            suffixIcon: isPass
                ? IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: punk,
              ),
              onPressed: toggleVisibility,
            )
                : null,
          ),
          validator: validator,
        ),
      ),
    ],
  );
}
