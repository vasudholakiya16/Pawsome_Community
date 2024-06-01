import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../consts/colors.dart';

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
