import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class CreateAccountProvider extends ChangeNotifier {
  String nationalid="";
  String visitNo="";
  String visittype="";
  String Clinics_ID="";
  String docid="";

  String Nationality="";

  getNationality() {
    return Nationality;
  }

  setNationality(String Nationality) {
    this.Nationality = Nationality;
    notifyListeners();
  }




  getdocid() {
    return docid;
  }

  setdocid(String docid) {
    this.docid = docid;
    notifyListeners();
  }

  getClinics_ID() {
    return Clinics_ID;
  }

  setClinics_ID(String Clinics_ID) {
    this.Clinics_ID = Clinics_ID;
    notifyListeners();
  }


  getvisitNo() {
    return visitNo;
  }

  setvisitNo(String visitNo) {
    this.visitNo = visitNo;
    notifyListeners();
  }

  getvisittype() {
    return visittype;
  }

  setvisittype(String visittype) {
    this.visittype = visittype;
    notifyListeners();
  }



  getnationalid() {
    return nationalid;
  }

  setnationalid(String nationalid) {
    this.nationalid = nationalid;
    notifyListeners();
  }


}