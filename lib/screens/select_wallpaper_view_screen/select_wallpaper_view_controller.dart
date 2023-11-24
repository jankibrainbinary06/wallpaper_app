import 'package:get/get.dart';
import 'package:wallpaperapp/utils/strings.dart';

class SelectWallpaperViewController extends GetxController{
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
  RxInt count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    imageListBool.value = List.generate(imageNameList.length, (index) => false);
  }
}