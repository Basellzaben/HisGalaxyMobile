import 'package:flutter/cupertino.dart';

//Doctor.dart

class AppoimentsM {
  String? sessionDate;
  String? sessionStatus;
  String? sessionNameA;
  String? sessionNameE;
  String? doctornamEA;
  String? doctornamEE;

  String? Start_Time;
  String? Reserv_No;
  String? appid;



  AppoimentsM(
      {this.sessionDate,
        this.sessionStatus,
        this.sessionNameA,
        this.sessionNameE,
        this.doctornamEA,

        this.Start_Time,
        this.Reserv_No,
        this.appid,

        this.doctornamEE});

  AppoimentsM.fromJson(Map<String, dynamic> json) {
    sessionDate = json['sessionDate'];
    sessionStatus = json['sessionStatus'];
    sessionNameA = json['sessionNameA'];
    sessionNameE = json['sessionNameE'];
    doctornamEA = json['doctornamE_A'];
    doctornamEE = json['doctornamE_E'];

    Start_Time = json['start_Time'];
    Reserv_No = json['reserv_No'];
    appid = json['appid'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionDate'] = this.sessionDate;
    data['sessionStatus'] = this.sessionStatus;
    data['sessionNameA'] = this.sessionNameA;
    data['sessionNameE'] = this.sessionNameE;
    data['doctornamE_A'] = this.doctornamEA;
    data['doctornamE_E'] = this.doctornamEE;

    data['start_Time'] = this.Start_Time;
    data['reserv_No'] = this.Reserv_No;
    data['appid'] = this.appid;

    return data;
  }
}