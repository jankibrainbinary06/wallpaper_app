// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/forgot_screen/forgot_controller.dart';

import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/colorRes.dart';
import 'package:wallpaperapp/utils/strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  ForgotPasswordScreenController forgotPasswordScreenController =
      Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.53,
                    // width: Get.width * 0.8,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AssetRes.spleashScrren))),
                  ),
                  Positioned(
                    //top: Get.height * 0.42,
                    bottom: 0,
                    left: Get.width * 0.04,
                    child: Column(
                      children: [
                        Text(
                          StringRes.ForgotPassword,
                          style: TextStyle(
                              fontSize: Get.width * 0.08,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "boldfont"),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Container(
                          height: 3,
                          width: Get.width * 0.55,
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
                padding: EdgeInsets.only(
                    left: Get.width * 0.05,
                    top: Get.height * 0.04,
                    right: Get.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringRes.ResetYourPassword,
                      style: TextStyle(
                          fontSize: Get.width * 0.04,
                          color: Colors.white,
                          fontFamily: "regularfont"),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    TextFieldCommonWidget2(
                      controller:
                          forgotPasswordScreenController.emailController,
                      onChanged: (value) =>
                          forgotPasswordScreenController.setEmail(value),
                      PrefixIcon: AssetRes.postIcon,
                      hintText: "enter email ID",
                      isShowViciblity: false,
                    ),
                    Obx(
                      () => forgotPasswordScreenController
                              .emailError.value.isEmpty
                          ? const SizedBox()
                          : Text(
                              forgotPasswordScreenController.emailError.value,
                              style: TextStyle(
                                  color: const Color(0xFFA2000F),
                                  fontSize: Get.height * 0.02)),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          await forgotPasswordScreenController.validateEmail();
                          if (forgotPasswordScreenController
                              .emailError.isEmpty) {
                            forgotPasswordScreenController.resetPassword(
                                forgotPasswordScreenController
                                    .emailController.text);
                            // Get.to(ForgotPasswordOtpScreen());
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
                            StringRes.Continue,
                            style: TextStyle(
                                //  fontWeight: FontWeight.w600,
                                fontSize: Get.width * 0.06,
                                color: Colors.black,
                                fontFamily: "boldfont"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
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
        //   SizedBox(height: height * 0.015),
      ],
    );
  }
}
