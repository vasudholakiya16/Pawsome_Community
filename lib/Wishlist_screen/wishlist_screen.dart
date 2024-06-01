import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/Category_Card/dog_item_details.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Services/firestore_services.dart';
import '../consts/colors.dart';
import '../consts/styles.dart';
import '../same_code/loadingIndicator.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  Future<void> _removeFromWishlist(String productId) async {
    await FirebaseFirestore.instance.collection('products').doc(productId).update({
      'p_wishlist': FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Favourite'.text.fontFamily(bold).color(const Color(0xFFCA7867)).make(),
      ),
      body: StreamBuilder(
        stream:FireStoreServices.getWishlist(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          }else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No Favourite Found !".text.color(const Color(0xFFCA7867)).make(),
            );
          }  else {
            var allproductData = snapshot.data!.docs;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allproductData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              allproductData[index]['p_images'][0],
                              width: 300,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "${allproductData[index]['p_price']}"
                                .numCurrency
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                            GestureDetector(
                              onTap: () async {
                                await _removeFromWishlist(allproductData[index].id);
                              },
                              child: const Icon(Icons.favorite, color: redColor,size: 30),
                            ),
                          ],
                        ),
                      ],
                    )
                        .box
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .white.outerShadow2Xl
                        .roundedLg
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
              ),
            );
          }
        },
      ),
    );
  }
}

