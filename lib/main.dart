import 'package:dicoding_submission_flutter_pemula/screen_page/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffe Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'Playpen_Sans',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      // home: HomeScreen(),
      home: SplashScreen(),
      // home: UrlLauncherExapmple(title: 'URL Launcher'),
    );
  }
}
