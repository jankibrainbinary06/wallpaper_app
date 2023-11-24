import 'dart:io';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class FaveBookBannerAds extends StatefulWidget {
  const FaveBookBannerAds({Key? key}) : super(key: key);

  @override
  State<FaveBookBannerAds> createState() => _FaveBookBannerAdsState();
}

class _FaveBookBannerAdsState extends State<FaveBookBannerAds> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FacebookAudienceNetwork.init(
        testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
        iOSAdvertiserTrackingEnabled: true //default false
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Container(
        alignment: const Alignment(0.5, 1),
        child: FacebookBannerAd(
          placementId: Platform.isAndroid ? "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047" : "37b1da9d-b48c-4103-a393-2e095e734bd6",
          bannerSize: BannerSize.STANDARD,
          listener: (result, value) {
            switch (result) {
              case BannerAdResult.ERROR:
                break;
              case BannerAdResult.LOADED:
                break;
              case BannerAdResult.CLICKED:
                break;
              case BannerAdResult.LOGGING_IMPRESSION:
                break;
            }
          },
        ),
      )
    );
  }
}
