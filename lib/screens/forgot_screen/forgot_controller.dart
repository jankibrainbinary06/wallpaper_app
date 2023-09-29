import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wallpaperapp/screens/sign_in_screen/sign_in_screen.dart';
import 'package:wallpaperapp/utils/colorRes.dart';

class ForgotPasswordScreenController extends GetxController{

  RxBool isSequer = false.obs;
  RxBool isConfirmSequer = false.obs;

  RxString email = ''.obs;
  RxString emailError = ''.obs;

  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString passwordErrorMessage = "".obs;
  RxString confirmPasswordErrorMessage = "".obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController resentEmailController = TextEditingController();
  TextEditingController resentPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  CollectionReference user = FirebaseFirestore.instance.collection('user');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void setEmail(String value) {
    email.value = value.trim();
  }

  validateEmail() {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$',
    );
    if (email.value.isEmpty) {
      emailError.value = 'Email can not be empty';
    } else if (!emailRegex.hasMatch(email.value)) {
      emailError.value = 'Invalid email format';
    } else {
      emailError.value = "";
    }

  }



  void setPassword(String value) {
    password.value = value.trim();
  }
  validatePassword() {
    if (password.value.isEmpty) {
      passwordErrorMessage.value = 'Password can not be empty';
    } else if (password.value.length < 8) {
      passwordErrorMessage.value = 'Password be at least 8 characters';
    } else {
      passwordErrorMessage.value = "";
    }
  }

  PinTheme submitPinTheme() {
    return PinTheme(
        height: 55,
        width: 55,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        textStyle: const TextStyle(fontSize: 20,color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border.all(color: ColorRes.splashButton),
          borderRadius: BorderRadius.circular(5),
        ));
  }

  final defaultTheme = PinTheme(
    height: 55,
    width: 55,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    textStyle: const TextStyle(
      fontSize: 15,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: ColorRes.white.withOpacity(0.50),),
      borderRadius: BorderRadius.circular(5),
    ),

  );

  void setConfirmPassword(String value) {
    confirmPassword.value = value.trim();
  }

  validateConfirmPassword() {
    if (confirmPassword.value.isEmpty) {
      confirmPasswordErrorMessage.value = 'Confirm Password can not be empty';
    } else if (confirmPassword.value.length < 8) {
      confirmPasswordErrorMessage.value = 'Confirm Password be at least 8 characters';
    } else {
      confirmPasswordErrorMessage.value = "";
    }
  }


  void resetPassword(email) async {
    await user.get().then((value) {

     List data = value.docs.where((element) => (element['email'].toString().toLowerCase() == email.toString().toLowerCase())).toList();

      if(data.isNotEmpty) {
        value.docs.forEach((element) async {
          if (element['email'] == email) {
            try {
              await firebaseAuth.sendPasswordResetEmail(email: email);
              Future.delayed(
                const Duration(seconds: 1),
                    () {
                  Get.offAll(() => SignInScreen());
                },
              );
              Get.snackbar(
                  'Success!!', 'Password reset link has been sent to $email',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.white);
            } catch (e) {
              Get.snackbar('Error', 'Invalid username!',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.red,colorText: Colors.red);
            }
          }
          else {

          }
        });
      }
      else{

            Get.snackbar('Error', 'Invalid username!', snackPosition: SnackPosition.TOP,backgroundColor: Colors.red,colorText: Colors.white);
      }

    });


  }
}