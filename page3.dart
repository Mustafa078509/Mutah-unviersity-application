import 'package:flutter/material.dart';

//splitscreen page

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar Title"),
        backgroundColor: const Color.fromARGB(255, 6, 44, 48),
        toolbarHeight: 85,
        elevation: 15,
      ),
      body: Container(
        color: const Color.fromARGB(255, 241, 235, 235),
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 196, 238, 230),
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Row1',
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 43, 149, 153),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    'Row2',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 64, 81, 78),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Same Column Text1',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text2',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text3',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text4',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text5',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text6',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text7',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text8',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text9',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text10',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text11',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text12',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text13',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text14',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Same Column Text15',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 8, 102, 105),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    'Row3',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 48, 227, 202),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text(
                    'Row4',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
