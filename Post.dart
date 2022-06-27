import 'package:flutter/material.dart';
import 'package:flutter_application_2/url.dart';
import 'package:http/http.dart' as http;

class Post extends StatefulWidget {
  const Post(
      {Key? key, this.name, this.image, this.Course_name, this.Student_ID})
      : super(key: key);
  final name;
  final image;
  final Course_name;
  final Student_ID;
  @override
  State<Post> createState() {
    return _PostState();
  }
}

var post_controller = TextEditingController();

class _PostState extends State<Post> {
  FontWeight bold = FontWeight.w500;
  var italic = FontStyle.normal;
  var color = Colors.black;

  Future AddMembers() async {
    var Url = Uri.parse(url1 + "pro/post.php");
    DateTime date = DateTime(now.year, now.month, now.day);

    var res = await http.post(Url, body: {
      "poster": widget.name,
      "poster_id": widget.Student_ID,
      "content": post_controller.text,
      "date": DateTime.parse(date.toString()),
      "time": now.hour.toString() + ":" + now.minute.toString(),
      "image": widget.image,
      "Course": widget.Course_name
    });
  }

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Create post',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.image.toString()),
                  radius: 40,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(21, 0, 10, 10),
                    child: Text(
                      'Student',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
            child: TextFormField(
              controller: post_controller,
              minLines: 7,
              maxLines: 8,
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
                hintText: "Click here to start typing",
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
                  borderSide: BorderSide(
                      width: 1.5, color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5, color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(9.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5, color: Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      child: InkWell(
                          onTap: () {}, child: Icon(Icons.attach_file))),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: InkWell(
                          onTap: () {},
                          child: Icon(Icons.format_bold_rounded))),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.format_underline_rounded)),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: InkWell(
                          onTap: () {},
                          child: Icon(Icons.format_italic_rounded))),
                  Container(
                    child: Card(
                      elevation: 5,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'color',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                child: InkWell(
                  onTap: () {
                    AddMembers();
                  },
                  child: Icon(
                    Icons.send_rounded,
                    color: Color.fromARGB(255, 145, 26, 26),
                    size: 35,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
