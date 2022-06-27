import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Login_Page.dart';
import 'package:flutter_application_2/Mailto.dart';
import 'package:flutter_application_2/Notifications.dart';
import 'package:flutter_application_2/main.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  List notify = [];
  Widget listNotification(var w, var h) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: double.infinity,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  onTap: () {
                    /*
                    getdata();
                    Navigator.pushNamed(context, 'Mailto', arguments: {
                      "image": post[index]['url'],
                      "name": post[index]['name'],
                      "Degree": post[index]['Degree']
                    });*/
                  },
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(notify[index]['url']),
                      radius: 30,
                    ),
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Text("post[index]['name'].toString()",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text("post[index]['Degree'].toString()",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool x = true;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Widget notifypage() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Notifications',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: screenHeight / 1.05,
                    child: listNotification(screenWidth, screenHeight)),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, screenHeight / 12),
          child: EasySplashScreen(
            logoSize: screenWidth / 4.5,
            title: Text(
              'Looking for notifications for you ...',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color.fromARGB(255, 53, 53, 53)),
            ),
            logo: Image.asset(
              'Assests/Images-Icons/output-onlinegiftools.gif',
              width: screenWidth / 1.2,
              height: screenHeight / 3,
              fit: BoxFit.fill,
              scale: screenHeight,
            ),
            showLoader: true,
            // navigator: x ? Notifications() : notifypage(),
            navigator: Notifications(),
            durationInSeconds: 5,
          ),
        ),
      ),
    );
  }
}
