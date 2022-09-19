import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/config/themes/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer(
      const Duration(milliseconds: 2000),
      () => Navigator.pushReplacementNamed(context, Routes.randomQuote),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme(),
      child: const Scaffold(
        body: Center(
          child: Image(image: AssetImage('assets/images/splah.png')),
        ),
      ),
    );
  }
}
