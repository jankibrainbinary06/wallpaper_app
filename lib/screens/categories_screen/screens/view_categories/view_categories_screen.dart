import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/categories_screen/screens/view_categories/view_categories_controller.dart';
import 'package:wallpaperapp/screens/only_view_wallpaper_screen/only_view_wallpaper_screen.dart';

import '../../../../utils/assets_res.dart';

class ViewCategoryScreen extends StatelessWidget {
  String? docId;
  String? category;
  List? images;

  ViewCategoryScreen({super.key, this.images, this.category, this.docId});

  ViewCategoryController viewCategoryController =
      Get.put(ViewCategoryController());

  @override
  Widget build(BuildContext context) {
    print(docId);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            category ?? '',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: images?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await viewCategoryController.onTapCatImage2(
                          docId!, images!.length);
                      Get.to(
                          () => OnlyViewWallpaperScreen(
                                image: images![index]['imageLink'],
                                docId: docId!,
                                imageList: images!,
                                favBoolList: viewCategoryController.myBoolList,
                              ),
                          arguments: index);
                    },
                    child: CachedNetworkImage(
                      height: Get.height * 0.184,
                      width: Get.width * 0.86,
                      imageUrl: images![index]['imageLink'],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset(
                        AssetRes.imagePlaceholder,
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AssetRes.imagePlaceholder,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}