import 'dart:convert';
import 'dart:ffi';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_application_2/Post.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_2/MySplashScreen.dart';
import 'package:flutter_application_2/url.dart';

import 'Home_Page.dart';

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() {
    return _NotificationsState();
  }
}

class _NotificationsState extends State<Notifications> {
  List post = [];
  Future getdata() async {
    var Url = Uri.parse(url1 + "pro/notification.php");
    var res = await http.get(Url);

    var response = jsonDecode(res.body);
    setState(() {
      post.addAll(response);
    });
  }

  List pages = [];
  Widget listNotification(var w, var h) {
    if (post.isNotEmpty) {
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: double.infinity,
        child: ListView.builder(
            itemCount: post.length,
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
                        backgroundImage: NetworkImage(''),
                        radius: 30,
                      ),
                    ),
                    title: Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Text(post[index]['teacher_name'].toString(),
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(post[index]['Details'].toString(),
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
    } else {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(30, 70, 30, 20),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'Assests/Images-Icons/1649858522253.jpg',
                  ),
                  radius: 80,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  'No notifications (yet!)',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: Text(
                  'Relevant notifications about your activitys and courses will appear here. ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 124, 124, 124)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      /* Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => super.widget));
                      print('object');*/
                      getdata();
                    });
                  },
                  child: const Text(
                    "Refresh",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 145, 26, 26)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(25, 13, 25, 13)),
                    // fixedSize: MaterialStateProperty.all(Size(84, 40)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    setState(() {
      getdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: listNotification(screenWidth, screenHeight)),
    );
  }
}



 /*Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(30, 70, 30, 20),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'Assests/Images-Icons/1649858522253.jpg',
                  ),
                  radius: 80,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  'No notifications (yet!)',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: Text(
                  'Relevant notifications about your activitys and courses will appear here. ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 124, 124, 124)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacement(MaterialPageRoute(
                      builder: (_) {
                        return SplashScreen();
                      },
                    ));
                  },
                  child: const Text(
                    "Refresh",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 145, 26, 26)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(25, 13, 25, 13)),
                    // fixedSize: MaterialStateProperty.all(Size(84, 40)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),*/