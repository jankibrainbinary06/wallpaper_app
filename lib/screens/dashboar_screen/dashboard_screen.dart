// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/commons/widgets/common_bottom_navigation_bar.dart';
import 'package:wallpaperapp/screens/dashboar_screen/dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(() => dashBoardController
              .Screens[dashBoardController.selectedItem.value]),
          Obx(
            () => dashBoardController.isShowbuttomBar.value == false
                ? Positioned(
                    bottom: Get.height * 0.04,
                    left: Get.width * 0.1,
                    child: bottomNavigationBar(context),
                  )
                : const SizedBox(),
          ),
          // ),
        ],
      ),
    );
  }
}
