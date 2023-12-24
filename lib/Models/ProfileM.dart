class ProfileM {
  String? fulLANAME;
  String? fulLENAME;
  String? bdate;
  String? mobilENO;
  String? gender;
  String? email;
  String? nationalno;

  ProfileM(
      {this.fulLANAME, this.fulLENAME, this.bdate, this.mobilENO,
        this.gender,this.email,this.nationalno});

  ProfileM.fromJson(Map<String, dynamic> json) {
    fulLANAME = json['fulL_A_NAME'];
    fulLENAME = json['fulL_E_NAME'];
    bdate = json['bdate'];
    mobilENO = json['mobilE_NO'];
    gender = json['gender'].toString().substring(0,1);
    email = json['email'];
    nationalno = json['gender'].toString().substring(1,json['gender'].toString().length);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fulL_A_NAME'] = this.fulLANAME;
    data['fulL_E_NAME'] = this.fulLENAME;
    data['bdate'] = this.bdate;
    data['mobilE_NO'] = this.mobilENO;
    data['gender'] = this.gender;
    data['email'] = this.email;

    return data;
  }
}