// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/dashboar_screen/dashboard_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';

class SignInController extends GetxController {
  RxBool isSequer = true.obs;
  RxBool loader = false.obs;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  RxString email = ''.obs;
  RxString emailError = ''.obs;

  RxString password = ''.obs;
  RxString passwordErrorMessage = "".obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      passwordErrorMessage.value = 'Password must be at least 8 characters';
    } else {
      passwordErrorMessage.value = "";
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      loader.value = true;
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      loader.value = false;
      Future.delayed(
        const Duration(seconds: 1),
        () {
          Get.offAll(() => DashBoardScreen());
          getUserDocId(email);
          PrefService.setValue('isUser', true);
        },
      );
    } catch (e) {
      loader.value = false;

      Get.snackbar('Error', 'Invalid username/password!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: CupertinoColors.destructiveRed,
          colorText: CupertinoColors.white);
    }
  }

  getUserDocId(String email) async {
    await user.get().then((value) {
      value.docs.forEach((element) {
        if (element['email'] == email) {
          var id = element.id;
          PrefService.setValue('docId', id);
        } else {}
      });
    });
  }
}
