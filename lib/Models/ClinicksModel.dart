import 'package:flutter/cupertino.dart';

//work state data
class ClinicksModel {

  String no;
  String docid;
  String? arName;
  String? enName;
  String? fULL_NAME_A;
  String? fULL_NAME_E;
  

  ClinicksModel({
    required this.docid,
    required this.no,
    required this.arName,
    required this.enName,
    required this.fULL_NAME_A,
    required this.fULL_NAME_E
    
  });

  factory ClinicksModel.fromJson(Map<String?, dynamic> json) {
    return ClinicksModel(
      docid: json['docid'] ?? 0,
      no: json['no'] ?? 0,
      arName: json['arName'] ?? "",
      enName: json['enName'] ?? "",
      fULL_NAME_A: json['fulL_NAME_A'] ?? "",
      fULL_NAME_E: json['fulL_NAME_E'] ?? "",
    );
  }
}
