import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/list.dart';
import '../consts/styles.dart';
import '../controller/product_controller.dart';
import 'cat_category_details.dart';

class CatCategoryScreen extends StatelessWidget {
  final String title;

  const CatCategoryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(productController());
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0EA),
      appBar: AppBar(
        title:
            title.text.fontFamily(bold).color(const Color(0xFFCA7867)).make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 8,
                mainAxisExtent: 200,
              ),
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Image.asset(
                      catCategoriesImages[index],
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    catCategoriesList[index]
                        .text
                        .black
                        .align(TextAlign.center)
                        .make()
                  ],
                )
                    .box
                    .white
                    .roundedSM
                    .clip(Clip.antiAlias)
                    .outerShadow2Xl
                    .make()
                    .onTap(() {
                  Get.to(() =>
                      CatDogCategoryDetail(title: catCategoriesList[index]));
                });
              })),
        ),
      ),
    );
  }
}
