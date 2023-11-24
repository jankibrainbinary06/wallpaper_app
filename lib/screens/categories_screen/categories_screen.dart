// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wallpaperapp/screens/categories_screen/categories_controller.dart';
import 'package:wallpaperapp/screens/categories_screen/screens/view_categories/view_categories_screen.dart';
import 'package:wallpaperapp/services/facebook_ads/baner_ads/baner_ads.dart';
import 'package:wallpaperapp/utils/assets_res.dart';
import 'package:wallpaperapp/utils/strings.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  CategoriesController categoriesController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:ResponsiveBuilder(builder: (context, sizingInformation) {
        return  SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:MediaQuery.of(context).size.height * 0.06,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      StringRes.Categories,
                      style: TextStyle(
                          fontSize: kIsWeb?25: Get.width * 0.06,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: "spleshfont"),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),

                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('category')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data != null) {
                        int length = snapshot.data!.docs.length + 2;
                        if (snapshot.hasData) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: sizingInformation.isDesktop ?6:sizingInformation.isTablet ?4:2,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1.4,
                                ),
                                itemBuilder: (context, index) {
                                  if ((index == length - 2) ||
                                      (index == length - 1)) {
                                    return SizedBox(
                                      height: 50,
                                      width: Get.width * 0.1,
                                    );
                                  } else {
                                    return snapshot
                                        .data?.docs[index]['image'].isEmpty
                                        ? GestureDetector(
                                      onTap: () {
                                        Get.to(ViewCategoryScreen(
                                          images: const [],
                                          docId: '',
                                          category: snapshot
                                              .data?.docs[index]['name'],
                                        ));
                                      },
                                      child: Container(
                                        height: Get.height * 0.09,
                                        width: Get.width * 0.1,
                                        alignment: Alignment.bottomCenter,
                                        margin: const EdgeInsets.only(
                                            bottom: 17),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(3),
                                            image: const DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    AssetRes.Categories3))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 6),
                                          child: Text(
                                            "${snapshot.data?.docs[index]['name']}"
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "blackfont"),
                                          ),
                                        ),
                                      ),
                                    )
                                        : GestureDetector(
                                      onTap: () async {
                                        var imageList = [];
                                        for (int i = 0;
                                        i <
                                            snapshot
                                                .data!
                                                .docs[index]['image']
                                                .length;
                                        i++) {
                                          imageList.add({
                                            'imageLink': snapshot
                                                .data!.docs[index]
                                            ['image'][i]['imageLink'],
                                            'isFav':
                                            snapshot.data!.docs[index]
                                            ['image'][i]['isFav'],
                                          });
                                        }
                                        Get.to(ViewCategoryScreen(
                                          docId:
                                          snapshot.data?.docs[index].id,
                                          images: imageList,
                                          category: snapshot
                                              .data?.docs[index]['name'],
                                        ));
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            clipBehavior: Clip.hardEdge,
                                            alignment:
                                            Alignment.bottomCenter,
                                            margin: const EdgeInsets.only(
                                                bottom: 17),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: CachedNetworkImage(
                                              width: Get.width * 0.86,
                                              imageUrl: snapshot
                                                  .data?.docs[index]
                                              ['image'][0]['imageLink'],
                                              fit: BoxFit.fill,
                                              placeholder: (context, url) =>
                                                  Image.asset(
                                                    AssetRes.imagePlaceholder,
                                                    fit: BoxFit.fill,
                                                  ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  Image.asset(
                                                    AssetRes.imagePlaceholder,
                                                    fit: BoxFit.fill,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            clipBehavior: Clip.hardEdge,
                                            alignment:
                                            Alignment.bottomCenter,
                                            margin: const EdgeInsets.only(
                                                bottom: 17),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: Get.height * 0.033),
                                            child: Text(
                                              "${snapshot.data?.docs[index]['name']}"
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "blackfont"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const SizedBox();
                        } else {
                          return const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: CircularProgressIndicator()),
                            ],
                          );
                        }
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
              //   kIsWeb? const SizedBox():const FaveBookBannerAds(),
                ],
              ),
            ],
          ),
        );
      },),
    );
  }
}
