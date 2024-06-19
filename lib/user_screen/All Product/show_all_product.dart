import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:pass_app_ultron_techonology/user_screen/Category_Card/dog_item_details.dart';

import 'package:velocity_x/velocity_x.dart';
import '../Services/firestore_services.dart';

import '../same_code/loadingIndicator.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'All Products'
            .text
            .fontFamily(bold)
            .color(const Color(0xFFCA7867))
            .make(),
      ),
      body: StreamBuilder(
        stream: FireStoreServices.allproducts(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          } else {
            var allproductData = snapshot.data!.docs;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allproductData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          allproductData[index]['p_images'][0],
                          width: 150,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(),
                      10.heightBox,
                      "${allproductData[index]['product_name']}"
                          .text
                          .fontFamily(semibold)
                          .color(Colors.black)
                          .make(),
                      10.heightBox,
                      "${allproductData[index]['p_price']}"
                          .numCurrency
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(16)
                          .make(),
                    ],
                  )
                      .box
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .white
                      .outerShadow2Xl
                      .roundedSM
                      .padding(const EdgeInsets.all(18))
                      .make()
                      .onTap(() {
                    Get.to(() => DogItemDetails(
                          title: "${allproductData[index]['product_name']}",
                          data: allproductData[index],
                        ));
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }
}
