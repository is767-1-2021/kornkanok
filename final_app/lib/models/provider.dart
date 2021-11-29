import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Historyprovider extends ChangeNotifier {
  late String answer = "";
  late String answerTemp = "";
  late String inputFull = "";
  late String operator = "";
  CollectionReference cal_history =
      FirebaseFirestore.instance.collection('cal_history');

  get result => this.answer;

  set result(value) {
    this.answer = value;
    cal_history
        .add({'answer': answer, 'howto': inputFull + operator + answerTemp});
    notifyListeners();
  }

  get first => this.inputFull;

  set first(value) {
    this.inputFull = value;
    notifyListeners();
  }

  get second => this.answerTemp;

  set second(value) {
    this.answerTemp = value;
    notifyListeners();
  }

  get sign => this.operator;

  set sign(value) {
    this.operator = value;
    notifyListeners();
  }
}
