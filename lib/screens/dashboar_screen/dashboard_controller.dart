import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/categories_screen/categories_screen.dart';
import 'package:wallpaperapp/screens/favorites_screen/favorites_screen.dart';
import 'package:wallpaperapp/screens/home_screen/home_screen_screen.dart';

import 'package:wallpaperapp/screens/sign_up_screen/sign_up_screen.dart';

import 'package:wallpaperapp/utils/assets_res.dart';


class DashBoardController extends GetxController{


  RxInt selectedIndex  = 1.obs;
  RxInt selectedItem  = 0.obs;
  RxBool isShowbuttomBar = false.obs;

  List imageList = [
    AssetRes.wallpaperpre1,
    AssetRes.wallpaperpre2,
    AssetRes.wallpaperpre3,
    AssetRes.wallpaperpre4,
    AssetRes.wallpaperpre5,
    AssetRes.wallpaperpre6,
    AssetRes.wallpaperpre7,
    AssetRes.wallpaperpre8,
    AssetRes.wallpaperpre9,
  ];
  RxList<Widget> Screens = <Widget>[
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
  ].obs;
  RxList<Widget> WallpaperScreens = <Widget>[
    CategoriesScreen(),
    FavoritesScreen(),
    SignUpScreen(),
  ].obs;
}