import 'package:flutter/material.dart';

class Page6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page6State();
  }
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250, //internal widget
            //mainAxisExtent: 150,
            mainAxisSpacing: 10, //between widget \
            crossAxisSpacing: 10, //between widget -
            childAspectRatio: 1,
          ),
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              child: Image.asset(
                "Assests/Images-Icons/161-trending-flat-outline.gif",
                height: 30,
                width: 30,
              ),
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(10),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '1',
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.black.withOpacity(0.92)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              child: Text('1'),
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(10),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              child: Text('1'),
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
