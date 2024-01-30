import 'package:flutter/cupertino.dart';

//work state data
class Doctor {

  double doctoR_NO;
  String? fulL_NAME_A;
  String? fulL_NAME_E;
  String? depName;



  Doctor({
    required this.doctoR_NO,

    required this.fulL_NAME_A,
    required this.fulL_NAME_E,

    required this.depName,
  });

  factory Doctor.fromJson(Map<String?, dynamic> json) {
    return Doctor(
     doctoR_NO: json['doctoR_NO'] ?? 0.0,

      fulL_NAME_A: json['fulL_NAME_A'] ?? "",
      fulL_NAME_E: json['fulL_NAME_E'] ?? "",

      depName: json['depName'] ,

    );
  }
}
