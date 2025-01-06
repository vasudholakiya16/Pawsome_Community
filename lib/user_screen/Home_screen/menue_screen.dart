import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pass_app_ultron_techonology/Doctor_screen/Chat_screen/apis.dart';
import 'package:pass_app_ultron_techonology/Doctor_screen/Chat_screen/dialoges.dart';
import 'package:pass_app_ultron_techonology/Splesh_screen/selection_screen.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/user_screen/Home_screen/home_screen.dart';
import 'package:pass_app_ultron_techonology/user_screen/Home_screen/search_card.dart';
import 'package:pass_app_ultron_techonology/user_screen/Wishlist_screen/wishlist_screen.dart';
import 'package:pass_app_ultron_techonology/user_screen/controller/authcontroller.dart';

class MenueScreen extends StatelessWidget {
  const MenueScreen({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Menu.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 50),
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100, left: 20),
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/g3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 100, left: 20),
                    child: Column(
                      children: [
                        Text(data != null
                            ? data['name'] ?? 'Unknown'
                            : 'No Data Available'),

                        // Text(
                        //   'Shiv Shanked',
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(height: 5),
                        Text(
                          'Welcome back ! 🔥',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Add profile section
              const SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/home.png',
                      width: 30,
                      height: 30,
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      Get.to(() => const HomeScreen());
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 200,
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/Group.png',
                      width: 30,
                      height: 30,
                    ),
                    title: const Text(
                      'Search',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      Get.to(() => const SearchCard());
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 200,
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/Vector.png',
                      width: 30,
                      height: 30,
                    ),
                    title: const Text(
                      'Favourite',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      Get.to(() => const Favourite());
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 200,
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/Vector_h.png',
                      width: 30,
                      height: 30,
                    ),
                    title: const Text(
                      'Health',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      Get.to(() => const Favourite());
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 200,
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/icons/Vector_m.png',
                      width: 30,
                      height: 30,
                    ),
                    title: const Text(
                      'Message',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      //
                      // Get.to(() => const ChatScreen(user: null));
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 200,
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 20),
                    child: FloatingActionButton.extended(
                      backgroundColor: punk,
                      onPressed: () async {
                        //for showing progress dialog
                        Dialogs.showProgressBar(context);

                        await APIs.updateActiveStatus(false);

                        //sign out from app
                        await APIs.auth.signOut().then((value) async {
                          await GoogleSignIn().signOut().then((value) {
                            //for hiding progress dialog
                            Navigator.pop(context);

                            //for moving to home screen
                            Navigator.pop(context);

                            // APIs.auth = FirebaseAuth.instance;

                            //replacing home screen with login screen
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const UserDoctor()));
                          });
                        });
                      },
                      label: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
