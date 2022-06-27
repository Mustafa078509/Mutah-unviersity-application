// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/url.dart';
import 'package:http/http.dart' as http;
import 'Mailto.dart';

class Professors extends StatefulWidget {
  const Professors({Key? key}) : super(key: key);

  @override
  State<Professors> createState() {
    return _ProfessorsState();
  }
}

class _ProfessorsState extends State<Professors> {
  List post = [];
  Future getdata() async {
    var Url = Uri.parse(url1 + "pro/teacher.php");
    var res = await http.get(Url);

    var response = jsonDecode(res.body);
    setState(() {
      post.addAll(response);
    });
  }

  Widget listProfessors(var w, var h) {
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
                    getdata();
                    Navigator.pushNamed(context, 'Mailto', arguments: {
                      "image": post[index]['url'],
                      "name": post[index]['name'],
                      "Degree": post[index]['Degree']
                    });
                  },
                  leading: Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(post[index]['url']),
                      radius: 30,
                    ),
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(post[index]['name'].toString(),
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(post[index]['Degree'].toString(),
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Contact a professor',
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
                child: listProfessors(screenWidth, screenHeight)),
          ],
        ),
      ),
    );
  }
}
