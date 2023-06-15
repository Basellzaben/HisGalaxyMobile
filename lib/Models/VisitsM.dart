class VisitsM {
  String? visitDate;
  String? visitName;

  VisitsM({this.visitDate, this.visitName});

  VisitsM.fromJson(Map<String, dynamic> json) {
    visitDate = json['visitDate'];
    visitName = json['visitName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visitDate'] = this.visitDate;
    data['visitName'] = this.visitName;
    return data;
  }
}