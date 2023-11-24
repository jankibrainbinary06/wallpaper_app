// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/categories_screen/categories_screen.dart';
import 'package:wallpaperapp/screens/favorites_screen/favorites_screen.dart';
import 'package:wallpaperapp/screens/home_screen/home_screen_screen.dart';
import 'package:wallpaperapp/screens/sign_up_screen/sign_up_screen.dart';

class DashBoardController extends GetxController{


  RxInt selectedItem  = 0.obs;
  RxBool isShowbuttomBar = false.obs;

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