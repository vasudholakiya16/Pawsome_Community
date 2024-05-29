import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentNavIndex = 0.obs; // Initialize with default value

  void updateNavIndex(int index) {
    currentNavIndex.value = index;
  }
}
