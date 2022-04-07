import 'package:flutter/material.dart';

class DataStore extends ChangeNotifier {
  int price = 0;

  void add() {
    price = price + 10;
    notifyListeners();
  }

  void substract() {
    price = price - 10;
    notifyListeners();
  }
}
