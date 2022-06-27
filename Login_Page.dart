/*import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//login page

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login_PageState();
  }
}

class _Login_PageState extends State<Login_Page> {
  bool pp = true;
  var c = TextEditingController();
  var username;
  var url = "https://www.mutah.edu.jo/Home.aspx#";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: ListView(
            children: [
              Container(
                child: Container(
                  child: Image.asset(
                    "Assests/Images-Icons/MutahLogo_auto_x2-removebg-preview (1).png",
                    width: screenWidth / 4,
                    height: screenHeight / 5,
                    filterQuality: FilterQuality.high,
                  ),
                  margin: EdgeInsets.only(
                      top: screenHeight / 11, bottom: screenHeight / 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  controller: c,
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    labelText: " Username",
                    hintText: " ID",
                    labelStyle: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600),
                    hintStyle: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500),
                    prefixIcon: Icon(
                      Icons.person_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                    constraints: BoxConstraints(
                      minHeight: screenHeight / 11,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: TextField(
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                      labelText: " password",
                      labelStyle: const TextStyle(
                          fontSize: 19,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500),
                      hintText: " Password",
                      hintStyle: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      prefixIcon: const Icon(
                        Icons.abc,
                        color: Colors.black,
                        size: 28,
                      ),
                      suffixIcon: IconButton(
                        iconSize: 16,
                        onPressed: () {
                          setState(() {
                            pp = !pp;
                          });
                        },
                        icon: pp
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Color.fromARGB(255, 73, 68, 68),
                              ),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: screenHeight / 11,
                      )),
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  obscureText: pp,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.fromLTRB(0, 0, 15, screenHeight / 21),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500),
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth / 3.5, 0, screenWidth / 3.5, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      'Home_Page',
                      arguments: {'username': c.text},
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(25, 15, 25, 15)),
                    // fixedSize: MaterialStateProperty.all(Size(84, 40)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight / 8, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Go To The Website?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontSize: 14,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () async {
                          await launch(url);
                        },
                        child: const Text(
                          "Mutah University",
                          style: TextStyle(
                              color: Color.fromARGB(255, 19, 91, 150),
                              fontSize: 13,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Home_Page.dart';
import 'package:flutter_application_2/url.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login_PageState();
  }
}

class _Login_PageState extends State<Login_Page> {
  bool pp = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController UserController = TextEditingController();

  var username;
  var url = "https://www.mutah.edu.jo/Home.aspx#";
  List Data = [];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: ListView(
            children: [
              Container(
                child: Container(
                  child: Image.asset(
                    "Assests/Images-Icons/MutahLogo_auto_x2-removebg-preview (1).png",
                    width: screenWidth / 4,
                    height: screenHeight / 5,
                    filterQuality: FilterQuality.high,
                  ),
                  margin: EdgeInsets.only(
                      top: screenHeight / 11, bottom: screenHeight / 15),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  controller: UserController,
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    labelText: " Username",
                    hintText: " ID",
                    labelStyle: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500),
                    hintStyle: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500),
                    prefixIcon: Icon(
                      Icons.person_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                    constraints: BoxConstraints(
                      minHeight: screenHeight / 11,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(9.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: TextField(
                  textAlign: TextAlign.left,
                  cursorColor: Colors.black,
                  cursorWidth: 1,
                  controller: passwordController,
                  decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                      labelText: " password",
                      labelStyle: const TextStyle(
                          fontSize: 19,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500),
                      hintText: " Password",
                      hintStyle: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      prefixIcon: const Icon(
                        Icons.abc,
                        color: Colors.black,
                        size: 28,
                      ),
                      suffixIcon: IconButton(
                        iconSize: 16,
                        onPressed: () {
                          setState(() {
                            pp = !pp;
                          });
                        },
                        icon: pp
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Color.fromARGB(255, 73, 68, 68),
                              ),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: screenHeight / 11,
                      )),
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  obscureText: pp,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.fromLTRB(0, 0, 15, screenHeight / 21),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500),
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth / 3.5, 0, screenWidth / 3.5, 0),
                child: ElevatedButton(
                  onPressed: () {
                    login(UserController.text, passwordController.text);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(25, 15, 25, 15)),
                    // fixedSize: MaterialStateProperty.all(Size(84, 40)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight / 8, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Go To The Website?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontSize: 14,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () async {
                          await launch(url);
                        },
                        child: const Text(
                          "Mutah University",
                          style: TextStyle(
                              color: Color.fromARGB(255, 19, 91, 150),
                              fontSize: 13,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future login(String user, String pass) async {
    var Url = Uri.parse(url1 + "pro/login.php");

    var res = await http.post(Url, body: {"user": user, "pass": pass});

    var response = jsonDecode(res.body);

    if (response != "false") {
      Data.addAll(response);

      ///natvigator to home page

      if (user.length == 12) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home_Page(
              user: Data[0]['MuNum'],
              image: Data[0]['url'].toString(),
              name: Data[0]['name'],
            ),
          ),
        );
      }
    } else if (response == "false") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.LEFTSLIDE,
        title: 'Incorrect Login Credentials',
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Incorrect Login Credentials")],
          )
        ]),
        btnOkText: "Ok",
        btnOkIcon: Icons.check_circle,
        btnOkColor: Theme.of(context).primaryColor,
        btnOkOnPress: () {},
      )..show();
    }
  }
}
