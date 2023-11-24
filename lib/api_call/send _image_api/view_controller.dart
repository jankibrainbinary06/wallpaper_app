// ignore_for_file: empty_catches

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaperapp/api_call/send%20_image_api/send_image_api.dart';

class ImageController extends GetxController {
  var selectedImagePath = "";
  String encoded = "";
  List<String> supportedMediaTypes = ['.png', '.svg', '.jpg', '.jpeg', '.mp4', '.avi'];

  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      update(["image"]);
      selectedImagePath = pickedFile.path;

      // final File originalImage = File(selectedImagePath);
      // final List<int> imageBytes = await originalImage.readAsBytes();
      // final List<int> pngBytes = img.encodePng(originalImage as img.Image);


      update(["image"]);
    } else {
    }
  }

  Future<void> postImage() async {
    try {
      await PostImageApi.postImageApi(File(selectedImagePath));
    } catch (e) {
    }
  }
}