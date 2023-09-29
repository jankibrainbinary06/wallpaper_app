
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/pref_servies.dart';
import '../../../../utils/pref_key.dart';
import '../../../favorites_screen/favorites_screen.dart';
import '../../../sign_in_screen/sign_in_screen.dart';

class ViewOnlyWallpaperController extends GetxController{

  PageController pageController = PageController();
 int initialIndex = 0;
 RxBool loader = false.obs ;

  @override
  void onInit() {
    // TODO: implement onInit
    initialIndex = Get.arguments;
    pageController= PageController(initialPage:initialIndex );
    super.onInit();
  }

  bool isMenuOpen = false;
  bool isLike = false;
  List<String> downloadImages = PrefService.getList(PrefKeys.downloadImageList);
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  Future<void> onTapLike(String image,String categoryDocId,bool like) async {
    var id = PrefService.getString('docId');
    var isUser = PrefService.getBool('isUser');
    print(id);
    print(isUser);
    List favList  = [];
    if(isUser == true ){
      favList.clear();
      await user.get().then((value) {
        value.docs.forEach((element) {
          if (element.id  == id ) {
            // favList = element['favourite'];
            element['favourite'].forEach((e) {
              favList.add({
                'image' : e['image'],
                "isFav" : e['isFav'],
              });
            });
            print(favList.length);
          }
          else {

          }
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
    }
    else
    {
      isLike = false ;
      update(['onlyView']);
      Get.to(SignInScreen());
    }
    updateToCategory(categoryDocId,image,like);
  }

  updateToCategory(String categoryDocId,String image, bool isLike) async {
    List list = [];
    CollectionReference category = FirebaseFirestore.instance.collection('category');
    await   category.doc(categoryDocId).get().then((value) {
      value['image'].forEach((element) {

        if(element['imageLink'] == image){
          list.add({
            'imageLink':element['imageLink'],
            'isFav':isLike,
          });
        }

        else {
          list.add({
            'imageLink':element['imageLink'],
            'isFav':element['isFav'],
          });
        }
      });
    });
    print(list);

    await    category.doc(categoryDocId).update({
      'image': list,
    });
  }

  Future<void> onTapUnlike(String image ,String categoryDocId,bool like) async {
    var id = PrefService.getString('docId');
    var isUser = PrefService.getBool('isUser');
    print(id);
    print(isUser);
    List favList  = [];
    if(isUser == true ){
      favList.clear();
      await user.get().then((value) {
        value.docs.forEach((element) {
          if (element.id  == id ) {
            // favList = element['favourite'];
            element['favourite'].forEach((e) {

              favList.add({
                'image' : e['image'],
                "isFav" : e['isFav'],
              });

            });
            print(favList.length);
          }
          else {

          }
        });
        for(int i =0; i< favList.length;i++){
          if(image == favList[i]['image'] ){
            favList.removeAt(i);
          }
        }

        print(favList.length);
      });
      user.doc(id).update({
        'favourite': favList,
      });
      // Get.off(FavoritesScreen());
    }
    else
    {
      Get.to(SignInScreen());
    }
    updateToCategory(categoryDocId,image,like);
  }


}