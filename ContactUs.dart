import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final CN = TextEditingController();
  final CE = TextEditingController();
  final CM = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future emailluncher({
      required String CM,
      required String CN,
    }) async {
      final Murl =
          'mailto:MutahAppModerators@gmail.com?subject=${Uri.encodeFull(CN)}&body=${Uri.encodeFull(CM)} ';
      if (await canLaunch(Murl)) {
        await launch(Murl);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Get in touch',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Card(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.asset(
                "Assests/Images-Icons/contact us gif.gif",
                width: screenWidth / 3,
                height: screenHeight / 5,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: TextField(
                controller: CN,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  labelText: " Name",
                  hintText: " Name",
                  labelStyle: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  hintStyle: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  constraints: BoxConstraints(
                    maxHeight: 60,
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
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
              child: TextField(
                //controller: CE,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Quicksand',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  labelText: " Email",
                  hintText: " Email",
                  labelStyle: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  hintStyle: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  constraints: BoxConstraints(
                    maxHeight: 60,
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
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
              child: TextFormField(
                controller: CM,
                minLines: 5,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Quicksand',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: const InputDecoration(
                  floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  labelText: " What can we help you with?",
                  hintText: " Message",
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  hintStyle: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
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
              margin: const EdgeInsets.fromLTRB(50, 50, 15, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      emailluncher(CN: CN.text, CM: CM.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          margin: EdgeInsets.only(bottom: screenHeight / 6),
                          content: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                  padding: EdgeInsets.all(12),
                                  height: screenHeight / 10,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromARGB(255, 145, 26, 26),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth / 6,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Thank you! ',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.white,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              ' We appreciate your feedback.',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w500),
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
                                  width: screenWidth / 5,
                                  height: screenHeight / 9,
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
                      CN.text = "";
                      CE.text = "";
                      CM.text = "";

                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    backgroundColor: const Color.fromARGB(255, 145, 26, 26),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
