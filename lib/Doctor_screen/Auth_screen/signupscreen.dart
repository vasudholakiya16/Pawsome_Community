import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pass_app_ultron_techonology/Doctor_screen/Auth_screen/login_screen_doctor.dart';
import 'package:pass_app_ultron_techonology/Doctor_screen/Chat_screen/apis.dart';
import 'package:pass_app_ultron_techonology/Doctor_screen/Home/doctor_home_screen.dart';
import 'package:pass_app_ultron_techonology/Doctor_screen/controller/auth_controller.dart';
import 'package:pass_app_ultron_techonology/Doctor_screen/same_code/app_logo.dart';
import 'package:pass_app_ultron_techonology/consts/colors.dart';
import 'package:pass_app_ultron_techonology/consts/firebase_constent.dart';
import 'package:pass_app_ultron_techonology/consts/strings.dart';
import 'package:pass_app_ultron_techonology/consts/styles.dart';
import 'package:pass_app_ultron_techonology/user_screen/same_code/customText.dart';
import 'package:pass_app_ultron_techonology/user_screen/same_code/outButton.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreenDoctor extends StatefulWidget {
  const SignupScreenDoctor({super.key});

  @override
  State<SignupScreenDoctor> createState() => _SignupScreenDoctorState();
}

class _SignupScreenDoctorState extends State<SignupScreenDoctor> {
  String? _image;
  bool? isCheck = false;
  var controller = Get.put(AuthControllerDoctor());

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
  final EMAIL_VALIDATION_REGEX = RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$");

  // Password validation
  // ignore: non_constant_identifier_names
  final PASSWORD_VALIDATION_REGEX =
      RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");

  // Name validation
  // ignore: non_constant_identifier_names
  final NAME_VALIDATION_REGEX = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/imgBackgrounddoctor.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (screenHeight * 0.06).heightBox,
                    applogoWidgetDoctor(context),
                    15.heightBox,
                    "SIGN UP".text.fontFamily(bold).black.size(18).make(),
                    15.heightBox,
                    "Enter your credentials to continue"
                        .text
                        .fontFamily(bold)
                        .black
                        .size(18)
                        .make(),
                    10.heightBox,
                    Column(
                      children: [
                        customTextField(
                          hint: NameHint,
                          title: Name,
                          controller: nameController,
                          isPass: false,
                          validationRegulatorExpression: NAME_VALIDATION_REGEX,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            } else if (!NAME_VALIDATION_REGEX.hasMatch(value)) {
                              return 'Please enter a valid name';
                            }
                            return null;
                          },
                          toggleVisibility: () {},
                          isPasswordVisible: false,
                        ),
                        customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,
                          isPass: false,
                          validationRegulatorExpression: EMAIL_VALIDATION_REGEX,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!EMAIL_VALIDATION_REGEX
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          toggleVisibility: () {},
                          isPasswordVisible: false,
                        ),
                        customTextField(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,
                          isPass: true,
                          validationRegulatorExpression:
                              PASSWORD_VALIDATION_REGEX,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (!PASSWORD_VALIDATION_REGEX
                                .hasMatch(value)) {
                              return 'Password must contain at least 8 characters, including upper/lower case and numbers';
                            }
                            return null;
                          },
                          toggleVisibility: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          isPasswordVisible: isPasswordVisible,
                        ),
                        customTextField(
                          hint: passwordHint,
                          title: ConfirmPassword,
                          controller: confirmPasswordController,
                          isPass: true,
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
                        uploadyourLicense(context, () {
                          _showBottomSheet();
                        }),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFFF48B76),
                              checkColor: whiteColor,
                              value: isCheck,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue;
                                });
                              },
                            ),
                            5.widthBox,
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "I agree to the",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: fontGrey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: termAndCond,
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: redColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "&",
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: fontGrey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: privacyPolicy,
                                      style: TextStyle(
                                        fontFamily: regular,
                                        color: redColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        5.heightBox,
                        ourButton(
                          color: isCheck == true
                              ? const Color(0xFFF48B76)
                              : lightGrey,
                          title: Signup,
                          textColor: whiteColor,
                          onpress: () async {
                            if (isCheck == true) {
                              if (_formKey.currentState!.validate()) {
                                controller.isloading(true);
                                try {
                                  await controller.SignupMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ).then((value) {
                                    return controller.storeUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      Name: nameController.text,
                                    );
                                  }).then((value) {
                                    VxToast.show(context, msg: loggedin);
                                    if (mounted) {
                                      Get.offAll(() => const HomeDoctor());
                                    }
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isloading(false);
                                }
                              }
                            } else {
                              VxToast.show(context,
                                  msg:
                                      'Please accept the terms and conditions');
                            }
                          },
                          onPress: () {},
                        ).box.width(screenWidth - 30).make(),
                        10.heightBox,
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(16))
                        .width(screenWidth - 30)
                        .make(),
                    10.heightBox,
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: alreadyHaveAccount,
                            style: TextStyle(fontFamily: bold, color: fontGrey),
                          ),
                          TextSpan(
                            text: login,
                            style: TextStyle(fontFamily: bold, color: redColor),
                          ),
                        ],
                      ),
                    ).onTap(() {
                      Get.to(() => const LoginScreenDoctor());
                    }),
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            if (controller.isloading.value) {
              return Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }

  // bottom sheet for picking a profile picture for user
  void _showBottomSheet() {
    final Size mq = MediaQuery.of(context).size;

    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            padding:
                EdgeInsets.only(top: mq.height * .03, bottom: mq.height * .05),
            children: [
              //pick profile picture label
              const Text('Pick Profile Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),

              //for adding some space
              SizedBox(height: mq.height * .02),

              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //pick from gallery button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: Size(mq.width * .3, mq.height * .15)),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 80);
                        if (image != null) {
                          log('Image Path: ${image.path}');
                          setState(() {
                            _image = image.path;
                          });

                          APIs.updateProfilePicture(File(_image!));

                          // for hiding bottom sheet
                          if (mounted) Navigator.pop(context);
                        }
                      },
                      child: Image.asset('assets/images/add_image.png')),

                  //take picture from camera button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          fixedSize: Size(mq.width * .3, mq.height * .15)),
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();

                        // Pick an image
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.camera, imageQuality: 80);
                        if (image != null) {
                          log('Image Path: ${image.path}');
                          setState(() {
                            _image = image.path;
                          });

                          APIs.updateProfilePicture(File(_image!));

                          // for hiding bottom sheet
                          if (mounted) Navigator.pop(context);
                        }
                      },
                      child: Image.asset('assets/images/camera.png')),
                ],
              )
            ],
          );
        });
  }
}
