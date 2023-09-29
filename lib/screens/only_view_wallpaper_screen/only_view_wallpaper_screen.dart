// ignore_for_file: must_be_immutable

import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:wallpaperapp/screens/categories_screen/screens/lock_screen/lock_screen.dart';
import 'package:wallpaperapp/screens/only_view_wallpaper_screen/only_view_wallpaper_controller.dart';
import 'package:wallpaperapp/screens/wallpaper_preview_screen/wallpaper_preview_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/pref_key.dart';

class OnlyViewWallpaperScreen extends StatelessWidget {
  String image;
  String docId;
  List imageList;
  List favBoolList;
  OnlyViewWallpaperScreen(
      {required this.image,
      required this.docId,
      required this.imageList,
      required this.favBoolList,
      super.key});

  OnlyViewWallpaperController onlyViewWallpaperController =
      Get.put(OnlyViewWallpaperController());

  @override
  Widget build(BuildContext context) {
    onlyViewWallpaperController.onInit();
    print(favBoolList.length);
    print(imageList.length);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Obx(() {
        return Stack(
          children: [
            GetBuilder<OnlyViewWallpaperController>(
              id: 'onlyView',
              builder: (controller) {
                return PageView.builder(
                  controller: onlyViewWallpaperController.pageController,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: Get.height,
                          width: Get.width,
                          child: CachedNetworkImage(
                            height: Get.height * 0.184,
                            width: Get.width * 0.86,
                            imageUrl: imageList![index]['imageLink'],
                            fit: BoxFit.cover,
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
                        Padding(
                          padding: EdgeInsets.all(Get.width * 0.08),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              onlyViewWallpaperController.isMenuOpen
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(LockScreen(
                                              image: imageList[index]
                                                  ['imageLink'],
                                            ));
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ),
                                            child: Icon(Icons.lock),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 15,
                              ),
                              onlyViewWallpaperController.isMenuOpen
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(WallPaperPreviewScreen(
                                                image: imageList[index]
                                                    ['imageLink']));
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ),
                                            child: Icon(Icons.home),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  onlyViewWallpaperController.isMenuOpen
                                      ? GestureDetector(
                                          onTap: () {
                                            onlyViewWallpaperController
                                                .isMenuOpen = false;
                                            onlyViewWallpaperController
                                                .update(['onlyView']);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            onlyViewWallpaperController
                                                .isMenuOpen = true;
                                            onlyViewWallpaperController
                                                .update(['onlyView']);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ),
                                            child: Icon(
                                              Icons.menu,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      if (favBoolList[index]) {
                                        favBoolList[index] = false;
                                        await onlyViewWallpaperController
                                            .onTapUnlike(
                                                imageList[index]['imageLink'],
                                                docId,
                                                false);
                                      } else {
                                        favBoolList[index] = true;
                                        onlyViewWallpaperController.onTapLike(
                                            imageList[index]['imageLink'],
                                            docId,
                                            true);
                                      }
                                      onlyViewWallpaperController
                                          .update(['onlyView']);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                      child: favBoolList[index]
                                          ? Icon(
                                              Icons.favorite_outlined,
                                              color: Colors.black,
                                            )
                                          : Icon(
                                              Icons.favorite_outline_sharp,
                                              color: Colors.black,
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      onlyViewWallpaperController.loader.value =
                                          true;
                                      var response = await http.get(Uri.parse(
                                          imageList[index]['imageLink']));
                                      if (response.statusCode == 200) {
                                        List<int> bytes = response.bodyBytes;
                                        Directory tempDir =
                                            await getTemporaryDirectory();
                                        File tempFile = File(
                                            '${tempDir.path}/wallpaperpre1.png');
                                        debugPrint(
                                            'Temporary File Path: ${tempFile.path}');
                                        await tempFile.writeAsBytes(bytes);
                                        await Share.shareFiles([tempFile.path],
                                            text: 'Check out this image!');
                                      } else {
                                        throw Exception('Failed to load image');
                                      }
                                      onlyViewWallpaperController.loader.value =
                                          false;
                                      onlyViewWallpaperController
                                          .update(['onlyView']);
                                    },
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: SizedBox(
                                          height: Get.height * 0.05,
                                          child: Image.asset(
                                            AssetRes.shareIcon,
                                            height: 25,
                                            width: 25,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      onlyViewWallpaperController.loader.value =
                                          true;
                                      var response = await Dio().get(
                                          imageList![index]['imageLink'],
                                          options: Options(
                                              responseType:
                                                  ResponseType.bytes));

                                      await ImageGallerySaver.saveImage(
                                        Uint8List.fromList(response.data),
                                        quality: 60,
                                        name: "ohooho",
                                      );
                                      onlyViewWallpaperController.downloadImages
                                          .add(imageList[index]['imageLink']);
                                      await PrefService.setValue(
                                          PrefKeys.downloadImageList,
                                          onlyViewWallpaperController
                                              .downloadImages);
                                      var data = PrefService.getList(
                                          PrefKeys.downloadImageList);
                                      print(data);
                                      onlyViewWallpaperController.loader.value =
                                          false;
                                      // Get.to(DownloadScreen());
                                      Get.snackbar(
                                          'Yay!!', "Image is downloaded",
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Colors.white);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                      child: Icon(
                                        Icons.arrow_downward_sharp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            onlyViewWallpaperController.loader.value
                ? Center(child: const CircularProgressIndicator())
                : SizedBox()
          ],
        );
      })),
    );
  }
}
