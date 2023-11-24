import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/services/pref_servies.dart';
import 'package:wallpaperapp/utils/assets_res.dart';

class FavoritesController extends GetxController {

  String id = '';

  List myBoolList = [];

  RxList<bool> selectLike = <bool>[].obs;

  CollectionReference user = FirebaseFirestore.instance.collection('user');
  CollectionReference category =
      FirebaseFirestore.instance.collection('category');

  List imageList = [
    AssetRes.wallpaperpre1,
    AssetRes.wallpaperpre2,
    AssetRes.wallpaperpre3,
    AssetRes.wallpaperpre4,
    AssetRes.wallpaperpre5,
    AssetRes.wallpaperpre6,
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectLike.value = List.generate(imageList.length, (index) => false);
  }

  onTapLikeUnlike(int index) async {
    List list = [];
    list.clear();
    await user.doc(PrefService.getString('docId')).get().then((value) {
      value['favourite'].forEach((element) {
        list.add({
          'image': element['image'],
          'isFav': element['isFav'],
        });
      });
      list.removeAt(index);
    });
    user.doc(PrefService.getString('docId')).update({'favourite': list});
  }

  updateToCategory(String image, bool isLike) async {
    List cList = [];
    List list = [];
    var id = '';

    await category.get().then((value) {
      for (var e in value.docs) {
        cList = e['image'];
        for (var element in cList) {
          if (element['imageLink'] == image) {
            list.add({
              'imageLink': element['imageLink'],
              'isFav': isLike,
            });
            id = e.id;
          } else {
            list.add({
              'imageLink': element['imageLink'],
              'isFav': element['isFav'],
            });
          }
        }
      }
    });
    await category.doc(id).update({
      'image': list,
    });
  }
}
