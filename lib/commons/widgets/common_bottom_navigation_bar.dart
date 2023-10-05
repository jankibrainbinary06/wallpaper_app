import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/dashboar_screen/dashboard_controller.dart';
import 'package:wallpaperapp/services/facebook_ads/Interstitial_ads/Interstitial_ads.dart';
import 'package:wallpaperapp/services/facebook_ads/baner_ads/baner_ads.dart';
import 'package:wallpaperapp/utils/assets_res.dart';

Widget bottomNavigationBar(BuildContext context) {
  DashBoardController dashBoardController = Get.put(DashBoardController());

  return Container(
    height: MediaQuery.of(context).size.height * 0.115,
    width: Get.width * 0.8,
    decoration: BoxDecoration(
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage(AssetRes.botamBar)),
        borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: EdgeInsets.only(left: Get.width * 0.07, right: Get.width * 0.07),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Obx(
          () => GestureDetector(
              onTap: () {
                dashBoardController.selectedItem.value = 0;
              },
              child: SizedBox(
                height: (dashBoardController.selectedItem.value == 0)
                    ? Get.height * 0.04
                    : Get.height * 0.04,
                child: Image.asset((dashBoardController.selectedItem.value == 0)
                    ? AssetRes.SelectVectorIcon
                    : AssetRes.VectorIcon),
              )),
        ),
        Obx(
          () => GestureDetector(
              onTap: () {

                dashBoardController.selectedItem.value = 1;
              },
              child: SizedBox(
                height: (dashBoardController.selectedItem.value == 1)
                    ? Get.height * 0.043
                    : Get.height * 0.04,
                child: Image.asset((dashBoardController.selectedItem.value == 1)
                    ? AssetRes.SelectFrameIcon
                    : AssetRes.FrameIcon),
              )),
        ),
        Obx(
          () => GestureDetector(
              onTap: () {
                dashBoardController.selectedItem.value = 2;
              },
              child: SizedBox(
                height: (dashBoardController.selectedItem.value == 2)
                    ? Get.height * 0.044
                    : Get.height * 0.036,
                child: Image.asset((dashBoardController.selectedItem.value == 2)
                    ? AssetRes.SelectLikeIcon
                    : AssetRes.LikeIcon),
              )),
        )
      ]),
    ),
  );
}
