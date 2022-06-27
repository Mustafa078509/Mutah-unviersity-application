import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Login_Page.dart';
import 'package:flutter_application_2/main.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EasySplashScreen(
          logo: Image.asset(
            'Assests/Images-Icons/mutahGIF.gif',
            width: 350,
            height: 150,
          ),
          showLoader: true,
          navigator: MyApp(),
          durationInSeconds: 4,
        ),
      ),
    );
  }
}
