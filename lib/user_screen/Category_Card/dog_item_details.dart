import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pass_app_ultron_techonology/Chat_screen/MessageScreen.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:pass_app_ultron_techonology/user_screen/same_code/outButton.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/product_controller.dart';

class DogItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const DogItemDetails({super.key, required this.title, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(productController());
    final mq = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF0EA),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.resetValues();
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: title != null
              ? title!.text.color(Colors.black).fontFamily(bold).make()
              : const Text('No Title'), // Handle null title gracefully
          actions: [
            IconButton(
              onPressed: () {
                // Share.share('Your data to be shared here');
              },
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              ),
            ),
            Obx(() => IconButton(
                  onPressed: () {
                    if (controller.isFav.value) {
                      controller.removeFromWishlist(data.id, context);
                      controller.isFav(false);
                    } else {
                      controller.addToWishlist(data.id, context);
                      controller.isFav(true);
                    }
                  },
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: controller.isFav.value ? redColor : Colors.black,
                  ),
                )),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: VxSwiper.builder(
                      autoPlay: false,
                      height: 270,
                      itemCount: data['p_images'].length,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                16), // Adjust the radius as needed
                            child: Image.network(
                              data["p_images"][index],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: mq.size.width * 0.0, // 0% of the screen width
                    bottom: mq.size.height * 0.0, // 0% of the screen height
                    child: Stack(
                      children: [
                        Container(
                          width: mq.size.width,
                          height:
                              mq.size.height * 0.47, // 20% of the screen height
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(1.0),
                                spreadRadius: 7,
                                blurRadius: 9,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        // Title and some extra details
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0,
                                0), // 16 pixels top, 16 pixels horizontal
                            child: title!.text
                                .size(18)
                                .color(Colors.black)
                                .fontFamily(bold)
                                .make(),
                          ),
                        ),
                        // Show price
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 5.0, 0),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 50.0,
                                    ),
                                    "${data['p_price']}"
                                        .numCurrency
                                        .text
                                        .color(redColor)
                                        .fontFamily(bold)
                                        .size(16)
                                        .make(),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 75.0, 5.0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height:
                                      10), // Add some spacing between text and image
                              Image.asset(
                                'assets/images/Subtract1.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 40.0,
                          top: 105.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['p_sex'],
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 50.0,
                          top: 133.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Sex"
                                  .text
                                  .color(Colors.black)
                                  .fontFamily(semibold)
                                  .size(14)
                                  .make(),
                              10.heightBox,
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              135.0, 75.0, 15.0, 13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height:
                                      10), // Add some spacing between text and image
                              Image.asset(
                                'assets/images/Subtract2.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 148.0,
                          top: 105.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['p_age'],
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 180.0,
                          top: 133.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Age"
                                  .text
                                  .color(Colors.black)
                                  .fontFamily(semibold)
                                  .size(14)
                                  .make(),
                              10.heightBox,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              250.0, 75.0, 15.0, 13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height:
                                      10), // Add some spacing between text and image
                              Image.asset(
                                'assets/images/Subtract3.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 275.0,
                          top: 105.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['p_weight'],
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 275.0,
                          top: 133.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Weight"
                                  .text
                                  .color(Colors.black)
                                  .fontFamily(semibold)
                                  .size(14)
                                  .make(),
                              // 10.heightBox,
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10.0,
                          left: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 195.0, 15.0, 13.0),
                            child: Container(
                              width: 350.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Description",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    data['p_dec'],
                                    textAlign: TextAlign.justify,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 20,
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 200.0, 50.0, 13.0),
                            child: ourButton(
                              color: punk,
                              textColor: whiteColor,
                              title: "Adopt Now",
                              onPress: () {},
                              onpress: () {
                                _showBottomSheet(context);
                                VxToast.show(context, msg: "Adopt Now");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    final mq = MediaQuery.of(context).size; // Initialize mq here

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: mq.height * .03,
            bottom: mq.height * .05,
          ),
          children: [
// Code for a email Information
            Center(
              child: SizedBox(
                height: 50, // Height of the button
                width: 350, // Width of the button
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Copy the text to the clipboard
                    Clipboard.setData(ClipboardData(text: data["p_email"]));
                    // Show a message indicating that the text has been copied
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Text copied to clipboard'),
                    ));
                    // Optional: Add your button onPressed logic here
                    print('Button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFFFF),
                  ),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                          width: 8), // Adjust the space between icon and text
                      Text(
                        // Replace 'data[""]' with your dynamic data
                        data["p_email"],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  icon: const Icon(
                    Icons.copy,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            10.heightBox,
// Code for a phone  Information
            Center(
              child: SizedBox(
                height: 50, // Height of the button
                width: 350, // Width of the button
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Copy the text to the clipboard
                    Clipboard.setData(ClipboardData(text: data["p_phoneNum"]));
                    // Show a message indicating that the text has been copied
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Text copied to clipboard'),
                    ));
                    // Optional: Add your button onPressed logic here
                    print('Button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFFFF),
                  ),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                          width: 8), // Adjust the space between icon and text
                      Text(
                        // Replace 'data[""]' with your dynamic data
                        data["p_phoneNum"],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  icon: const Icon(
                    Icons.phone,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            10.heightBox,
            Center(
              child: SizedBox(
                height: 50, // Height of the button
                width: 300, // Width of the button
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button onPressed logic here
                    Get.to(() => const MessageScreen());
                    print('Button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCA7867)),
                  child: const Text(
                    'Message',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
