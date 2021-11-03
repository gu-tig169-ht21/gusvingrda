//import 'package:flutter/material.dart';

class Color {
  void main() {
    int value = 18;
    int colorDecider = getTheColor(value);
    if (colorDecider == 1) {
      //print('texten är grön');
    } else {
      //print('texten är röd');
    }
  }

  int getTheColor(int value) {
    int even = 0;
    if (value % 2 == 1) {
      //print('Talet $value är ojämnt');
      even = 0;
      return even;
    } else if (value % 2 == 0) {
      //print('Talet $value är jämnt');
      even = 0;
      return even;
    }
    return even;
  }
}
