import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class CustomFacebookInterstitialAd extends GetxController {
  bool _isInterstitialAdLoaded = false;

  @override
  void onInit() {
    super.onInit();
    FacebookAudienceNetwork.init(
        testingId: "5e3af72c-f737-48a7-8469-da5c2f6a4724", // Optional
        iOSAdvertiserTrackingEnabled: true // Default is false
    );
    loadInterstitialAd();
  }
  //
  // void loadInterstitialAd() {
  //   FacebookInterstitialAd.loadInterstitialAd(
  //     placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
  //     listener: (result, value) {
  //       print(">> FAN > Interstitial Ad: $result --> $value");
  //       if (result == InterstitialAdResult.LOADED) {
  //         // Delay for 5 seconds before showing the ad
  //         Future.delayed(const Duration(milliseconds: 5000), () {
  //           FacebookInterstitialAd.showInterstitialAd().then((value) {
  //             Get.back();
  //           });
  //         });
  //       }
  //
  //       if (result == InterstitialAdResult.DISMISSED &&
  //           value["invalidated"] == true) {
  //         _isInterstitialAdLoaded = false;
  //         loadInterstitialAd();
  //       }
  //     },
  //   );
  // }
  //
  // Future<void> showFacebookInterstitialAd() async {
  //   if (_isInterstitialAdLoaded) {
  //     await FacebookInterstitialAd.showInterstitialAd().then((value) {
  //       if (value == true) {
  //         Get.back();
  //         // The interstitial ad was successfully shown.
  //         // You can take appropriate actions here.
  //       }
  //     });
  //   } else {
  //     print("Interstitial Ad is not loaded yet.");
  //   }
  // }



  void loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED) {
          _isInterstitialAdLoaded = true;
        }

        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          loadInterstitialAd();
        }
      },
    );
  }
  Future<void> showFacebookInterstitialAd() async {
    if (_isInterstitialAdLoaded) {
      await FacebookInterstitialAd.showInterstitialAd().then((value) {
        if (value == true) {
          Get.back();
          // The interstitial ad was successfully shown.
          // You can take appropriate actions here.
        }
      });
    } else {
      Get.back();
      print("Interstitial Ad is not loaded yet.");
    }
  }
}



