import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _stateMap();
  }
}

class _stateMap extends State<Map> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: WebView(
          initialUrl:
              'https://www.google.com/maps/place/%D8%AC%D8%A7%D9%85%D8%B9%D8%A9+%D9%85%D8%A4%D8%AA%D8%A9%E2%80%AD/@31.0936608,35.7195629,17z/data=!3m1!4b1!4m5!3m4!1s0x15039d60edaaebdd:0x9a417ab22771f9b3!8m2!3d31.0936562!4d35.7173742',
        ),
      ),
    );
  }

  Future<void> lunch() async {
    if (await canLaunch(
        'https://www.google.com/maps/place/%D8%AC%D8%A7%D9%85%D8%B9%D8%A9+%D9%85%D8%A4%D8%AA%D8%A9%E2%80%AD/@31.0936608,35.7195629,17z/data=!3m1!4b1!4m5!3m4!1s0x15039d60edaaebdd:0x9a417ab22771f9b3!8m2!3d31.0936562!4d35.7173742')) {
      await launch(
        'https://www.google.com/maps/place/%D8%AC%D8%A7%D9%85%D8%B9%D8%A9+%D9%85%D8%A4%D8%AA%D8%A9%E2%80%AD/@31.0936608,35.7195629,17z/data=!3m1!4b1!4m5!3m4!1s0x15039d60edaaebdd:0x9a417ab22771f9b3!8m2!3d31.0936562!4d35.7173742',
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    }
  }
}
