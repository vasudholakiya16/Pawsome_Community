import 'package:flutter/material.dart';

Widget bgWidgetDoctor({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/imgBackgrounddoctor.png"),
            fit: BoxFit.fill)),
    child: child,
  );
}
