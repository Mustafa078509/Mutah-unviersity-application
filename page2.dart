import 'dart:ffi';
import 'package:flutter/material.dart';

//textfield && drawer page

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var x = const Color.fromARGB(255, 255, 255, 255);
  var y = const Icon(Icons.abc);
  var z = const Text("Personal Information");
  var v = [const Icon(Icons.back_hand)];
  var s = "";
  var c = TextEditingController();
  bool pp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: x,
        leading: y,
        title: z,
        //actions: v,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  const Text(
                    "Welcome ",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    s,
                    style: const TextStyle(
                        fontSize: 21, color: Color.fromARGB(255, 97, 94, 94)),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              margin: const EdgeInsets.fromLTRB(20, 0, 5, 10),
              alignment: Alignment.topLeft,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 25, 25, 5),
              child: TextField(
                keyboardType: TextInputType.name,
                controller: c,
                style: const TextStyle(fontSize: 17),
                decoration: const InputDecoration(
                  hintText: " Username",
                  hintStyle: TextStyle(fontSize: 17),
                  prefixIcon: Icon(
                    Icons.person_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.6, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.6, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.2, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 17),
                  decoration: InputDecoration(
                    hintText: " E-mail",
                    hintStyle: TextStyle(fontSize: 17),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 30,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.6, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.6, color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.2, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: " Password",
                  hintStyle: const TextStyle(fontSize: 17),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.6, color: Colors.black),
                    borderRadius: BorderRadius.all(const Radius.circular(0.0)),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.6, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.2, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  suffixIcon: IconButton(
                    iconSize: 18,
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
                            color: Colors.black,
                          ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 17),
                obscureText: pp,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 5, 25, 20),
              child: const TextField(
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 17, color: Colors.black),
                decoration: InputDecoration(
                  hintText: " Phone",
                  hintStyle: TextStyle(fontSize: 17),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                    size: 30,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.6, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.6, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.2, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      s = c.text;
                    });
                  },
                  child: const Text(
                    "Get The Name",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(40, 20, 40, 20)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "SignUp",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(40, 20, 40, 20)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              x = Colors.brown;
              y = const Icon(Icons.ads_click);
              z = const Text("Fuckin Mutah University");
              v = [const Icon(Icons.fingerprint)];
            });
          },
          child: const Icon(Icons.change_history_rounded)),*/
      drawerScrimColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
      endDrawer: Drawer(
       
        //backgroundColor: Color.fromARGB(255, 145, 26, 26),
        child: ListView(padding: EdgeInsets.all(20), children: [
          Card(
            child: ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.notification_important,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text('This is first option'),
              trailing: Icon(Icons.done_outlined),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notification_important,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notification_important,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notification_important,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notification_important,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notification_important,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notification_important,
                color: Color.fromARGB(255, 145, 26, 26),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w100),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
