import 'package:flutter/material.dart';
import 'package:flutter_application_2/About_Us.dart';
import 'package:flutter_application_2/GetX/views/homepageX.dart';
import 'package:flutter_application_2/MySplashScreen.dart';
import 'package:flutter_application_2/Notifications.dart';
import 'package:flutter_application_2/Post.dart';
import 'package:flutter_application_2/Login_Page.dart';
import 'package:flutter_application_2/Home_Page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'Mailto.dart';
import 'Professor.dart';
import 'details.dart';
import 'package:email_launcher/email_launcher.dart';

void main() {
  runApp(splash());
}

Widget splash() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: EasySplashScreen(
        logo: Image.asset('Assests/Images-Icons/GIFmutah.gif'),
        showLoader: true,
        navigator: const MyApp(),
        durationInSeconds: 5,
        logoSize: 240,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
        initialRoute: ' Home_Page()',
        title: 'Mutah University',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Login_Page(),
        routes: {
          'Login_Page': (context) => const Login_Page(),
          'Home_Page': (context) => Home_Page(),
          'AboutUs': (context) => AboutUs(),
          'Details': (context) => Details(),
          'Notifications': (context) => Notifications(),
          'Mailto': (context) => Mailto(),
          'Post': (context) => Post(),
          'Professors': (context) => Professors(),
        });
  }
}


