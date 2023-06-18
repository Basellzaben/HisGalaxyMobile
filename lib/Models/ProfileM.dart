class ProfileM {
  String? fulLANAME;
  String? fulLENAME;
  String? bdate;
  String? mobilENO;
  String? gender;

  ProfileM(
      {this.fulLANAME, this.fulLENAME, this.bdate, this.mobilENO, this.gender});

  ProfileM.fromJson(Map<String, dynamic> json) {
    fulLANAME = json['fulL_A_NAME'];
    fulLENAME = json['fulL_E_NAME'];
    bdate = json['bdate'];
    mobilENO = json['mobilE_NO'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fulL_A_NAME'] = this.fulLANAME;
    data['fulL_E_NAME'] = this.fulLENAME;
    data['bdate'] = this.bdate;
    data['mobilE_NO'] = this.mobilENO;
    data['gender'] = this.gender;
    return data;
  }
}