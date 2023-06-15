import 'package:flutter/cupertino.dart';


class InsuranceM {
  int? payorType;
  int? payorNo;
  int? insuranceType;
  double? labPercent;
  double? pharmacyPercent;
  double? servicePercent;
  double? suppliesPercent;
  double? dischargePercent;
  Null? companyEmpName;
  String? payoRNAMEA;
  String? payoRNAMEE;
  Null? pPatientInsurncesModel;

  InsuranceM(
      {this.payorType,
        this.payorNo,
        this.insuranceType,
        this.labPercent,
        this.pharmacyPercent,
        this.servicePercent,
        this.suppliesPercent,
        this.dischargePercent,
        this.companyEmpName,
        this.payoRNAMEA,
        this.payoRNAMEE,
        this.pPatientInsurncesModel});

  InsuranceM.fromJson(Map<String, dynamic> json) {
    payorType = json['payorType'];
    payorNo = json['payorNo'];
    insuranceType = json['insuranceType'];
    labPercent = json['labPercent'];
    pharmacyPercent = json['pharmacyPercent'];
    servicePercent = json['servicePercent'];
    suppliesPercent = json['suppliesPercent'];
    dischargePercent = json['dischargePercent'];
    companyEmpName = json['companyEmpName'];
    payoRNAMEA = json['payoR_NAME_A'];
    payoRNAMEE = json['payoR_NAME_E'];
    pPatientInsurncesModel = json['pPatientInsurncesModel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payorType'] = this.payorType;
    data['payorNo'] = this.payorNo;
    data['insuranceType'] = this.insuranceType;
    data['labPercent'] = this.labPercent;
    data['pharmacyPercent'] = this.pharmacyPercent;
    data['servicePercent'] = this.servicePercent;
    data['suppliesPercent'] = this.suppliesPercent;
    data['dischargePercent'] = this.dischargePercent;
    data['companyEmpName'] = this.companyEmpName;
    data['payoR_NAME_A'] = this.payoRNAMEA;
    data['payoR_NAME_E'] = this.payoRNAMEE;
    data['pPatientInsurncesModel'] = this.pPatientInsurncesModel;
    return data;
  }
}
