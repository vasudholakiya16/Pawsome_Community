import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pass_app_ultron_techonology/same_code/rounded_btn.dart';


import '../consts/colors.dart';
import '../same_code/utils.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final emailController =TextEditingController();
  final auth = FirebaseAuth.instance ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color:punk),
                  borderRadius: BorderRadius.circular(40.0), // Set the border radius
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:punk),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),

            const SizedBox(height: 40,),
            RoundButton(title: 'Forgot', onTap: (){
              auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                Utils().toastMessage('We have sent you email to recover password, please check email');
              }).onError((error, stackTrace){
                Utils().toastMessage(error.toString());
              });
            })
          ],
        ),
      ),
    );
  }
}