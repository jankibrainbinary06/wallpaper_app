import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/favorites_screen/favorites_controller.dart';
import 'package:wallpaperapp/screens/only_view_wallpaper_screen/only_view_wallpaper_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/strings.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  FavoritesController favoritesController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    favoritesController.update(['fav']);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      StringRes.Favorites,
                      style: TextStyle(
                          fontSize: Get.width * 0.06,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: "spleshfont"),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),

                  PrefService.getString('docId') == ''
                      ? const SizedBox()
                      : GetBuilder<FavoritesController>(
                          id: 'fav',
                          builder: (controller) {
                            return StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(PrefService.getString('docId'))
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        snapshot.data?['favourite'].length ?? 0,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      childAspectRatio: 0.7,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          favoritesController.myBoolList = [];
                                          var list = [];
                                          for (int i = 0;
                                              i <
                                                  snapshot.data?['favourite']
                                                      .length;
                                              i++) {
                                            list.add({
                                              'imageLink':
                                                  snapshot.data?['favourite'][i]
                                                      ['image'],
                                              'isFav': true,
                                            });
                                            favoritesController.myBoolList
                                                .add(true);
                                          }

                                          Get.to(
                                              () => OnlyViewWallpaperScreen(
                                                    image: snapshot
                                                            .data?['favourite']
                                                        [index]['image'],
                                                    docId: '',
                                                    imageList: list,
                                                    favBoolList:
                                                        favoritesController
                                                            .myBoolList,
                                                  ),
                                              arguments: index);
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: Get.height * 0.18,
                                              width: Get.width * 0.25,
                                              clipBehavior: Clip.hardEdge,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    width: 0),
                                              ),
                                              child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  CachedNetworkImage(
                                                    height: Get.height * 0.3,
                                                    width: Get.width * 0.28,
                                                    imageUrl: snapshot
                                                            .data?['favourite']
                                                        [index]['image'],
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        (context, url) =>
                                                            Image.asset(
                                                      AssetRes.imagePlaceholder,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      AssetRes.imagePlaceholder,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4, right: 4),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          favoritesController
                                                              .onTapLikeUnlike(
                                                                  index);
                                                        },
                                                        child: SizedBox(
                                                            height: (snapshot.data?['favourite']
                                                                            [index]
                                                                        [
                                                                        'isFav'] ==
                                                                    false)
                                                                ? Get.height *
                                                                    0.025
                                                                : Get.height *
                                                                    0.03,
                                                            child: Image.asset(
                                                                (snapshot.data?['favourite'][index]['isFav'] ==
                                                                        false)
                                                                    ? AssetRes
                                                                        .LikeIcon
                                                                    : AssetRes
                                                                        .imageLike))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: Get.height * 0.18,
                                              width: Get.width * 0.25,
                                              clipBehavior: Clip.hardEdge,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    width: 0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                  // SizedBox(height: Get.height * 0.04,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
