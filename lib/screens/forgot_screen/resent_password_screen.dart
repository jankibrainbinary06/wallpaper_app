// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/forgot_screen/forgot_controller.dart';

import 'package:wallpaperapp/screens/splesh_screen/splash_screen_screen.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/colorRes.dart';
import 'package:wallpaperapp/utils/strings.dart';

class ResentPasswordScreen extends StatelessWidget {
  ResentPasswordScreen({super.key});

  ForgotPasswordScreenController resentPasswordScreenController =
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
                          StringRes.ResetPassword,
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
                    Obx(
                      () => TextFieldCommonWidget2(
                        onTapIcon: () {
                          if (resentPasswordScreenController
                                  .isConfirmSequer.value ==
                              false) {
                            resentPasswordScreenController
                                .isConfirmSequer.value = true;
                          } else {
                            resentPasswordScreenController
                                .isConfirmSequer.value = false;
                          }
                        },
                        controller:
                            resentPasswordScreenController.passwordController,
                        onChanged: (value) =>
                            resentPasswordScreenController.setPassword(value),
                        PrefixIcon: AssetRes.LockIcon,
                        obscureText: resentPasswordScreenController
                            .isConfirmSequer.value,
                        hintText: "enter password",
                        isShowViciblity: true,
                      ),
                    ),
                    Obx(
                      () => resentPasswordScreenController
                              .passwordErrorMessage.value.isEmpty
                          ? const SizedBox()
                          : Text(
                              resentPasswordScreenController
                                  .passwordErrorMessage.value,
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
                          if (resentPasswordScreenController.isSequer.value ==
                              false) {
                            resentPasswordScreenController.isSequer.value =
                                true;
                          } else {
                            resentPasswordScreenController.isSequer.value =
                                false;
                          }
                        },
                        controller: resentPasswordScreenController
                            .resentPasswordController,
                        onChanged: (value) => resentPasswordScreenController
                            .setConfirmPassword(value),
                        PrefixIcon: AssetRes.LockIcon,
                        hintText: "enter confirm password",
                        isShowViciblity: true,
                        obscureText:
                            resentPasswordScreenController.isSequer.value,
                      ),
                    ),
                    Obx(
                      () => resentPasswordScreenController
                              .confirmPasswordErrorMessage.value.isEmpty
                          ? const SizedBox()
                          : Text(
                              resentPasswordScreenController
                                  .confirmPasswordErrorMessage.value,
                              style: TextStyle(
                                  color: const Color(0xFFA2000F),
                                  fontSize: Get.height * 0.02)),
                    ),

                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          await resentPasswordScreenController
                              .validatePassword();
                          await resentPasswordScreenController
                              .validateConfirmPassword();
                          if (resentPasswordScreenController
                                  .passwordErrorMessage.isEmpty &&
                              resentPasswordScreenController
                                  .confirmPasswordErrorMessage.isEmpty) {
                            Get.to(const SplashScreen());
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
                    // SizedBox(
                    //   height: Get.height * 0.07,
                    // ),
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
      ],
    );
  }
}
