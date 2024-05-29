import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fox_daily_delivery/utils/dimens.dart';

import '../preference/my_preferences_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getIntro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/images/intro/splash_bg.png',
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/intro/splash_screen_logo.png',
            width: averageScreenSize * 0.3,
            height: averageScreenSize * 0.3,
          ),
        ],
      ),
    );
  }

  void _getIntro() {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyPreferencesScreen(),
          ),
        );
      },
    );
  }
}
