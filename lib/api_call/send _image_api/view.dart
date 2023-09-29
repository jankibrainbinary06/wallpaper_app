// ignore_for_file: unnecessary_null_comparison
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaperapp/api_call/send%20_image_api/view_controller.dart';

class ImagePickerPage extends StatelessWidget {
  ImagePickerPage({super.key});

  final ImageController controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<ImageController>(
            id: "image",
            builder: (controller) => Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: controller.selectedImagePath != ""
                        ? Image.file(File(controller.selectedImagePath),fit: BoxFit.cover)
                        : const Icon(Icons.person),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                controller.getImage(ImageSource.camera);
                controller.update(["image"]);
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            FloatingActionButton(
              onPressed: () {
                controller.postImage();
                controller.update(["image"]);
              },
              child: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ));
  }
}
