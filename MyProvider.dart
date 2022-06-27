import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider with ChangeNotifier {
  int currentIndex = 0;
  bool pp = true;

  onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  changepasswordicon() {
    this.pp = !this.pp;
    notifyListeners();
  }
}
