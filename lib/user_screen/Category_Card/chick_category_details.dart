import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Services/firestore_services.dart';
import '../controller/product_controller.dart';
import '../same_code/loadingIndicator.dart';
import 'chick_item_details.dart';

class ChickDogCategoryDetail extends StatefulWidget {
  final String? title;

  const ChickDogCategoryDetail({super.key, required this.title});

  @override
  State<ChickDogCategoryDetail> createState() => _ChickDogCategoryDetailState();
}

class _ChickDogCategoryDetailState extends State<ChickDogCategoryDetail> {
  @override
  void initState() {
    super.initState();
    switchCategory(widget.title);
  }

  switchCategory(title) {
    if (controller.subcat.contains(title)) {
      productMethod = FireStoreServices.getSubCategoryProduct(title);
    } else {
      productMethod = FireStoreServices.getProducts(title);
    }
  }

  var controller = Get.find<productController>();
  dynamic productMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: widget.title!.text
                .fontFamily(bold)
                .color(const Color(0xFFCA7867))
                .make()),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    children: List.generate(
                  controller.subcat.length,
                  (index) => "${controller.subcat[index]}"
                      .text
                      .size(14)
                      .fontFamily(semibold)
                      .color(Colors.black)
                      .makeCentered()
                      .box
                      .black
                      .size(150, 60)
                      .roundedSM
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .make()
                      .onTap(() {
                    switchCategory("${controller.subcat[index]}");
                    setState(() {});
                  }),
                )),
              ),
            ),
            20.heightBox,
            StreamBuilder(
                // stream: FireStoreServices.getProducts(widget.title),
                stream: productMethod,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: Center(
                        child: loadingIndicator(),
                      ),
                    );
                  } else if (snapshot.data!.docs.isEmpty) {
                    return Expanded(
                      child: "No Product Find!!.. see again "
                          .text
                          .color(Colors.black)
                          .makeCentered(),
                    );
                  } else {
                    var data = snapshot.data!.docs;
                    return Expanded(
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 350,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: ((context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['p_images'][0],
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  "${data[index]['product_name']}"
                                      .text
                                      .fontFamily(semibold)
                                      .color(Colors.black)
                                      .make(),
                                  10.heightBox,
                                  "${data[index]['p_price']}"
                                      .numCurrency
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                ],
                              )
                                  .box
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .white
                                  .outerShadow2Xl
                                  .roundedSM
                                  .padding(const EdgeInsets.all(18))
                                  .make()
                                  .onTap(() {
                                // controller.checkIfFav(data[index]);
                                Get.to(() => ChickItemDetails(
                                    title: "${data[index]['product_name']}",
                                    data: data[index]));
                              });
                            })));
                  }
                }),
          ],
        ));
  }
}
