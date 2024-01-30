import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class FamilyProvider extends ChangeNotifier {
  String relation="";
  String childnationalid="";
  String otp="";
  String parentname="";


  String ClinicDocName="";
  getClinicDocName() {
    return ClinicDocName;
  }

  setClinicDocName(String ClinicDocName) {
    this.ClinicDocName = ClinicDocName;
    notifyListeners();
  }

  getchildnationalid() {
    return childnationalid;
  }

  setchildnationalid(String childnationalid) {
    this.childnationalid = childnationalid;
    notifyListeners();
  }

  getotp() {
    return otp;
  }

  setotp(String otp) {
    this.otp = otp;
    notifyListeners();
  }



  getrelation() {
    return relation;
  }

  setrelation(String relation) {
    this.relation = relation;
    notifyListeners();
  }


}