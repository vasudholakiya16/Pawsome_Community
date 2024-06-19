import 'package:flutter/material.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}
