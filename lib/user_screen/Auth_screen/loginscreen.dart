import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/strings.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:pass_app_ultron_techonology/user_screen/Auth_screen/signupscreen.dart';
import 'package:pass_app_ultron_techonology/user_screen/Chat_screen/apis.dart';
import 'package:pass_app_ultron_techonology/user_screen/Home_screen/home.dart';
import 'package:pass_app_ultron_techonology/user_screen/controller/authcontroller.dart';
import 'package:velocity_x/velocity_x.dart';

import '../forgatPassScreen/ForgotPasswordScreen.dart';
import '../same_code/customText.dart';
import '../same_code/dialogs.dart';
import '../same_code/outButton.dart';
import '../same_code/splesh_screen_img.dart';
import 'database_Services.dart';
import 'signin_with_Other_option.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late MediaQueryData mq;
  final AuthService _authService = AuthService();

  final DatabaseService _dbService = DatabaseService();

  // Text Controllers
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  // Visibility state for passwords
  bool isPasswordVisible = false;

  bool isConfirmPasswordVisible = false;

  // Email validation
  // ignore: non_constant_identifier_names
  final RegExp EMAIL_VALIDATION_REGEX =
      RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");

  // Password validation
  // ignore: non_constant_identifier_names
  final RegExp PASSWORD_VALIDATION_REGEX =
      RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");

  // handles google login button click
  _handleGoogleBtnClick() {
    //for showing progress bar
    Dialogs.showProgressBar(context);

    _signInWithGoogle().then((user) async {
      //for hiding progress bar
      Navigator.pop(context);

      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

        if (await APIs.userExists() && mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Home()));
        } else {
          await APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Home()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');

      if (mounted) {
        Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      }

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  (screenHeight * 0.13).heightBox,
                  applogoWidget(context),
                  10.heightBox,
                  "LOG IN".text.fontFamily('Mplus').black.size(25).make(),
                  5.heightBox,
                  " Use Credential to Access Your Account"
                      .text
                      .gray700
                      .size(15)
                      .make(),
                  5.heightBox,
                  Obx(
                    () => Column(
                      children: [
                        customTextField(
                          hint: emailHint,
                          title: email,
                          isPass: false,
                          controller: controller.emailController,
                          validationRegulatorExpression: EMAIL_VALIDATION_REGEX,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          toggleVisibility: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                          isPasswordVisible: false,
                        ),
                        customTextField(
                          hint: password,
                          title: password,
                          isPass: true,
                          controller: controller.passwordController,
                          validationRegulatorExpression:
                              PASSWORD_VALIDATION_REGEX,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          toggleVisibility: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                          isPasswordVisible: isConfirmPasswordVisible,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => const ForgotPasswordScreen());
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFCA7867)), // Change color here
                            ),
                            child: const Text('Forgot Password'),
                          ),
                        ),
                        controller.isloading.value
                            ? Container() // Placeholder for loading indicator
                            : ourButton(
                                color: const Color(0xFFCA7867),
                                title: login,
                                textColor: whiteColor,
                                onpress: () async {
                                  controller.isloading(true);
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    if (value != null) {
                                      VxToast.show(context, msg: loggedin);
                                      Get.offAll(() => const Home());
                                    } else {
                                      controller.isloading(false);
                                    }
                                  });
                                },
                                onPress: () {},
                              ).box.width(screenWidth - 50).make(),
                        5.heightBox,
                        10.heightBox,
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: createNewAccount,
                                style: TextStyle(
                                    fontFamily: bold, color: fontGrey),
                              ),
                              TextSpan(
                                text: Signup,
                                style: TextStyle(
                                    fontFamily: bold, color: Color(0xFFCA7867)),
                              ),
                            ],
                          ),
                        ).onTap(() {
                          Get.offAll(() => const SignupScreen());
                        }),
                      ],
                    )
                        .box
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .width(screenWidth)
                        .make(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFE8ECF4),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Or Login With"),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFE8ECF4),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              _handleGoogleBtnClick();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFE8ECF4)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset("assets/images/google.png",
                                    height: 32),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              // Twitter Sign-In
                              User? user =
                                  await _authService.signInWithTwitter();
                              if (user != null) {
                                // Navigate to home screen or perform other actions
                                print(
                                    'Signed in with Twitter: ${user.displayName}');
                              } else {
                                // Handle sign-in failure
                                print('Twitter sign-in failed');
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFE8ECF4)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset("assets/images/x.png",
                                    height: 32),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  (screenHeight * 0.08).heightBox,
                ],
              ),
            ),
            Obx(() {
              if (controller.isloading.value) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
