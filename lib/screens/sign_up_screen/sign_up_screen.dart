// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/sign_in_screen/sign_in_screen.dart';
import 'package:wallpaperapp/screens/sign_up_screen/sign_up_controller.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/colorRes.dart';
import 'package:wallpaperapp/utils/strings.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child:

          Obx(() {
            return
              Stack(
                alignment: Alignment.center,
                children: [
                Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height:   MediaQuery.of(context).size.height * 0.5,
                        // width: Get.width * 0.8,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(AssetRes.spleashScrren))),
                      ),
                      Positioned(
                        bottom: Get.height * 0.13,
                        left: Get.width * 0.04,
                        child: Column(
                          children: [
                            Text(
                              StringRes.SignUn,
                              style: TextStyle(
                                  fontSize: kIsWeb?27: Get.width * 0.09,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "boldfont"),
                            ),
                            SizedBox(
                              height: Get.height * 0.018,
                            ),
                            Container(
                              height: 3,
                              width:  kIsWeb?120:Get.width * 0.22,
                              decoration: BoxDecoration(
                                  color: ColorRes.splashButton,
                                  borderRadius: BorderRadius.circular(2)),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: Get.height * 0.41,left: Get.width * 0.04,right: Get.width * 0.04,
                        child: TextFieldCommonWidget2(
                          controller: signUpController.emailController,
                          onChanged:(value) =>  signUpController.setEmail(value),
                          PrefixIcon: AssetRes.postIcon,
                          hintText: "enter email ID",
                          isShowViciblity: false,
                        ),
                      ),
                    ],
                  ),
                  // Validation for Email
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Obx(() =>    signUpController.emailError.value.isEmpty
                            ? const SizedBox()
                            : Text(signUpController.emailError.value, style: TextStyle(color: const Color(0xFFA2000F),fontSize: Get.height * 0.02)),),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        // password
                        Obx(() =>  TextFieldCommonWidget2(
                          onTapIcon: () {

                            if(signUpController.isSequer.value == false)
                            {
                              signUpController.isSequer.value = true;
                            }
                            else
                            {
                              signUpController.isSequer.value = false;
                            }
                          },
                          controller: signUpController.passwordController,
                          onChanged:(value) =>  signUpController.setPassword(value),
                          obscureText: signUpController.isSequer.value,
                          PrefixIcon: AssetRes.LockIcon,
                          hintText: "enter password",
                          isShowViciblity: true,
                        ),),
                        Obx(() =>    signUpController.passwordErrorMessage.value.isEmpty
                            ? const SizedBox()
                            : Text(signUpController.passwordErrorMessage.value, style: TextStyle(color: const Color(0xFFA2000F),fontSize: Get.height * 0.02)),),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        // Confirm Password
                        Obx(() =>  TextFieldCommonWidget2(
                          onTapIcon: () {

                            if(signUpController.isConfirmSequer.value == false)
                            {
                              signUpController.isConfirmSequer.value = true;
                            }
                            else
                            {
                              signUpController.isConfirmSequer.value = false;
                            }
                          },
                          controller: signUpController.confirmPasswordController,
                          onChanged:(value) =>  signUpController.setConfirmPassword(value),
                          obscureText: signUpController.isConfirmSequer.value,
                          PrefixIcon: AssetRes.LockIcon,
                          hintText: "enter confirm password",
                          isShowViciblity: true,
                        ),),
                        // Validation for Password
                        Obx(() =>    signUpController.confirmPasswordErrorMessage.value.isEmpty
                            ? const SizedBox()
                            : Text(signUpController.confirmPasswordErrorMessage.value, style: TextStyle(color: const Color(0xFFA2000F),fontSize: Get.height * 0.02)),),

                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(SelectWallpaperViewScreen());
                              signUpController.validateEmail();
                              signUpController.validatePassword();
                              signUpController.validateConfirmPassword();
                              if(signUpController.emailError.isEmpty && signUpController.passwordErrorMessage.isEmpty && signUpController.confirmPasswordErrorMessage.isEmpty){
                                signUpController.signUp(signUpController.emailController.text, signUpController.passwordController.text);

                              }
                            },
                            child: Container(
                              height: kIsWeb?65:Get.height * 0.09,
                              width: kIsWeb?240:Get.width * 0.6,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorRes.splashButton,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                StringRes.Signup,
                                style: TextStyle(
                                  //  fontWeight: FontWeight.w600,
                                    fontSize: kIsWeb?24:Get.width * 0.07,
                                    color: Colors.black,
                                    fontFamily: "boldfont"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right:  kIsWeb?20:Get.width * 0.08),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?",style:
                              TextStyle(textBaseline: TextBaseline.ideographic,color: Colors.white),),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignInScreen());
                                },
                                child: const Text("Sign in",style:
                                TextStyle(textBaseline: TextBaseline.ideographic,color:  ColorRes.splashButton,),),
                              ),
                            ],
                          ),
                        ),
                      ],),
                  )
                ],
              ),
                signUpController.loader.value  ? const Center(child: CircularProgressIndicator()) : const SizedBox()
              ],);

          }),

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
                    color: const Color(0xFFFFFFFF).withOpacity(0.55), height:1, fontFamily: ""),
                contentPadding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.015, horizontal: Get.width * 0.03),
                suffixIcon: isShowViciblity == true
                    ? GestureDetector(
                  onTap: onTapIcon,
                      child: (obscureText==true)?
                      const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ) :
                      const Icon(
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
