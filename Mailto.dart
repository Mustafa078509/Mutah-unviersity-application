import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Mailto extends StatefulWidget {
  const Mailto({Key? key}) : super(key: key);

  @override
  State<Mailto> createState() => _MailtoState();
}

class _MailtoState extends State<Mailto> {
  final To = TextEditingController();
  final Subject = TextEditingController();
  final Message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final teacher = ModalRoute.of(context)!.settings.arguments as Map;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future emailluncher({
      required String ToEmail,
      required String Message,
      required String Subject,
    }) async {
      final Murl =
          'mailto:$ToEmail?subject=${Uri.encodeFull(Subject)}&body=${Uri.encodeFull(Message)} ';
      if (await canLaunch(Murl)) {
        await launch(Murl);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Contact a professor',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
      ),
      body: Card(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: Card(
                elevation: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 10, 0, 10),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(teacher['image'].toString()),
                        radius: 55,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 20, 5),
                        child: Column(
                          children: [
                            Text(teacher['name'].toString(),
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19)),
                            Text(teacher['Degree'].toString(),
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 126, 125, 125))),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 5, 18, 5),
              child: TextField(
                controller: To,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  fontSize: 19,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: InputDecoration(
                  hintText: " Mail",
                  labelStyle: const TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  hintStyle: const TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  constraints: BoxConstraints(
                    maxHeight: screenHeight / 14,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 5, 18, 5),
              child: TextField(
                controller: Subject,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 19,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: InputDecoration(
                  hintText: " Subject",
                  labelStyle: const TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  hintStyle: const TextStyle(
                      fontSize: 19,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500),
                  constraints: BoxConstraints(
                    maxHeight: screenHeight / 14,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 5, 18, 5),
              child: TextFormField(
                controller: Message,
                minLines: 6,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(
                  fontSize: 19,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: const InputDecoration(
                  hintText: "Message",
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
              margin: EdgeInsets.fromLTRB(
                  screenWidth / 1.3, screenHeight / 10, 20, 10),
              child: InkWell(
                onTap: () {
                  emailluncher(
                      ToEmail: To.text,
                      Subject: Subject.text,
                      Message: Message.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      margin: const EdgeInsets.only(bottom: 150.0),
                      content: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(16),
                              height: 85,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 145, 26, 26),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 48,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'successfully! ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontFamily: 'Quicksand',
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Text(
                                          ' your professor will replay to you soon.',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontFamily: 'Quicksand',
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
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
                              width: 70,
                              height: 70,
                              color: const Color.fromARGB(255, 121, 19, 19),
                            ),
                          )
                        ],
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Image.asset(
                    'Assests/Images-Icons/Anm7.gif',
                    width: screenWidth / 8,
                    fit: BoxFit.fitWidth,
                  ),
                  radius: 35,
                  backgroundColor: Color.fromARGB(255, 145, 26, 26),
                ),
              ),
            ),
            /*Container(
              margin: const EdgeInsets.fromLTRB(50, 70, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      emailluncher(
                          ToEmail: To.text,
                          Subject: Subject.text,
                          Message: Message.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          margin: const EdgeInsets.only(bottom: 150.0),
                          content: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(16),
                                  height: 85,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromARGB(255, 145, 26, 26),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 48,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'successfully! ',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(
                                              ' your professor will replay to you soon.',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w400),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
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
                                  width: 70,
                                  height: 70,
                                  color: const Color.fromARGB(255, 121, 19, 19),
                                ),
                              )
                            ],
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                    backgroundColor: const Color.fromARGB(255, 145, 26, 26),
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
