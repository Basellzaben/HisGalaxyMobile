import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class HomeProvider extends ChangeNotifier {
  String VisitDate="";
  String visitNo="";

  getvisitNo() {
    return visitNo;
  }

  setvisitNo(String visitNo) {
    this.visitNo = visitNo;
    notifyListeners();
  }



  getVisitDate() {
    return VisitDate;
  }

  setVisitDate(String VisitDate) {
    this.VisitDate = VisitDate;
    notifyListeners();
  }


}