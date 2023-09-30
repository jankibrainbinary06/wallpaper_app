import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/screens/splesh_screen/splash_screen_screen.dart';
import 'package:wallpaperapp/services/pref_servies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kerela Lotery Result',
      home: SplashScreen(),
    );
  }
}
