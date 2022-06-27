import 'package:flutter/material.dart';
import 'package:flutter_application_2/Home_Page.dart';
import 'package:flutter_application_2/page8.dart';

class Page8 extends StatefulWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Page8State();
  }
}

class _Page8State extends State<Page8> {
  int _currentIndex = 1;
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return const Page8();
            },
          ),
        );
      }
      if (_currentIndex == 0) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return const Home_Page();
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "Chats",
          style: const TextStyle(
            fontFamily: 'Quicksand',
          ),
        ),
        actions: [
          const Icon(
            Icons.add,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      /* bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        //selectedItemColor: Color.fromARGB(255, 145, 26, 26),
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined,
                color: Colors.grey.withOpacity(0.6)),
            label: "",
            activeIcon: const Icon(
              Icons.dashboard_rounded,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.chat_outlined, color: Colors.grey.withOpacity(0.6)),
            label: "",
            activeIcon: const Icon(
              Icons.chat_rounded,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded,
                color: Colors.grey.withOpacity(0.6)),
            label: "",
            activeIcon: const Icon(
              Icons.bar_chart_rounded,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined,
                color: Colors.grey.withOpacity(0.6)),
            label: "",
            activeIcon: const Icon(
              Icons.settings_rounded,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          )
        ],
      ),*/
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                  labelText: " Search",
                  hintText: " Search",
                  labelStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w400),
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w200),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(0.7),
                    size: 20,
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: 30,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.0, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.all(0),
              children: [
                ListTile(
                  title: Text('mmm'),
                ),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
                ListTile(),
              ],
            ),
            Text('glkjdhfuhg'),
          ],
        ),
      ),
    );
  }
}
