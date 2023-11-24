// ignore_for_file: file_names

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomInterstitialAd extends GetxController
{
  BannerAd? bannerAd;
  bool isBannerAdLoaded = false;
  InterstitialAd? interstitialAd;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadAd();
  }

  loadAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Replace with your ad unit ID
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
        },
      ),
    );
  }

  void adFullScreen(InterstitialAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdClicked: (ad) {},
      onAdDismissedFullScreenContent: (ad) {
        // Dispose the interstitial ad when it's no longer needed.
        // Do not dispose it immediately after showing.
        ad.dispose();
        interstitialAd = null; // Set to null to indicate that it has been disposed.
        loadAd(); // Load a new ad for future use.
      },
    );
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      adFullScreen(interstitialAd!);
      interstitialAd!.show();
    } else {
      loadAd(); // Load a new ad to replace the disposed one.
    }
  }
}

