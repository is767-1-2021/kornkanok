import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_app/kaew/controlllers/account_con.dart';
import 'package:team_app/kaew/model/account_model.dart';
import 'package:team_app/kaew/services/account_ser.dart';

class UsernameFormModel extends ChangeNotifier {
  String? _username;

  get username => this._username;

  set username(value) {
    this._username = value;
    notifyListeners();
  }
}
