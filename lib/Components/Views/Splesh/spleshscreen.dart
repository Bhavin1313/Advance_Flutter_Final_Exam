import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Timer(
      const Duration(seconds: 5),
      () {
        Get.offNamedUntil('/home', (routes) => false);
      },
    );
    return Scaffold(
      body: Center(
        child: Container(
          height: h * .5,
          width: w * .8,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://i.gifer.com/QHTn.gif",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
