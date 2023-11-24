// ignore_for_file: file_names

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:get/get.dart';

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

  void loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
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
        }
      });
    } else {
      Get.back();
    }
  }
}



