// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/forgot_screen/forgot_screen.dart';
import 'package:wallpaperapp/screens/sign_in_screen/sign_in_controller.dart';
import 'package:wallpaperapp/screens/sign_up_screen/sign_up_screen.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/colorRes.dart';
import 'package:wallpaperapp/utils/strings.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(child: Obx(() {
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Get.height * 0.48,
                        // width: Get.width * 0.8,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(AssetRes.spleashScrren))),
                      ),
                      Positioned(
                        bottom: Get.height * 0.06,
                        left: Get.width * 0.04,
                        child: Column(
                          children: [
                            Text(
                              StringRes.SignIn,
                              style: TextStyle(
                                  fontSize: Get.width * 0.101,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "boldfont"),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Container(
                              height: 3,
                              width: Get.width * 0.22,
                              decoration: BoxDecoration(
                                  color: ColorRes.splashButton,
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldCommonWidget2(
                          controller: signInController.emailController,
                          onChanged: (value) =>
                              signInController.setEmail(value),
                          PrefixIcon: AssetRes.postIcon,
                          hintText: "enter email ID",
                          isShowViciblity: false,
                        ),
                        Obx(
                          () => signInController.emailError.value.isEmpty
                              ? const SizedBox()
                              : Text(signInController.emailError.value,
                                  style: TextStyle(
                                      color: const Color(0xFFA2000F),
                                      fontSize: Get.height * 0.02)),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Obx(
                          () => TextFieldCommonWidget2(
                            onTapIcon: () {
                              if (signInController.isSequer.value == false) {
                                signInController.isSequer.value = true;
                              } else {
                                signInController.isSequer.value = false;
                              }
                            },
                            controller: signInController.passwordController,
                            onChanged: (value) =>
                                signInController.setPassword(value),
                            obscureText: signInController.isSequer.value,
                            PrefixIcon: AssetRes.LockIcon,
                            hintText: "enter password",
                            isShowViciblity: true,
                          ),
                        ),
                        Obx(
                          () => signInController
                                  .passwordErrorMessage.value.isEmpty
                              ? const SizedBox()
                              : Text(
                                  signInController.passwordErrorMessage.value,
                                  style: TextStyle(
                                      color: const Color(0xFFA2000F),
                                      fontSize: Get.height * 0.02)),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.08),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(ForgotPasswordScreen());
                                },
                                child: const Text(
                                  "forgot password?",
                                  style: TextStyle(
                                      textBaseline: TextBaseline.ideographic,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              signInController.validateEmail();
                              signInController.validatePassword();
                              if (signInController.emailError.isEmpty &&
                                  signInController
                                      .passwordErrorMessage.isEmpty) {
                                signInController.signIn(
                                    signInController.emailController.text,
                                    signInController.passwordController.text);
                              }
                            },
                            child: Container(
                              height: Get.height * 0.09,
                              width: Get.width * 0.6,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorRes.splashButton,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                StringRes.Signin,
                                style: TextStyle(
                                    //  fontWeight: FontWeight.w600,
                                    fontSize: Get.width * 0.07,
                                    color: Colors.black,
                                    fontFamily: "boldfont"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Get.width * 0.08),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don’t have an account?",
                                style: TextStyle(
                                    textBaseline: TextBaseline.ideographic,
                                    color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignUpScreen());
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    textBaseline: TextBaseline.ideographic,
                                    color: ColorRes.splashButton,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              signInController.loader.value
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox()
            ],
          );
        })),
      ),
    );
  }
}

class TextFieldCommonWidget2 extends StatelessWidget {
  late String? hintText;
  late String? PrefixIcon;
  late bool? isDateField;
  late bool? obscureText;
  late bool? isShowViciblity;
  late bool? isCheckBoxField;
  late VoidCallback? onDatePicTap;
  final TextEditingController? controller;
  final String? noText;
  final String? text;
  final List? text1;
  final RxList? textList;
  final double? RadioFieldHeight;
  final List? list;
  final RxList? selectedList;
  late bool? isShowClear;
  late VoidCallback? onTapIcon;
  late ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  late bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxCharLength;

  TextFieldCommonWidget2({
    super.key,
    this.hintText,
    this.PrefixIcon,
    this.isDateField,
    this.obscureText,
    this.onDatePicTap,
    this.isShowViciblity,
    this.isCheckBoxField,
    this.controller,
    this.noText,
    this.text,
    this.text1,
    this.textList,
    this.RadioFieldHeight,
    this.list,
    this.selectedList,
    this.isShowClear,
    this.onTapIcon,
    this.onChanged,
    this.inputFormatters,
    this.readOnly,
    this.keyboardType,
    this.maxCharLength,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: Get.height * 0.09,
          width: Get.width,
          decoration: BoxDecoration(
              color: ColorRes.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10)),
          //  margin: EdgeInsets.only(left: width * 0.035, right: width * 0.01),
          child: TextField(
            obscureText: obscureText ?? false,
            readOnly: readOnly ?? false,
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white),
            keyboardType: keyboardType,
            maxLength: maxCharLength,
            inputFormatters: inputFormatters,
            onTap: onDatePicTap,
            controller: controller,
            cursorColor: ColorRes.black,
            decoration: InputDecoration(
                counterText: "",
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: const Color(0xFFFFFFFF).withOpacity(0.55),
                    height: 1,
                    fontFamily: ""),
                contentPadding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.015, horizontal: Get.width * 0.03),
                suffixIcon: isShowViciblity == true
                    ? GestureDetector(
                        onTap: onTapIcon,
                        child: (obscureText == true)
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              ),
                      )
                    : const SizedBox(),
                prefixIcon: Image.asset(
                  PrefixIcon ?? "",
                  scale: 3.5,
                )),
          ),
        ),
        SizedBox(height: height * 0.015),
      ],
    );
  }
}
