// ignore_for_file: avoid_unnecessary_containers
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/url.dart';
import 'package:http/http.dart' as http;
import 'Mailto.dart';

class Members extends StatefulWidget {
  const Members({Key? key, this.Course_Name}) : super(key: key);
  final Course_Name;
  @override
  State<Members> createState() {
    return _MembersState();
  }
}

class _MembersState extends State<Members> {
  List post = [];
  Future GetStudyPlan() async {
    var Url = Uri.parse(url1 + "pro/meber.php");
    var res = await http.post(Url, body: {
      "Course": widget.Course_Name,
    });
    var response = jsonDecode(res.body);
    post.addAll(response);
  }

  Widget listMembers(var w, var h) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: post.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  onTap: () {
                    GetStudyPlan();
                    Navigator.pushNamed(context, 'Mailto', arguments: {
                      "image": post[index]['url'],
                      "name": post[index]['name'],
                      "Degree": post[index]['Degree']
                    });
                  },
                  trailing: Icon(
                    Icons.card_membership_rounded,
                    color: Color.fromARGB(255, 145, 26, 26),
                  ),
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(post[index]['url']),
                      radius: 30,
                    ),
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(post[index]['Student_ID'].toString(),
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(post[index]['Student'].toString(),
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
  void initState() {
    setState(() {
      GetStudyPlan();
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Members',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 0, 5, 0),
              child: Text(
                widget.Course_Name,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 94, 94, 94)),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(top: 40),
                child: listMembers(screenWidth, screenHeight / 1.2)),
          ],
        ),
      ),
    );
  }
}
