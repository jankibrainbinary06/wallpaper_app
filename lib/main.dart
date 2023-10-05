import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wallpaperapp/screens/splesh_screen/splash_screen_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  FacebookAudienceNetwork.init(
    testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", // Optional testing ID
    iOSAdvertiserTrackingEnabled: true, // Default is false
  );
  await PrefService.init();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDJL7M__du8r2p7Ff5GybGkwTRASU0LcMs",
          authDomain: "wallpaper-app-8fd97.firebaseapp.com",
          projectId: "wallpaper-app-8fd97",
          storageBucket: "wallpaper-app-8fd97.appspot.com",
          messagingSenderId: "897445179773",
          appId: "1:897445179773:web:5821dfdcbc2a5b612c9c14",
          measurementId: "G-YLM53M0F2B"));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kerela Lotery Result',
      home: SplashScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// void main()
// {
//   runApp(MaterialApp(home:  InterstitialAdExample(),));
// }


// class InterstitialAdExample extends StatefulWidget {
//   const InterstitialAdExample({Key? key}) : super(key: key);
//
//   @override
//   State<InterstitialAdExample> createState() => _InterstitialAdExampleState();
// }
//
// class _InterstitialAdExampleState extends State<InterstitialAdExample> {
//   InterstitialAd? _interstitialAd;
//   bool _isAdLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadInterstitialAd();
//   }
//
//   void _loadInterstitialAd() {
//     InterstitialAd.load(
//       adUnitId: 'ca-app-pub-3940256099942544/1033173712',
//       request: AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           setState(() {
//             _interstitialAd = ad;
//             _isAdLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (error) {
//           _isAdLoaded = false;
//           print('Interstitial Ad failed to load: $error');
//         },
//       ),
//     );
//   }
//
//   void _showInterstitialAd() {
//     if (_isAdLoaded) {
//       _interstitialAd?.show();
//     } else {
//       print('Interstitial Ad not loaded yet.');
//     }
//   }
//
//   @override
//   void dispose() {
//     _interstitialAd?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Interstitial Ad Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _showInterstitialAd,
//           child: Text('Show Interstitial Ad'),
//         ),
//       ),
//     );
//   }
// }



