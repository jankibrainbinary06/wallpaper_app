// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/dashboar_screen/dashboard_screen.dart';
import 'package:wallpaperapp/screens/select_wallpaper_view_screen/select_wallpaper_view_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/colorRes.dart';
import 'package:wallpaperapp/utils/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // AfterIntroController afterIntroController = Get.put(AfterIntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.5,
              // width: Get.width * 0.8,
              decoration: const BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,
                      image: AssetImage(AssetRes.spleashScrren))),
            ),
            Text(StringRes.Welcome,style: TextStyle(fontSize: Get.width * 0.130,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: "boldfont"),),
            SizedBox(height: Get.height * 0.02,),
            Text(StringRes.exploreTheBest,style: TextStyle(fontSize: Get.width * 0.05,color: Colors.white,fontFamily: "spleshsubtilefont"),),
            Text(StringRes.makeAnAwesome,style: TextStyle(fontSize: Get.width * 0.05,color: Colors.white,fontFamily: "spleshsubtilefont"),),
            SizedBox(height: Get.height * 0.06,),
            GestureDetector(
              onTap: () {
                bool isSelected = PrefService.getBool('isSelected') ?? false;
               isSelected == true ? Get.offAll(DashBoardScreen()) :
               Get.to(SelectWallpaperViewScreen()) ;
              },
              child: Container(height: Get.height * 0.115,width: Get.width * 0.6,decoration: BoxDecoration(color: ColorRes.splashButton,
              borderRadius: BorderRadius.circular(40)
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 18.0),
                  child: SizedBox(child: Image.asset(AssetRes.spleashButtonIcon),),
                ),
                Text(StringRes.LetsStart,style: TextStyle(fontWeight: FontWeight.w800,fontSize: Get.width * 0.05,color: Colors.black,fontFamily: "regularfont"),),
              ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
