import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:wallpaperapp/screens/dashboar_screen/dashboard_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';

class SignUpController extends GetxController {
  RxBool isSequer = true.obs;
  RxBool isConfirmSequer = true.obs;
  RxBool loader = false.obs;

  RxString email = ''.obs;
  RxString emailError = ''.obs;

  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString passwordErrorMessage = "".obs;
  RxString confirmPasswordErrorMessage = "".obs;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

  void setConfirmPassword(String value) {
    confirmPassword.value = value.trim();
  }

  validateConfirmPassword() {
    if (confirmPassword.value.isEmpty) {
      confirmPasswordErrorMessage.value = 'Confirm Password can not be empty';
    } else if (confirmPassword.value.length < 8) {
      confirmPasswordErrorMessage.value =
          'Confirm Password be at least 8 characters';
    } else if (confirmPassword.value != password.value) {
      confirmPasswordErrorMessage.value = 'Please enter same password';
    } else {
      confirmPasswordErrorMessage.value = "";
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      loader.value = true;
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      loader.value = false;
      Future.delayed(
        const Duration(seconds: 1),
        () async {
          Get.offAll(() => DashBoardScreen());
          await userAddTOFirebase(email);
        },
      );
    } catch (e) {
      loader.value = false;

      Get.snackbar('Error', 'This account is already exits!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: CupertinoColors.destructiveRed,
          colorText: CupertinoColors.white);
    }
  }

  Future<void> userAddTOFirebase(String email) async {
    return user.add({'email': email, 'favourite': []}).then((value) {
      PrefService.setValue('docId', value.id);
      PrefService.setValue('isUser', true);
    }).catchError((error) {});
  }
}
