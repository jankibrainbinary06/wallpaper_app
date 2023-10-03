// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              // width: Get.width * 0.8,
              decoration: const BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,
                      image: AssetImage(AssetRes.spleashScrren))),
            ),
            Text(StringRes.Welcome,style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: "boldfont"),),
            SizedBox(height: Get.height * 0.02,),
            Text(StringRes.exploreTheBest,style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: "spleshsubtilefont"),),
            Text(StringRes.makeAnAwesome,style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: "spleshsubtilefont"),),
            SizedBox(height: Get.height * 0.06,),
            GestureDetector(
              onTap: () {
                bool isSelected = PrefService.getBool('isSelected');
               isSelected == true ? Get.offAll(DashBoardScreen()) :
               Get.to(SelectWallpaperViewScreen());
              },
              child: Container(height: kIsWeb ? 75 : Get.height * 0.115,width:210,decoration: BoxDecoration(color: ColorRes.splashButton,
              borderRadius: BorderRadius.circular(40)
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 18.0),
                  child: SizedBox(child: Image.asset(AssetRes.spleashButtonIcon),),
                ),
                Text(StringRes.LetsStart,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.black,fontFamily: "regularfont"),),
              ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
