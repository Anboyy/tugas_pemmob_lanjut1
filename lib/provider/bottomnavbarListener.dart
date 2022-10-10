import 'package:flutter/material.dart';

class BottomBarListener with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set getBotIndex(int value) {
    _index = value;
    notifyListeners();
  }

  void botIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
