
import 'package:get/get.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/strings.dart';

class CategoriesController extends GetxController{


  RxInt selectedIndex  = 1.obs;
  RxInt selectedItem  = 0.obs;

  List imageList = [
    AssetRes.Categories1,
    AssetRes.Categories2,
    AssetRes.Categories3,
    AssetRes.Categories4,
    AssetRes.Categories5,
    AssetRes.Categories6,
    AssetRes.Categories7,
    AssetRes.Categories8,
    AssetRes.Categories9,
    AssetRes.Categories10,
  ];

  List<String> imageNameList =
   [
        StringRes.NATURE,
        StringRes.cars,
        StringRes.Games,
        StringRes.Blurred,
        StringRes.Food,
        StringRes.black,
        StringRes.SPACE,
        StringRes.NEONLIGHTS,
        StringRes.Gradient,
        StringRes.Music,

      ];





}