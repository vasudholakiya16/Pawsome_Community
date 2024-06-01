import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/All%20Product/show_all_product.dart';
import 'package:pass_app_ultron_techonology/Chat_screen/MessageScreen.dart';
import 'package:pass_app_ultron_techonology/Chat_screen/apis.dart';
import 'package:pass_app_ultron_techonology/Home_screen/home_screen.dart';
import 'package:pass_app_ultron_techonology/Profile_screen/profile_screen.dart';
import 'package:pass_app_ultron_techonology/Wishlist_screen/wishlist_screen.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:pass_app_ultron_techonology/controller/home_controller.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize Home controller
    var controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        var navBody = [
          const HomeScreen(),
          const Favourite(),
          const AllProduct(),
          const MessageScreen(),
          ProfileScreenMain(user:APIs.me),
        ];

        return Column(
          children: [
            Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        var navbarItem = [
          const BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.home_outlined,
                size: 30.0,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.favorite,
                size: 30.0,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.explore,
                size: 30.0,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.message_rounded,
                size: 30.0,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox(
              child: Icon(
                Icons.account_circle_outlined,
                size: 30.0,
              ),
            ),
            label: '',
          ),
        ];

        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: const Color.fromARGB(255, 143, 53, 35),
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 245, 208, 201),
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        );
      }),
    );
  }
}
