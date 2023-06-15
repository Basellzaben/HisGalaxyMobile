import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class ImgaeXrayProvider extends ChangeNotifier {
  String passno="";
  String result="";
  String date="";


  getdate() {
    return date;
  }

  setdate(String date) {
    this.date = date;
    notifyListeners();
  }

  getpassno() {
    return passno;
  }

  setpassno(String passno) {
    this.passno = passno;
    notifyListeners();
  }

  getresult() {
    return result;
  }

  setresult(String result) {
    this.result = result;
    notifyListeners();
  }


}