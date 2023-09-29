import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/strings.dart';

class SelectWallpaperViewController extends GetxController{

  CollectionReference categoryCollection = FirebaseFirestore.instance.collection('category');

  List imageList = [
    AssetRes.wallpaper1,
    AssetRes.wallpaper2,
    AssetRes.wallpaper3,
    AssetRes.wallpaper4,
    AssetRes.wallpaper5,
    AssetRes.wallpaper6,
    AssetRes.wallpaper7,
    AssetRes.wallpaper8,
    AssetRes.wallpaper9,
    AssetRes.wallpaper10,
    AssetRes.wallpaper11,
    AssetRes.wallpaper12,
    AssetRes.wallpaper13,
    AssetRes.wallpaper14,
    AssetRes.wallpaper15,
  ];

  RxList<String> imageNameList =
      <String>[
        StringRes.Anime,
        StringRes.NATURE,
        StringRes.SPACE,
        StringRes.MINIMALISTIC,
        StringRes.NEONLIGHTS,
        StringRes.DARK,
        StringRes.KWallpapers,
        StringRes.Games,
        StringRes.Abstract,
        StringRes.cars,
        StringRes.Gradient,
        StringRes.Food,
        StringRes.Blurred,
        StringRes.Music,
        StringRes.black,
      ].obs;

  RxList<bool> imageListBool = <bool>[].obs;
  RxList<bool> imageListButtonEnable = <bool>[].obs;
  RxInt count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    imageListBool.value = List.generate(imageNameList.length, (index) => false);
  }
}