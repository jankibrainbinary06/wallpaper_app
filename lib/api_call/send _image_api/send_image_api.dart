// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;
import 'package:http_parser/http_parser.dart';
import 'package:wallpaperapp/api_call/send%20_image_api/view_controller.dart';

final ImageController controller = Get.put(ImageController());
class PostImageApi {
  static postImageApi(File imageFile) async {
    final url = Uri.parse('https://xpressfly.sapientcodelabs.xyz/common/upload/file');
    var request = http.MultipartRequest('POST', url);

    var fileExtension = path.extension(imageFile.path).toLowerCase();

    if (fileExtension == '.png' ||
        fileExtension == '.jpg' ||
        fileExtension == '.svg' ||
        fileExtension == '.mp4' ||
        fileExtension == '.avi' ||
        fileExtension == '.webp') {

      var image = await http.MultipartFile.fromPath('image', imageFile.path, contentType: MediaType("image", fileExtension.substring(1)));
      request.files.add(image);
      try {
        var response = await request.send();

        if (response.statusCode == 200) {
          // print('Image uploaded successfully');
          print(imageFile);
          print("Status code is===============================${response.statusCode}");
          var responded = await http.Response.fromStream(response);
          print(responded.body);
        } else {
          print('Image upload failed with status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('Please upload a supported image format: *.png, *.svg, *.jpg, *.mp4, *.avi');
    }
  }
}
void convertJpegToPng(File jpegFile) {
  // Read the JPEG file
  final jpegBytes = jpegFile.readAsBytesSync();

  // Decode the JPEG image
  final jpegImage = img.decodeImage(jpegBytes);

  // Convert to PNG format
  final pngImage = img.encodePng(jpegImage!);

  // Create a new file with the same name and ".png" extension
  final pngFile = File('${jpegFile.path}.png');

  // Write the PNG data to the new file
  pngFile.writeAsBytesSync(pngImage);

  print('Conversion completed. PNG file path: ${pngFile.path}');
}

// class PostImageApi {
//   static postImageApi() async {
//     var request = http.MultipartRequest('POST',
//         Uri.parse('https://xpressfly.sapientcodelabs.xyz/common/upload/file'));
//     request.files.add(await http.MultipartFile.fromPath('image',
//         '/data/user/0/com.app.result.ticket/cache/5fe9979c-9e98-4e24-a389-8d8bafb4f6c08236506851454082042.jpg'));
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       debugPrint(await response.stream.bytesToString());
//     } else {
//       debugPrint(response.reasonPhrase);
//     }
//   }
// }


// class PostImageApi {
//   static postImageApi(String  imageFile) async {
//
//     final url = Uri.parse('https://xpressfly.sapientcodelabs.xyz/common/upload/file');
//     var request = http.MultipartRequest('POST', url);
//
//     var image = await http.MultipartFile.fromPath('image', imageFile);
//     request.files.add(image);
//     try {
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         print('Image uploaded successfully');
//         print(imageFile);
//         Get.snackbar("Image", "Image upload successfully",backgroundColor: Colors.black,colorText: Colors.white);
//         print(response);
//         var responded = await http.Response.fromStream(response);
//         print(responded.body);
//       } else {
//         print('Image upload failed with status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
// }

// class PostImageApi {
//   static postImageApi(String image) async {
//     try {
//       String url = "https://xpressfly.sapientcodelabs.xyz/common/upload/file";
//
//       final multipartRequest = http.MultipartRequest('POST', Uri.parse(url));
//
//       if (image != null && image != '') {
//         multipartRequest.files
//             .add(await http.MultipartFile.fromPath('image', image));
//       }
//
//       // var response = await multipartRequest.send();
//       http.StreamedResponse response = await multipartRequest.send();
//
//       var responded = await http.Response.fromStream(response);
//
//       if (responded.statusCode == 200) {
//         debugPrint(responded.body);
//         // return imageUploadFileFromJson(responded.body);
//       } else {
//         Get.snackbar("Error", responded.body, backgroundColor: Colors.red);
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
//       if (kDebugMode) {
//         print(e.toString());
//       }
//       return null;
//     }
//   }
// }
// class PostImageApi {
//   static postImageApi(String imagePath) async {
//     var request = http.MultipartRequest('POST',Uri.parse('https://xpressfly.sapientcodelabs.xyz/common/upload/file'));
//
//     // final imageUri = Uri.parse(imagePath);
//     // final imageFileExtension = imageUri.pathSegments.last.split('.').last;
//     //
//     // if (['png', 'svg', 'jpg', 'jpeg', 'mp4', 'avi']
//     //     .contains(imageFileExtension)) {
//       request.files.add(await http.MultipartFile.fromPath('image', imagePath));
//       request.fields['image'] = imagePath;
//       var response = await request.send();
//
//       if (response.statusCode == 200) {
//         var responseBody = await response.stream.bytesToString();
//         var responseData =  jsonDecode(responseBody);
//         print(responseData);
//         if (responseData['status'] == false && responseData['message'] == 'Please upload a supported image format, such as *.png, *.svg, *.jpg, *.jpeg. *.mp4 *.avi') {
//           print('Unsupported image format');
//         } else {
//           print('Image uploaded successfully');
//         }
//       } else {
//         print('Image upload failed');
//       }
//     }
//   }
// class PostImageApi {
//   static postImageApi(String imagePath) async {
//     // final supportedFormats = ['.png', '.svg', '.jpg', '.jpeg', '.mp4', '.avi'];
//     // final fileExtension = imageFile.path.split('.').last.toLowerCase();
//     //
//     // if (!supportedFormats.contains(fileExtension)) {
//     //   print('Unsupported file format');
//     //   print(imageFile);
//     //   // return image;
//     // }
//
//     // print(imageFile);
//     final url = Uri.parse(
//         'https://xpressfly.sapientcodelabs.xyz/common/upload/file');
//     var request = http.MultipartRequest('POST', url);
//
//     // dynamic imagePath = "/data/user/0/com.app.result.ticket/cache/147dd642-4980-4977-9da4-387481f354491911837291.jpg";
//
//     var image = await http.MultipartFile.fromPath('image', imagePath);
//     request.files.add(image);
//     // var responded;
//     // final imageUri = Uri.parse(imagePath);
//     // final imageFileExtension = imageUri.pathSegments.last
//     //     .split('.')
//     //     .last;
//
//     print(imagePath);
//     // Check if the image file extension is supported
//     // if (['png', 'svg', 'jpg', 'jpeg', 'mp4', 'avi'].contains(
//     //     imageFileExtension)) {
//     //   request.files.add(await http.MultipartFile.fromPath('image', imagePath));
//     try {
//       var response = await request.send();
//       // response.stream.transform(utf8.decoder).listen((value) {
//       //   print(value);
//       // });
//
//       if (response.statusCode == 200) {
//         var responseBody = await response.stream.bytesToString();
//         var parsedResponse = jsonDecode(responseBody);
//         print(responseBody);
//         if (parsedResponse.containsKey('status') &&
//             parsedResponse.containsKey('message')) {
//           bool status = parsedResponse['status'];
//           String message = parsedResponse['message'];
//
//           if (status) {
//             print('Image uploaded successfully');
//           } else {
//             var errorMessage = message.replaceAll('\\', '');
//             print('Error: $errorMessage');
//             Get.snackbar(
//               'Error',
//               errorMessage,
//               backgroundColor: Colors.red,
//               colorText: Colors.white,
//             );
//           }
//         } else {
//           print('Unexpected response format');
//         }
//         // } else {
//         //   print('Error: ${response.statusCode}');
//         // }
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }
// }
