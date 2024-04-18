import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

ValueNotifier<String> displayMsg = ValueNotifier<String>('');
List<String> history = [];

void numButtonClicked(int index) {
  displayMsg.value += index.toString();
}

void plusButtonClicked() {
  displayMsg.value += '+';
}

void minusButtonClicked() {
  displayMsg.value += '-';
}

void divButtonClicked() {
  displayMsg.value += '/';
}

void multiplyButtonClicked() {
  displayMsg.value += '*';
}

void powButtonClicked() {
  displayMsg.value += '^';
}

void sqrtButtonClicked(int counter) {
  if (counter == 0) {
    displayMsg.value = 'sqrt(';
  } else {
    displayMsg.value += ')';
  }
}

void factorialButtonClicked() {
  displayMsg.value += '!';
}

void percentageButtonClicked() {
  displayMsg.value += '%';
}

void sinButtonClicked(int counter) {
  if (counter == 0) {
    displayMsg.value = 'sin(';
  } else {
    displayMsg.value += ')';
  }
}

void cosButtonClicked(int counter) {
  if (counter == 0) {
    displayMsg.value = 'cos(';
  } else {
    displayMsg.value += ')';
  }
}

void tanButtonClicked(int counter) {
  if (counter == 0) {
    displayMsg.value = 'tan(';
  } else {
    displayMsg.value += ')';
  }
}

void ctgButtonClicked(int counter) {
  if (counter == 0) {
    displayMsg.value = 'ctg(';
  } else {
    displayMsg.value += ')';
  }
}

String mathIsHard(String msg){
  history.add(msg);
  Parser p = Parser();
  Expression exp = p.parse(msg);
  ContextModel cm = ContextModel();
  double result = exp.evaluate(EvaluationType.REAL, cm);
  displayMsg.value = result.toString();

  return result.toString();
}

void clearButtonClicked() {
  displayMsg.value = '';
}