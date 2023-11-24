// ignore_for_file: avoid_function_literals_in_foreach_calls
// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/services/pref_servies.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/strings.dart';

class HomeController extends GetxController {
  bool isFavourite = false;
  List aBoolList = List.generate(1, (index) => false);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List allCategory = [];

  List drawerImageList = [
    AssetRes.homeIcon,
    AssetRes.categoriesIcon,
    AssetRes.draverLikeIcon,
    AssetRes.LockIcon,
    AssetRes.downLoad,
  ];

  List drawerImageNameList = [
    StringRes.Home,
    StringRes.Categories,
    StringRes.Favorites,
    StringRes.ForgotPassword,
    StringRes.DownLoads,
  ];
  List allImage = [];
  List myBoolList = [];

  onTapCategory(int index, int length, String id) {
    allImage = [];
    aBoolList = List.generate(length, (index) => false);
    if (aBoolList[index]) {
      aBoolList[index] = false;
    //  update(['boolList']);
     // update(['data']);
    } else {
      aBoolList[index] = true;

      if (id == '1') {
        FirebaseFirestore.instance.collection('category').get().then((value) {
          value.docs.forEach((element) {
            var list = element['image'];
            list.forEach((e) {
              allImage.add({
                'imageLink': e['imageLink'],
                'isFav': e['isFav'],
                'id': element.id,
              });
           //   update(['boolList']);
             // update(['data']);
            });
          });
        });
      } else {
        FirebaseFirestore.instance.collection('category').get().then((value) {
          value.docs.forEach((element) {
            if (element.id == id) {
              var list = element['image'];
              list.forEach((e) {
                allImage.add({
                  'imageLink': e['imageLink'],
                  'isFav': e['isFav'],
                  'id': element.id,
                });
               // update(['boolList']);
              //  update(['data']);
              });
            }
          });
        });
      }
      //update(['boolList']);
     // update(['data']);
    }
  }

  boolGenerate(int length) {
    aBoolList = List.generate(length, (index) => false);
    aBoolList[0] = true;
   // update(['boolList']);
    //update(['data']);
  }

  Future<void> onTapImage(String image) async {
    CollectionReference user = FirebaseFirestore.instance.collection('user');
    if (PrefService.getString('docId') != '') {
      await user.doc(PrefService.getString('docId')).get().then((value) {
        for (int i = 0; i < value['favourite'].length; i++) {
          if (value['favourite'][i]['image'] == image) {
            isFavourite = true;
            break;
          } else {
            isFavourite = false;
          }
        }
      });
    } else {}
  }

  Future<void> onTapImage2(String docId, length) async {
    myBoolList = [];

    myBoolList = List.generate(length, (index) => false);

    var myFavList = [];
    var myCategoryList = [];
    CollectionReference user = FirebaseFirestore.instance.collection('user');
    CollectionReference category =
        FirebaseFirestore.instance.collection('category');

    if (PrefService.getString('docId') != '') {
      await user.doc(PrefService.getString('docId')).get().then((value) {
        myFavList = [];
        for (int i = 0; i < value['favourite'].length; i++) {
          myFavList.add(value['favourite'][i]['image']);
        }
      });

      if (docId == '1') {
        await category.get().then((value) {
          myCategoryList = [];
          value.docs.forEach((element) {
            var list = element['image'];
            list.forEach((e) {
              myCategoryList.add(e['imageLink']);
            });
          });
        });
      } else {
        await category.doc(docId).get().then((value) {
          myCategoryList = [];
          var list = value['image'];

          for (int i = 0; i < list.length; i++) {
            myCategoryList.add(list[i]['imageLink']);
          }
        });
      }

      for (int i = 0; i < myCategoryList.length; i++) {
        for (int j = 0; j < myFavList.length; j++) {
          if (myCategoryList[i] == myFavList[j]) {
            myBoolList[i] = true;
          } else {}
        }
      }
    } else {}
  }
}
