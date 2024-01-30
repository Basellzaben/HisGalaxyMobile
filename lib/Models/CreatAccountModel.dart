import 'package:flutter/cupertino.dart';

//work state data
class CreatAccountModel {

  String name;
  String username;
  String? passwordd;


  CreatAccountModel({
    required this.name,
    required this.username,
    required this.passwordd

  });

  factory CreatAccountModel.fromJson(Map<String?, dynamic> json) {
    return CreatAccountModel(
      name: json['name'] ?? 0,
      username: json['username'] ?? 0,
      passwordd: json['passwordd'] ?? "",
    );
  }
}
