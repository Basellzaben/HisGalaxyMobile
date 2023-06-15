class xRAYM {
  String? sdate;
  String? accN;
  String? report;

  xRAYM({this.sdate, this.accN, this.report});

  xRAYM.fromJson(Map<String, dynamic> json) {
    sdate = json['sdate'];
    accN = json['accN'];
    report = json['report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sdate'] = this.sdate;
    data['accN'] = this.accN;
    data['report'] = this.report;
    return data;
  }
}