import 'dart:async';

import 'package:dicoding_submission_flutter_pemula/screen_page/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // pake statefull
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () async {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Image.asset('assets/images/splash_cover.png', fit: BoxFit.cover),
      ),
    );
  }
}
