// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//bottom sheet & datepicker page

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Page5State();
  }
}

DateTime _dt = DateTime.now();

class _Page5State extends State<Page5> {
  void fun1() {
    //to show bottom sheet
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 200,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color.fromARGB(255, 139, 139, 139),
                        ))),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: Card(
                    child: Container(
                      height: 30,
                      width: 300,
                    ),
                    color: const Color.fromARGB(255, 245, 243, 243),
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: Card(
                    child: Container(
                      height: 30,
                      width: 300,
                    ),
                    color: const Color.fromARGB(255, 245, 243, 243),
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Card(
                    child: Container(
                      height: 30,
                      width: 100,
                    ),
                    color: const Color.fromARGB(255, 245, 243, 243),
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          );
        });
  }

  void fun2() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _dt = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Text(
                  "${DateFormat.yMMMd().format(_dt)}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'QuickSand',
                      fontWeight: FontWeight.w100),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  fun2();
                },
                child: const Text('Pick a Date'),
                padding: const EdgeInsets.fromLTRB(40, 18, 40, 18),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fun1();
        },
        child: const Icon(Icons.show_chart),
      ),
    );
  }
}
