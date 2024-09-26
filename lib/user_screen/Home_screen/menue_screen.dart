// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MenueScreen extends StatefulWidget {
//   const MenueScreen({super.key});

//   @override
//   State<MenueScreen> createState() => _MenueScreenState();
// }

// class _MenueScreenState extends State<MenueScreen> {
//   bool _isSelected = false;
//   String? name, email, image;

//   final ImagePicker _picker = ImagePicker();
//   File? selectedImage;

//   // getthesharedpref() async {
//   //   name = await SharedPreferenceHelper().getUserName();
//   //   email = await SharedPreferenceHelper()
//   //       .getUserEmail(); // Assuming there's a method for email
//   //   image = await SharedPreferenceHelper().getUserImage();
//   //   setState(() {});
//   // }

//   // ontheload() async {
//   //   await getthesharedpref();
//   // }

//   // @override
//   // void initState() {
//   //   ontheload();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffE5FBF4),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Color(0xffffffff),
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(50),
//             bottomRight: Radius.circular(50),
//           ),
//         ),
//         width: MediaQuery.of(context).size.width - 150,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 20),
//               child: Row(
//                 children: [
//                   // const ProfileBackArrow(),
//                 ],
//               ),
//             ),
//             // Add profile section
//             Container(
//               // margin: const EdgeInsets.only(top: 20, bottom: 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 200,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   // CircleAvatar(
//                   //   radius: 50,
//                   //   backgroundImage: AssetImage(
//                   //     'assets/images/Mask_Group.png',
//                   //   ) as ImageProvider,
//                   // ),
//                   // const SizedBox(height: 10),
//                   Text(
//                     name ?? 'Username',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     email ?? 'Email',
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             ListTile(
//               // leading: Image.asset(
//               //   'assets/logo/Document.png',
//               //   width: 30,
//               //   height: 30,
//               // ),
//               title: const Text(
//                 'My Orders',
//                 style: TextStyle(),
//               ),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               // leading: Image.asset(
//               //   'assets/logo/Profile.png',
//               //   width: 30,
//               //   height: 30,
//               // ),
//               title: const Text('My Profile'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               // leading: Image.asset(
//               //   'assets/logo/Location.png',
//               //   width: 30,
//               //   height: 30,
//               // ),
//               title: const Text('Delivery Address'),
//               onTap: () {
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (BuildContext context) => AddAddress()));
//               },
//             ),
//             ListTile(
//               // leading: Image.asset(
//               //   'assets/logo/Wallet.png',
//               //   width: 30,
//               //   height: 30,
//               // ),
//               title: const Text('Payment Methods'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               // leading: Image.asset(
//               //   'assets/logo/Message.png',
//               //   width: 30,
//               //   height: 30,
//               // ),
//               title: const Text('Contact Us'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),

//             const Spacer(),
//             // ourButtonWithAssets(
//             //   color: const Color(0xFF34A853),
//             //   title: 'Logout',
//             //   textColor: whiteColor,
//             //   onpress: () async {
//             //     AuthMethods authMethods = AuthMethods();
//             //     await authMethods.signOut().then((value) {
//             //       Navigator.pushReplacement(
//             //           context,
//             //           MaterialPageRoute(
//             //             builder: (context) => LoginPage(),
//             //           ));
//             //     });
//             //   },
//             //   fontsize: '16.0',
//             //   imagePath: 'assets/logo/logout.png',
//             // ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

class MenueScreen extends StatefulWidget {
  const MenueScreen({super.key});

  @override
  State<MenueScreen> createState() => _MenueScreenState();
}

class _MenueScreenState extends State<MenueScreen> {
  @override
  Widget build(BuildContext context) {
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
                    child: const Column(
                      children: [
                        Text(
                          'Shiv Shanked',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
