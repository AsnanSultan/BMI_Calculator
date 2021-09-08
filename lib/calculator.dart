import 'dart:math';

class Calculator {
  final int hight;
  final int weigth;

  Calculator({required this.hight, required this.weigth});

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weigth / pow(hight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return "You have a higher than normal boday weight. Try to excercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
