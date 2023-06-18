class prescptionM {
  String? cdate;
  String? cname;

  prescptionM({this.cdate, this.cname});

  prescptionM.fromJson(Map<String, dynamic> json) {
    cdate = json['cdate'];
    cname = json['cname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cdate'] = this.cdate;
    data['cname'] = this.cname;
    return data;
  }
}