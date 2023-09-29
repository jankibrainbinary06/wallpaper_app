import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/sign_in_screen/sign_in_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/pref_key.dart';

class OnlyViewWallpaperController extends GetxController {
  RxBool selectLike = false.obs;

  bool isLike = false;
  RxBool loader = false.obs;

  bool isMenuOpen = false;

  PageController pageController = PageController();
  List<String> downloadImages = PrefService.getList(PrefKeys.downloadImageList);

  int initialIndex = 0;
  List imageList = [
    AssetRes.wallpaperpre1,
    AssetRes.wallpaperpre2,
    AssetRes.wallpaperpre3,
    AssetRes.wallpaperpre4,
    AssetRes.wallpaperpre5,
    AssetRes.wallpaperpre6,
  ];
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  @override
  void onInit() {
    // TODO: implement onInit
    initialIndex = Get.arguments ?? 0;
    pageController = PageController(initialPage: initialIndex);
    super.onInit();
  }

  Future<void> onTapLike(String image, String categoryDocId, bool like) async {
    var id = PrefService.getString('docId');
    var isUser = PrefService.getBool('isUser');
    print(id);
    print(isUser);
    List favList = [];
    if (isUser == true) {
      favList.clear();
      await user.get().then((value) {
        value.docs.forEach((element) {
          if (element.id == id) {
            // favList = element['favourite'];
            element['favourite'].forEach((e) {
              favList.add({
                'image': e['image'],
                "isFav": e['isFav'],
              });
            });
            print(favList.length);
          } else {}
        });
        favList.add({
          'image': image,
          'isFav': true,
        });
        print(favList.length);
      });
      user.doc(id).update({
        'favourite': favList,
      });
      // Get.off(FavoritesScreen());
    } else {
      isLike = false;
      update(['onlyView']);
      Get.to(SignInScreen());
    }
    // updateToCategory(categoryDocId, image, like);
  }

  updateToCategory(String categoryDocId, String image, bool isLike) async {
    List list = [];
    CollectionReference category =
        FirebaseFirestore.instance.collection('category');
    await category.doc(categoryDocId).get().then((value) {
      value['image'].forEach((element) {
        if (element['imageLink'] == image) {
          list.add({
            'imageLink': element['imageLink'],
            'isFav': isLike,
          });
        } else {
          list.add({
            'imageLink': element['imageLink'],
            'isFav': element['isFav'],
          });
        }
      });
    });
    print(list);

    await category.doc(categoryDocId).update({
      'image': list,
    });
  }

  Future<void> onTapUnlike(
      String image, String categoryDocId, bool like) async {
    var id = PrefService.getString('docId');
    var isUser = PrefService.getBool('isUser');
    print(id);
    print(isUser);
    List favList = [];
    if (isUser == true) {
      favList.clear();
      await user.get().then((value) {
        value.docs.forEach((element) {
          if (element.id == id) {
            // favList = element['favourite'];
            element['favourite'].forEach((e) {
              favList.add({
                'image': e['image'],
                "isFav": e['isFav'],
              });
            });
            print(favList.length);
          } else {}
        });
        for (int i = 0; i < favList.length; i++) {
          if (image == favList[i]['image']) {
            favList.removeAt(i);
          }
        }

        print(favList.length);
      });
      user.doc(id).update({
        'favourite': favList,
      });
      // Get.off(FavoritesScreen());
    } else {
      Get.to(SignInScreen());
    }
    // updateToCategory(categoryDocId, image, like);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> setWallpaperFromFile(String wallpaper) async {
    var result;
    var file = await DefaultCacheManager().getSingleFile(wallpaper);

    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
  }
}
