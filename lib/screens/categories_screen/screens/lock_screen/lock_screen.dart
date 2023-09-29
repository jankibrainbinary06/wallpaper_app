import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/utils/assets_res.dart';

class LockScreen extends StatelessWidget {
  String? image;
   LockScreen({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
                child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
             child:    CachedNetworkImage(
               height: Get.height * 0.184,
               width: Get.width * 0.86,
               imageUrl: image!,
               fit: BoxFit.fill,
               placeholder: (context, url) => Image.asset(
                 AssetRes.imagePlaceholder,
                 fit: BoxFit.fill,
               ),
               errorWidget: (context, url, error) => Image.asset(
                 AssetRes.imagePlaceholder,
                 fit: BoxFit.fill,
               ),
             ),

            ),
            Padding(
              padding: EdgeInsets.all(Get.width* 0.08),
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.03,),
                  const Text("Wednessday, 20 September",style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'sfPro',

                  )),  SizedBox(height: Get.height * 0.03,),
                  Text("10:27",style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w500,
                    fontSize: 90,
                    fontFamily: 'sfPro',

                  )),
                  const Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Icon(Icons.flashlight_on_sharp),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
