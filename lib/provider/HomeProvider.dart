import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class HomeProvider extends ChangeNotifier {
  String VisitDate="";

  getVisitDate() {
    return VisitDate;
  }

  setVisitDate(String VisitDate) {
    this.VisitDate = VisitDate;
    notifyListeners();
  }


}