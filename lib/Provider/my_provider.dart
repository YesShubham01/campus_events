import 'package:flutter/material.dart';

// i want to make a provider here. MyProvider.

class MyProvider with ChangeNotifier {
  int counter = 0;

  MyProvider({
    this.counter = 2,
  });

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
