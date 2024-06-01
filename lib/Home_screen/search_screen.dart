import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/Category_Card/dog_item_details.dart';
import 'package:pass_app_ultron_techonology/Services/firestore_services.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:pass_app_ultron_techonology/same_code/loadingIndicator.dart';
import 'package:velocity_x/velocity_x.dart';


class SearchScreen extends StatelessWidget {
  final String? title;

  const SearchScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
      ),
      body: FutureBuilder(
        future: FireStoreServices.searchProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child:
              const Text('No Search Found!').text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            var filtered = data
                .where(
                  (element) => element['product_name']
                  .toString()
                  .toLowerCase()
                  .contains(title!.toLowerCase()),
            )
                .toList();
            print(data[0]['product_name']);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 350),
                children: filtered
                    .mapIndexed((currentValue, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      filtered[index]['p_images'][0],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    const Spacer(),
                    10.heightBox,
                    "${filtered[index]['product_name']}"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    "${filtered[index]['p_price']}"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(16)
                        .make(),
                  ],
                )
                    .box
                    .shadowMd
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .white
                    .roundedSM
                    .padding(const EdgeInsets.all(18))
                    .make()
                    .onTap(() {
                  Get.to(() => DogItemDetails(
                    title: "${filtered[index]['product_name']}",
                    data: filtered[index],
                  ));
                }))
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
