import 'package:flutter/material.dart';

//scroll view page

class info {
  String name;
  int age;
  DateTime date;

  info(this.name, this.age, this.date);
}

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);

  var x = [
    info('monther', 23, DateTime.now()),
    info('monther2', 21, DateTime.now()),
    info('monther3', 22, DateTime.now()),
    info('monther4', 20, DateTime.now()),
    info('monther', 23, DateTime.now()),
    info('monther2', 21, DateTime.now()),
    info('monther3', 22, DateTime.now()),
    info('monther4', 20, DateTime.now()),
    info('monther', 23, DateTime.now()),
    info('monther2', 21, DateTime.now()),
    info('monther3', 22, DateTime.now()),
    info('monther4', 20, DateTime.now()),
    info('monther4', 20, DateTime.now()),
    info('monther', 23, DateTime.now()),
    info('monther2', 21, DateTime.now()),
    info('monther3', 22, DateTime.now()),
    info('monther4', 20, DateTime.now()),
    info('monther', 23, DateTime.now()),
    info('monther2', 21, DateTime.now()),
    info('monther3', 22, DateTime.now()),
    info('monther4', 20, DateTime.now()),
    info('monther4', 20, DateTime.now()),
    info('monther', 23, DateTime.now()),
    info('monther2', 21, DateTime.now()),
    info('monther3', 22, DateTime.now()),
    info('monther4', 20, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.pix_rounded, color: Colors.black),
        title: const Text(
          'Mutah University',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(
            Icons.density_medium_sharp,
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(26, 0, 0, 0),
        child: ListView(children: [
          ...x.map((val) {
            return Container(
              margin: EdgeInsets.all(6),
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        val.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "${val.age}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ("${val.date}"),
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
          SizedBox(
            width: 20,
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Submit"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 235, 247, 129)),
                  overlayColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 213, 228, 82)),
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 0, 0, 0)),
                  splashFactory: NoSplash.splashFactory),
            ),
            TextButton(onPressed: () {}, child: const Text("Sign up")),
            OutlinedButton(onPressed: () {}, child: const Text("Enter")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.login),
                label: const Text("Login")),
            /*FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueAccent,
              splashColor: Color.fromARGB(255, 71, 39, 29),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),*/
          ]),
        ]),
      ),
    );
  }
}
