import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_2/Post.dart';
import 'package:flutter_application_2/url.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Details extends StatefulWidget {
  const Details(
      {Key? key, this.name, this.Course_name, this.image, this.Student_ID})
      : super(key: key);
  final name;
  final Course_name;
  final image;
  final Student_ID;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List Data = [];
  Future GetStudyPlan() async {
    var Url = Uri.parse(url1 + "pro/getpost.php");
    var res = await http.post(Url, body: {
      "Course_name": widget.Course_name,
    });
    var response = jsonDecode(res.body);
    Data.addAll(response);
  }

  Widget listcomment(var w, var h) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: w,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              Data[index]['image'].toString(),
                            ),
                            radius: 20,
                          ),
                        ),
                        trailing: Text(Data[index]['time'],
                            style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.grey)),
                        title: Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 20),
                          child: Text(widget.name,
                              style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(Data[index]['content'].toString(),
                              style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget listpost(var w, var h) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: h,
      width: w,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 40, 10, 5),
                  child: Text(
                      DateFormat.yMMMd().format(
                        DateTime.parse(Data[index]['date']),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              Data[index]['image'].toString(),
                            ),
                            radius: 30,
                          ),
                        ),
                        trailing: Text(Data[index]['time'],
                            style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.grey)),
                        title: Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 20),
                          child: Text(widget.name,
                              style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Text(Data[index]['content'].toString(),
                              style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18)),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: listcomment(w, h)),
                      const Divider(
                        height: 1.5,
                        thickness: 1.5,
                        color: Color.fromARGB(255, 184, 182, 182),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(bottom: 0, right: 5, left: 5),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 4,
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          decoration: InputDecoration(
                            hintText: 'Type here to reply',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Quicksand',
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9)),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.replay,
                                color: Color.fromARGB(255, 145, 26, 26),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void initState() {
    setState(() {
      GetStudyPlan();
    });
    super.initState();

    // TODO: implement initState

    // Enable virtual display.
  }

  @override
  Widget build(BuildContext context) {
    File? pdffile;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final replayText = TextEditingController();
    /* Widget poster(String username, String imageUrl, String text) {
      return Column(
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        Data[0]['url'],
                      ),
                      radius: 30,
                    ),
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 20),
                    child: Text(widget.name,
                        style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(Data[0]['content'],
                        style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                  ),
                ),
                const Divider(
                  height: 1.5,
                  thickness: 1.5,
                  color: Color.fromARGB(255, 184, 182, 182),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3, right: 5, left: 5),
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 4,
                    controller: replayText,
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      hintText: 'Type here to reply',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.replay,
                          color: Color.fromARGB(255, 145, 26, 26),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }*/

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(30, screenHeight / 12, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Card(
                            elevation: 6,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  "Assests/Images-Icons/73z_2201_w009_n001_91a_p25_91.jpg",
                                  fit: BoxFit.fitHeight,
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  width: screenWidth / 3,
                                )),
                          ),
                        ),
                        Container(
                            height: screenHeight / 10,
                            width: screenWidth / 2.2,
                            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      widget.Course_name.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize:
                                            screenWidth / 19.6363636363636375,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottom: const TabBar(
              /*indicator: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 145, 26, 26), Colors.white],
                      begin: Alignment.bottomCenter,
                      end: Alignment.bottomCenter),
                ),*/
              indicatorWeight: 1.2,
              indicatorColor: Color.fromARGB(255, 145, 26, 26),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                    child: Text("Activity Feed",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ))),
                Tab(
                    child: Text("Content",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.bold))),
                Tab(
                    child: Text("Assignments",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 4),
        ),
        body: TabBarView(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              ListView(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, screenHeight / 6.5),
                  child: Stack(children: [
                    Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.fromLTRB(0, screenHeight / 11, 0, 0),
                          alignment: Alignment.center,
                          // ignore: prefer_const_constructors
                          child: Text('Welcome to Course Name',
                              style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.fromLTRB(10, 0, 10, screenHeight / 4),
                          alignment: Alignment.center,
                          child: const Text(
                              ' Use the floating button (+) below to start posting ',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 128, 127, 127))),
                        ),

                        // all the other widgets that will build during the running app will add here

                        Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                            child: listpost(screenWidth, screenHeight / 1.2)),

                        /*  poster(
                            'Jack Thomson',
                            'Assests/Images-Icons/121059868_259526655377234_4416396242070013326_n.jpg',
                            'when will the lecture  start today ? and who is the Admin here ,can I ask about something ?'),*/
                        /* poster(
                            'Jack Thomson',
                            'Assests/Images-Icons/121059868_259526655377234_4416396242070013326_n.jpg',
                            'when the lecture will start today ? and who is the Admin here ,can i ask about something ?'),
                        poster(
                            'Jack Thomson',
                            'Assests/Images-Icons/121059868_259526655377234_4416396242070013326_n.jpg',
                            'when the lecture will start today ? and who is the Admin here ,can i ask about something ?'),
                        poster(
                            'Jack Thomson',
                            'Assests/Images-Icons/121059868_259526655377234_4416396242070013326_n.jpg',
                            'when the lecture will start today ? and who is the Admin here ,can i ask about something ?')*/
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: EdgeInsets.fromLTRB(10, screenHeight / 10, 0, 30),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'Assests/Images-Icons/64fc1395455f4f05c97a5c7f6f0af6-unscreen.gif',
                        height: screenHeight / 5,
                        width: screenWidth / 2,
                      ),
                    ),
                  ]),
                ),
              ]),
              Container(
                margin: EdgeInsets.fromLTRB(
                    screenWidth / 1.2, screenHeight / 1.75, 10, 10),
                child: FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 145, 26, 26),
                  onPressed: () {
                    print(screenWidth);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return Post(
                            name: widget.name.toString(),
                            image: widget.image.toString(),
                            Course_name: widget.Course_name.toString(),
                            Student_ID: widget.Student_ID.toString(),
                          );
                        },
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
            Container(
              child: ListView(children: [
                Container(),
                Container(),
              ]),
            ),
            Container(
              //this content is for professors
              /*child: Stack(clipBehavior: Clip.none, children: [
                  ListView(children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, screenHeight / 11, 10, 0),
                      alignment: Alignment.center,
                      // ignore: prefer_const_constructors
                      child: Text("You haven't added any assignment yet!",
                          style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      alignment: Alignment.center,
                      child: const Text(
                          ' Use the floating button (+) below to start adding  ',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 128, 127, 127))),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 30),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'Assests/Images-Icons/43-435832_opt-in-form-homework-assignment.png',
                        height: screenHeight / 9,
                        width: screenWidth / 3,
                      ),
                    ),
                  ]),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        screenWidth / 1.2, screenHeight / 1.75, 10, 10),
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 145, 26, 26),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Post();
                            },
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )

                ]),*/

              //This content is for students

              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(screenWidth / 6, screenHeight / 10,
                  screenWidth / 6, screenHeight / 5),
              child: Center(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'Assests/Images-Icons/43-435832_opt-in-form-homework-assignment.png',
                      ),
                      radius: 55,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: const Text(
                      'No Assignments (yet!)',
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: const Text(
                      "If your teacher sets up Assignments for this class, you'll find them here. ",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 124, 124, 124)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => const Details()));
                      },
                      child: const Text(
                        "Refresh",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 145, 26, 26)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                        // fixedSize: MaterialStateProperty.all(Size(84, 40)),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
