class AvalAppoimentModel {

  String iD;
  String rowNum;
  String? clinicsID;
  String? period;
  String? dayInWeek;
  String? reserveDate;
  String? flag;
  String? startTime;
  String? notes;
  String? states;
  String? duration;
  String? fullName;
  String? docFullName;
  String? rES_ID;
  String? patientNo;




  AvalAppoimentModel({
    required this.iD,
    required this.rowNum,
    required this.clinicsID,
    required this.period,
    required this.dayInWeek,


    required this.reserveDate,
    required this.flag,
    required this.startTime,

    required this.notes,
    required this.states,
    required this.duration,

    required this.fullName,
    required this.docFullName,
    required this.rES_ID,
    required this.patientNo

    
  });

  factory AvalAppoimentModel.fromJson(Map<String?, dynamic> json) {
    return AvalAppoimentModel(
      iD: json['id'] ?? 0,
      rowNum: json['rowNum'] ?? "",
      clinicsID: json['clinicsID'] ?? "",
      period: json['period'] ?? "",
      dayInWeek: json['dayInWeek'] ?? "",


      reserveDate: json['reserveDate'] ?? "",
      flag: json['flag'] ?? "",
      startTime: json['startTime'] ?? "",

      notes: json['notes'] ?? "",
      states: json['states'] ?? "",
      duration: json['duration'] ?? "",

      fullName: json['fullName'] ?? "",
      docFullName: json['docFullName'] ?? "",
      rES_ID: json['reS_ID'] ?? "",
        patientNo: json['patientNo'] ?? ""
    );
  }
}
