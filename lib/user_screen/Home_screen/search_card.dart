import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/user_screen/Home_screen/search_screen.dart';
import 'package:pass_app_ultron_techonology/user_screen/same_code/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeContainer());
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 50,
                    width: 350,
                    color: lightGrey,
                    child: Material(
                      child: TextFormField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search).onTap(() {
                            if (controller.searchController.text.isNotEmpty) {
                              Get.to(() => SearchScreen(
                                    title: controller.searchController.text,
                                  ));
                            }
                          }),
                          filled: true,
                          fillColor: whiteColor,
                          hintText: "Search anythings",
                          hintStyle: const TextStyle(color: textfieldGrey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
