import 'package:flutter/material.dart';

class BottomBarListener with ChangeNotifier {
  bool _index = true;

  bool get index => _index;

  void IncIndex() {
    _index = !_index;
  }
}
