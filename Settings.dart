import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/ContactUs.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _stateSettings();
  }
}

class _stateSettings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool switch_val = true;
    List lan_items = ['English', 'Arabic'];
    var Selected_val;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Card(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 5, 5),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: const Icon(
                      Icons.app_shortcut_rounded,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Display',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600,
                        fontSize: 19),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight / 10,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: const Icon(
                            Icons.dark_mode_rounded,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                          child: const Text(
                            'Dark Mode',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Switch(
                        activeColor: Colors.black,
                        inactiveThumbColor: Colors.white,
                        value: switch_val,
                        onChanged: (_) {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight / 10,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: const Icon(
                            Icons.translate_rounded,
                            color: Colors.black,
                            size: 21,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: const Text(
                            'Languages',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: DropdownButton(
                          underline: Container(),
                          dropdownColor: Colors.white,
                          focusColor: Colors.white,
                          hint: const Text(
                            'English',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          value: Selected_val,
                          items: lan_items.map((item) {
                            return DropdownMenuItem(
                              child: Text(item),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              Selected_val = val;
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 5, 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.privacy_tip_outlined,
                          color: Colors.black,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Privacy',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                fontSize: 19),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight / 10,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: const Icon(
                            Icons.roundabout_left_rounded,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                          child: const Text(
                            'Location',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Switch(
                        activeColor: Colors.black,
                        inactiveThumbColor: Colors.white,
                        value: switch_val,
                        onChanged: (_) {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: screenHeight / 10,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: const Icon(
                            Icons.abc_rounded,
                            color: Colors.black,
                            size: 23,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: const Text(
                            'Show Password',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 25),
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                margin: EdgeInsets.only(
                                    bottom: screenHeight / 4, top: 200),
                                content: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(16),
                                        height: screenHeight / 12,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color:
                                              Color.fromARGB(255, 145, 26, 26),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 48,
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Your Password : ',
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        color: Colors.white,
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    ' 68765694635',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                      top: -20,
                                      left: 0,
                                      child: Image.asset(
                                        'Assests/115-1158668_hot-air-balloon-hot-air-balloon-svg-free-removebg-preview.png',
                                        width: 50,
                                        height: 50,
                                        color: Color.fromARGB(255, 121, 19, 19),
                                      ),
                                    )
                                  ],
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            );
                          },
                          onHover: (_) {},
                          child: Text(
                            'Show',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.help_center_rounded,
                        color: Colors.black,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          'Help',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w500,
                              fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: screenHeight / 10,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 50),
              child: InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushReplacement(MaterialPageRoute(
                    builder: (_) {
                      return ContactUs();
                    },
                  ));

                  //arguments: {'username': c.text},
                },
                child: Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        child: const Icon(
                          Icons.question_mark_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(7, 5, 10, 5),
                        child: const Text(
                          'help',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
