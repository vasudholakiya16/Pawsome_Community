import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/Category_Card/dog_item_details.dart';
import 'package:pass_app_ultron_techonology/Home_screen/search_card.dart';
import 'package:pass_app_ultron_techonology/Services/firestore_services.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:pass_app_ultron_techonology/same_code/homeScreen_Image.dart';
import 'package:pass_app_ultron_techonology/same_code/loadingIndicator.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Auth_screen/loginscreen.dart';
import '../Category_Card/cat_category_screen.dart';
import '../Category_Card/chick_category_screen.dart';
import '../Category_Card/dog_category_screen.dart';
import '../Category_Card/fish_category_screen.dart';
import '../consts/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String location = 'Null, Press Button';
  String address = 'search';
  bool showAddress = false;

  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser == null) {
      Get.to(() => LoginScreen());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF0EA),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.06),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.to(() => EditProfileScreen() );
                    print('App logo tapped!');
                  },
                  child: applogoWidget1().paddingOnly(left: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !showAddress,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Position position = await _getGeoLocationPosition();
                          // location =
                          // 'Lat: ${position.latitude} , Long: ${position.longitude}';
                          // getAddressFromLatLong(position);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFCA7867),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Get Location',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: showAddress,
                      child: const SizedBox(width: 10),
                    ),
                    Visibility(
                      visible: showAddress,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: punk,
                          ),
                          Text(
                            address,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).paddingOnly(left: screenWidth * 0.08),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() =>const SearchCard() );
                      //
                    },
                    child: search_Bar(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            VxSwiper.builder(
              aspectRatio: 15 / 7,
              autoPlay: false,
              height: screenHeight * 0.2,
              itemCount: slidersList.length,
              enlargeCenterPage: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    slidersList[index],
                    fit: BoxFit.fill,
                  ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 4)).make(),
                );
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  "Category".text.fontFamily('Mplus').black.size(18).make(),
                ],
              ),
            ),
        
        
            Padding(
              padding: const EdgeInsets.all(3.5),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const DogCategoryScreen(title: 'Category of Dog',));
        
                      print('Dog category clicked');
                    },
                    child: categoryScreen('assets/images/dog0.png', 'Dog',context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const CatCategoryScreen(title: 'Category of Cat',));
                      print('Cat category clicked');
                    },
                    child: categoryScreen('assets/images/cat_face_main_page.png', 'Cat',context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const FishCategoryScreen(title: 'Category of fish',));
                      // FishCategoryScreen
                      print('Fish category clicked');
                    },
                    child: categoryScreen('assets/images/fish_main_page.png', 'Fish',context),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ChickCategoryScreen(title: 'Category of Chick',));
                      // ChickCategoryScreen
                      print('Chick category clicked');
                    },
                    child: categoryScreen('assets/images/chick_main_page.png', 'Chick',context),
                  ),
        
                ],
              ),
        
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: [
                  "Most Visited".text.fontFamily('Mplus').black.size(20).make(),
                ],
              ),
            ),
            10.heightBox,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder(
            future: FireStoreServices.getFeaturedProduct(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: loadingIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return "No featured product found".text.color(Colors.white).makeCentered();
              } else {
                var featureproductData = snapshot.data!.docs;
                return Row(
                  children: List.generate(
                    featureproductData.length,
                        (index) => GestureDetector(
                      onTap: () {
                        Get.to(() => DogItemDetails(
                          title: "${featureproductData[index]['product_name']}",
                          data: featureproductData[index],
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              featureproductData[index]['p_images'][0],
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            10.heightBox,
                            "${featureproductData[index]['product_name']}"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.heightBox,
                            "${featureproductData[index]['p_price']}"
                                .numCurrency
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
            30.heightBox,

        ],
        ),
      ),
    );
  }
}
