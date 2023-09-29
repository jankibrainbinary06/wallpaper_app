// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/dashboar_screen/dashboard_controller.dart';
import 'package:wallpaperapp/screens/dashboar_screen/dashboard_screen.dart';
import 'package:wallpaperapp/screens/select_wallpaper_view_screen/select_wallpaper_view_controller.dart';
import 'package:wallpaperapp/services/pref_servies.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/colorRes.dart';
import 'package:wallpaperapp/utils/strings.dart';

DashBoardController dashBoardController = Get.put(DashBoardController());

class SelectWallpaperViewScreen extends StatelessWidget {
  SelectWallpaperViewScreen({super.key});

  SelectWallpaperViewController dasBoardController =
      Get.put(SelectWallpaperViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.06,
            ),
            Text(
              StringRes.SelectAtLeast,
              style: TextStyle(
                  fontSize: Get.width * 0.06,
                  color: Colors.white,
                  fontFamily: "regularfont"),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Obx(() => Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      PrefService.setValue('isSelected', true);
                      if (dasBoardController.count > 3) {
                        dashBoardController.isShowbuttomBar.value = false;
                        Get.to(DashBoardScreen());
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.09,
                      width: Get.width * 0.44,
                      decoration: BoxDecoration(
                          color: (dasBoardController.count > 3)
                              ? ColorRes.splashButton
                              : ColorRes.splashButton.withOpacity(0.50),
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        StringRes.Next,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: Get.width * 0.06,
                            color: (dasBoardController.count > 3)
                                ? Colors.black
                                : Colors.black.withOpacity(0.50),
                            fontFamily: "regularfont"),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: Get.height * 0.04,
            ),

            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('category')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                dasBoardController.imageListBool.value = List.generate(snapshot.data?.docs.length ?? 0, (index) => false);
if(snapshot.hasData){
  return
    SizedBox(
      height: Get.height * 0.7,
      width: Get.width * 0.9,
      child: GridView.builder(
        // itemCount: dasBoardController.imageList.length,
        itemCount:  snapshot.data?.docs.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.99),
        itemBuilder: (context, index) {
          return
            snapshot.data?.docs[index]['image'].isEmpty?
            Container(
              height: Get.height * 0.09,
              width: Get.width * 0.1,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image:
                  AssetImage(
                    AssetRes.wallpaper3,
                  ),),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,children: [
                      Obx(() => Theme(data: ThemeData(unselectedWidgetColor: Colors.white),
                        child: Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          // contentPadding: EdgeInsets.zero,
                          checkColor: Colors.white,
                          activeColor: Colors.transparent,
                          side: const BorderSide(color: Colors.white),
                          // controlAffinity: ListTileControlAffinity.leading,
                          // checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          value: dasBoardController.imageListBool.value[index],
                          onChanged: (val) {
                            if(val!=null)
                            {
                              dasBoardController.imageListBool.value[index] = val;

                              if(dasBoardController.imageListBool[index]==true)
                              {

                                dasBoardController.count++;
                              }
                              else
                              {
                                dasBoardController.count--;
                              }
                              print("==> ${dasBoardController.imageListBool[index]}");
                              dasBoardController.imageListBool.refresh();
                            }
                          },
                        ),
                      ),),
                    ],),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(
                          maxLines: 2,
                          '${snapshot.data?.docs[index]['name']}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "blackfont"),
                        ),
                      ),),),
                ],
              ),
            ) :
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),

                  child: Container(
                    height: Get.height * 0.15,
                    width: Get.width * 0.33,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),

                    ),
                    child:
                    CachedNetworkImage(
                      height: Get.height * 0.15,
                      width: Get.width * 0.33,
                      imageUrl: '${snapshot.data?.docs[index]['image'][0]['imageLink']}',
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Image.asset(
                        AssetRes.imagePlaceholder,
                        fit: BoxFit.fill,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AssetRes.imagePlaceholder,
                        fit: BoxFit.fill,
                      ),
                    ),

                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,children: [
                        Obx(() => Theme(data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            // contentPadding: EdgeInsets.zero,
                            checkColor: Colors.white,
                            activeColor: Colors.transparent,
                            side: const BorderSide(color: Colors.white),
                            // controlAffinity: ListTileControlAffinity.leading,
                            // checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            value: dasBoardController.imageListBool.value[index],
                            onChanged: (val) {
                              if(val!=null)
                              {
                                dasBoardController.imageListBool.value[index] = val;

                                if(dasBoardController.imageListBool[index]==true)
                                {

                                  dasBoardController.count++;
                                }
                                else
                                {
                                  dasBoardController.count--;
                                }
                                print("==> ${dasBoardController.imageListBool[index]}");
                                dasBoardController.imageListBool.refresh();
                              }
                            },
                          ),
                        ),),
                      ],),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            maxLines: 2,
                            '${snapshot.data?.docs[index]['name']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "blackfont"),
                          ),
                        ),),),
                  ],
                ),

              ],
            );
        },
      ),
    );
}
else if(snapshot.hasError){
  return const SizedBox();
}
else{
  return const Center(child: CircularProgressIndicator());
}

            },),

          ],
        ),
      ),
    );
  }
}
