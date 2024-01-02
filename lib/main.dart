import 'package:contact_app_final_test_af/Components/Views/Detail/detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Components/Views/Bakedup/backup.dart';
import 'Components/Views/HomePage/homepage.dart';
import 'Components/Views/Splesh/spleshscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/detail',
          page: () => Detail_Page(),
        ),
        GetPage(
          name: '/backup',
          page: () => BackUp(),
        ),
      ],
    ),
  );
}
