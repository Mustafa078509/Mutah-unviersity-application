import 'dart:convert';
import 'package:flutter_application_2/Members.dart';
import 'package:flutter_application_2/url.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/ContactUs.dart';
import 'package:flutter_application_2/Login_Page.dart';
import 'package:flutter_application_2/Settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'Mailto.dart';
import 'Notifications.dart';
import 'Professor.dart';
import 'details.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({
    Key? key,
    this.user,
    this.image,
    this.name,
  }) : super(key: key);
  final image;
  final user;
  final name;
  @override
  State<StatefulWidget> createState() {
    return _Home_PageState();
  }
}

class _Home_PageState extends State<Home_Page> {
  int _currentIndex = 0;
  var currentindex_image_list = 0;
  List Data = [];

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final ScrollController _controller = ScrollController();

// This is what you're looking for!
  void _scrollDown() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  void _scrollUp() {
    _controller.jumpTo(_controller.position.minScrollExtent);
  }

  List post = [];
  Future getdata() async {
    var Url = Uri.parse(url1 + "pro/teacher.php");
    var res = await http.get(Url);

    var response = jsonDecode(res.body);
    setState(() {
      post.addAll(response);
    });
  }

  final _saved = Set<BuildContext>();
  @override
  void initState() {
    setState(() {
      GetStudyPlan(widget.user.toString());
      getdata();
    });
    super.initState();

    // TODO: implement initState

    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final alreadySaved = _saved.contains(context);
    var down = Icons.arrow_downward_rounded;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var url = "https://www.mutah.edu.jo/Home.aspx#";
    List image_list_news = [
      "Assests/Images-Icons/100.jpg",
      "Assests/Images-Icons/SlideShowMutah.jpg",
      "Assests/Images-Icons/MutahQSStars2021.jpg"
    ];
    List news_texts = [
      '100 Years of Jordan: Emergence and National Narrative',
      'Mutah University: Towards a better educational environment',
      'QS world University Rankings 2022'
    ];

    List Courses_images = [
      'Assests/Images-Icons/73z_2201_w009_n001_91a_p25_91.jpg',
      'Assests/Images-Icons/2202_w037_n003_210a_p1_210.png',
      'Assests/Images-Icons/5251.png',
      'Assests/Images-Icons/2112.w037.n003.50B.p1.50.png',
    ];

    var Surl =
        'http://portal1.mutah.edu.jo/eservice/faces/loginView?_adf.ctrl-state=173l0ibdx4_3';
    var Rurl = 'http://app.mutah.edu.jo:7777/studreg/';
    var Lurl = 'https://lms.mutah.edu.jo/login/index.php';
    bool pp = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 13),
        child: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            "  Mutah University",
            style: TextStyle(
                fontSize: 24,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.keyboard_option_key_rounded,
                  size: 28,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          leading: Container(
            alignment: Alignment.centerRight,
            child: Image.asset(
              "Assests/Images-Icons/hnet.com-image.ico",
              height: screenHeight / 8,
              width: screenWidth / 8,
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        //backgroundColor: Color.fromARGB(255, 145, 26, 26),
        child: ListView(padding: const EdgeInsets.all(20), children: [
          //Container(child: ,),
          Card(
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.image),
                    radius: 50,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text(
                          'Hey, ',
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.name.toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 114, 113, 113),
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(
                    context,
                  ).pushReplacement(MaterialPageRoute(
                    builder: (_) {
                      return const Home_Page();
                    },
                  ));
                },
                leading: const Icon(
                  Icons.home_filled,
                  color: Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 3, 0, 0)),
                ),
                trailing: const Icon(
                  Icons.arrow_right_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(
                    context,
                    'AboutUs',
                    arguments: {},
                  );
                },
                leading: const Icon(
                  Icons.error_outline,
                  color: Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'About us',
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_right_rounded,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return Notifications();
                      },
                    ),
                  );
                },
                leading: const Icon(
                  Icons.notifications_none_rounded,
                  color: const Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'Notification',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_right_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) {
                      return const ContactUs();
                    },
                  ));
                },
                leading: const Icon(
                  Icons.connect_without_contact_rounded,
                  color: Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'Contact Us',
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_right_rounded,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  launch(url);
                },
                leading: const Icon(
                  Icons.web_rounded,
                  color: Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'Website',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_right_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pop();
                launch(Lurl);
              },
              leading: const Icon(
                Icons.menu_book_rounded,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: const Text(
                'E_Learning',
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(
                Icons.arrow_right_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pop();
                launch(Surl);
              },
              leading: const Icon(
                Icons.electrical_services_rounded,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: const Text(
                'E_Services',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(
                Icons.arrow_right_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pop();
                launch(Rurl);
              },
              leading: const Icon(
                Icons.app_registration_rounded,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: const Text(
                'E_Registration',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(
                Icons.arrow_right_rounded,
                color: Colors.black,
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: const Icon(
                  Icons.location_city_rounded,
                  color: Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'Map',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_right_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) {
                      return Settings();
                    },
                  ));
                },
                leading: const Icon(
                  Icons.app_settings_alt_rounded,
                  color: const Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_right_rounded,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) {
                      return const Login_Page();
                    },
                  ));
                },
                leading: const Icon(
                  Icons.logout_rounded,
                  color: Color.fromARGB(255, 145, 26, 26),
                ),
                title: const Text(
                  'Log Out',
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ]),
      ),
      body: ListView(
        controller: _controller,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: const Icon(
                    Icons.newspaper_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: const Text(
                    'News',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: CarouselSlider.builder(
              itemCount: image_list_news.length,
              options: CarouselOptions(
                height: screenHeight / 5.5,
                enlargeCenterPage: true,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                onPageChanged: (index, _) {
                  setState(() {
                    currentindex_image_list = index;
                  });
                },
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
              itemBuilder: (BuildContext context, int index, _) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    elevation: 6,
                    child: Stack(
                      children: [
                        Container(
                          transformAlignment: Alignment.center,
                          height: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              image_list_news[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          transformAlignment: Alignment.center,
                          margin: const EdgeInsets.fromLTRB(0, 70, 0, 5),
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            currentindex_image_list == Null
                                ? "100 Years of Jordan: Emergence and National Narrative"
                                : news_texts[currentindex_image_list],
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: screenWidth / 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.black.withOpacity(0.6),
                          width: double.infinity,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(4, 12, 4, 10),
                width: 12,
                height: 2.5,
                decoration: BoxDecoration(
                    color: currentindex_image_list == 0
                        ? const Color.fromARGB(255, 145, 26, 26)
                        : const Color.fromARGB(255, 201, 199, 199),
                    shape: BoxShape.rectangle),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(3, 12, 3, 10),
                width: 12,
                height: 2.5,
                decoration: BoxDecoration(
                    color: currentindex_image_list == 1
                        ? const Color.fromARGB(255, 145, 26, 26)
                        : const Color.fromARGB(255, 201, 199, 199),
                    shape: BoxShape.rectangle),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(3, 12, 3, 10),
                width: 12,
                height: 2.5,
                decoration: BoxDecoration(
                    color: currentindex_image_list == 2
                        ? const Color.fromARGB(255, 145, 26, 26)
                        : const Color.fromARGB(255, 201, 199, 199),
                    shape: BoxShape.rectangle),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Hey ' + widget.name + ',',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Choose the course you want to learn, Are you ready?',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 141, 140, 140),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: const Icon(
                    Icons.library_books_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: const Text(
                    'Courses',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: screenHeight / 1.5,
              child: listCourse(screenWidth, screenHeight, Courses_images)),
          Container(
            margin: const EdgeInsets.only(top: 40, left: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: const Icon(
                    Icons.compare_arrows_rounded,
                    size: 21,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: const Text(
                    'Professors',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenWidth / 2.15,
                      height: screenHeight / 11,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Mailto', arguments: {
                            'name': post[0]['name'],
                            'image': post[0]['url'],
                            'Degree': post[0]['Degree']
                          });
                        },
                        child: Card(
                          elevation: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          post[0]['url'].toString()),
                                      radius: 25,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 10, 0),
                                        child: Text(
                                          'Mohammad',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Quicksand',
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 5),
                                        child: Text(
                                          'Ali Abbadi',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth / 2.15,
                      height: screenHeight / 11,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Mailto', arguments: {
                            'name': post[1]['name'],
                            'image': post[1]['url'],
                            'Degree': post[1]['Degree']
                          });
                        },
                        child: Card(
                          elevation: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        post[1]['url'].toString(),
                                      ),
                                      radius: 25,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 30, 0),
                                        child: Text(
                                          'Hayat',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 30, 5),
                                        child: const Text(
                                          'Dmour',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenWidth / 2.15,
                      height: screenHeight / 11,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Mailto', arguments: {
                            'name': post[6]['name'],
                            'image': post[6]['url'],
                            'Degree': post[6]['Degree']
                          });
                        },
                        child: Card(
                          elevation: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        post[6]['url'].toString(),
                                      ),
                                      radius: 25,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 10, 0),
                                        child: Text(
                                          'Omar',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 5),
                                        child: Text(
                                          'Lasasmeh',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth / 2.15,
                      height: screenHeight / 11,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Mailto', arguments: {});
                        },
                        child: Card(
                          elevation: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        post[3]['url'].toString(),
                                      ),
                                      radius: 25,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 5, 10, 0),
                                        child: const Text(
                                          'Rafat',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 5),
                                        child: Text(
                                          'Almsiedeen',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: screenWidth / 2.15,
                      height: screenHeight / 11,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Mailto', arguments: {
                            'name': post[3]['name'],
                            'image': post[3]['url'],
                            'Degree': post[3]['Degree']
                          });
                        },
                        child: Card(
                          elevation: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        post[3]['url'].toString(),
                                      ),
                                      radius: 25,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 10, 0),
                                        child: Text(
                                          'Afaf',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 5),
                                        child: Text(
                                          'H. Al-Nadaf',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth / 2.15,
                      height: screenHeight / 11,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Mailto', arguments: {
                            'name': post[5]['name'],
                            'image': post[5]['url'],
                            'Degree': post[5]['Degree']
                          });
                        },
                        child: Card(
                          elevation: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        post[5]['url'].toString(),
                                      ),
                                      radius: 25,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 10, 0),
                                        child: Text(
                                          'Moutaz',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 5),
                                        child: const Text(
                                          'Moubydien',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 2),
                      width: screenWidth / 2.15,
                      height: screenHeight / 11,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'Mailto', arguments: {
                            'name': post[4]['name'],
                            'image': post[4]['url'],
                            'Degree': post[4]['Degree']
                          });
                        },
                        child: Card(
                          elevation: 6,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        post[4]['url'].toString(),
                                      ),
                                      radius: 25,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 25, 0),
                                        child: const Text(
                                          'Ahmad',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 25, 5),
                                        child: Text(
                                          'Abadleh',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Quicksand'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) {
                                  return const Professors();
                                },
                              ));
                            },
                            child: const Text(
                              'View all proffessor',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) {
                                  return const Professors();
                                },
                              ));
                            },
                            child: const Icon(Icons.arrow_right_alt_rounded,
                                color: Color.fromARGB(255, 0, 0, 0), size: 23),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0, 5),
            child: FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: const Color.fromARGB(255, 145, 26, 26),
              onPressed: () {
                GetStudyPlan("user");
                pp ? _scrollDown() : _scrollUp();

                if (pp) {
                  pp = false;
                } else {
                  pp = true;
                }
                ;
              },
              child: pp
                  ? const Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.white,
                      size: 26,
                    )
                  : const Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: const Color.fromARGB(255, 145, 26, 26),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return Notifications();
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.notifications_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 27,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future news() async {
    List Data = [];

    var Url = Uri.parse(url1 + "sign%20in.php");

    var res = await http.get(Url);

    var response = jsonDecode(res.body);
  }

  Future GetStudyPlan(String user) async {
    var Url = Uri.parse(url1 + "pro/home_page.php");
    var res = await http.post(Url, body: {
      "Username": user,
    });
    var response = jsonDecode(res.body);
    Data.addAll(response);
  }

  Widget listCourse(var w, var h, List images) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(bottom: 10, top: 5),
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          height: double.infinity,
          child: ListView.builder(
              itemCount: Data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return Details(
                              Course_name: Data[index]['Course_name'],
                              image: widget.image,
                              name: widget.name,
                              Student_ID: Data[index]['Student_ID'],
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              images[index],
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                              height: h / 7,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 10, 5, 5),
                                child: Text(
                                  '15 Members',
                                  style: TextStyle(
                                      fontSize: h / 55,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 20,
                                ),
                                child: DropdownButton(
                                  elevation: 3,
                                  icon: Icon(
                                    Icons.group_rounded,
                                    color: Color.fromARGB(255, 145, 26, 26),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                  underline: Container(),
                                  dropdownColor: Colors.white,
                                  menuMaxHeight: h / 20,
                                  alignment: Alignment.center,
                                  hint: const Text(
                                    '',
                                    style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 1),
                                  ),
                                  onChanged: (_) {},
                                  items: [
                                    DropdownMenuItem(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) {
                                                return Members(
                                                    Course_Name: Data[index]
                                                        ['Course_name']);
                                              },
                                            ),
                                          );
                                        });
                                      },
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            print(Data[index]['Course_name']
                                                .toString());
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) {
                                                  return Members(
                                                      Course_Name: Data[index]
                                                          ['Course_name']);
                                                },
                                              ),
                                            );
                                          });
                                        },
                                        child: Text(
                                          'Members',
                                          style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                      ),
                                      value: '',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 3, 5, 10),
                            child: Text(
                              Data[index]['Course_name'].toString(),
                              style: TextStyle(
                                  fontSize: h / 40,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
