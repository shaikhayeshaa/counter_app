import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  double containerHeight = 0.0;
  double get getContainerHeight => containerHeight;

  setContainerHeight(double height) {
    containerHeight = height;
    notifyListeners();
  }

  increaseContainer(double width, double height) {
    containerHeight += height;
    notifyListeners();
  }

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  void setCounterFromSlider(double value) {
    _counter = value.toInt();
    notifyListeners();
  }
}
