import 'dart:convert';
import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Models/AvalAppoimentModel.dart';
import '../Models/ChangePassM.dart';
import '../provider/HomeProvider.dart';
import '../provider/LoginProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';

class AvalAppoiment extends StatefulWidget {
  @override
  State<AvalAppoiment> createState() => _AvalAppoimentState();
}

class _AvalAppoimentState extends State<AvalAppoiment> {
  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    startdate = _selectedDay.toString().substring(0, 10);
  }

  DateTime _selectedDay = DateTime.now();

  String startdate = '';

  @override
  void dispose() {
    super.dispose();
  }

  int selectedIndex = 1;

  final List<Widget> nav = [
    Settings(),
    Home(),
    profile(),
  ];
  TextEditingController dateinputC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ThemP = Provider.of<Them>(context, listen: false);

    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    return Stack(children: <Widget>[
      Image.asset(
        "assets/background.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottomOpacity: 800.0,
            elevation: 4.0,
            title: Widgets.Appbar(
                context,
                LanguageProvider.Llanguage('AvalAppoiment'),
                unitHeightValue,
                LanguageProvider.langg,
                LanguageProvider.getDirection()),
          ),
          backgroundColor: HexColor(ThemP.getcolor()),
          // backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor((Globalvireables.secondcolor)),
                  HexColor((ThemP.getcolor()))
                ],
                stops: stops,
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Container(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0)),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
//////////////////////////////////////

                        SizedBox(
                          child: Card(
                            child: TableCalendar(
                              calendarFormat: CalendarFormat.twoWeeks,
                              focusedDay: DateTime.now(),
                              firstDay: DateTime.now(),
                              lastDay: DateTime.now().add(const Duration(days: 10)),
                              selectedDayPredicate: (day) =>
                                  isSameDay(day, _selectedDay),
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  setState(() {
                                      startdate = _selectedDay
                                          .toString()
                                          .substring(0, 10);
                                  });
                                  print("ddd  " + _selectedDay.toString()
                                      .substring(0, 10));
                                });
                              },
                            ),
                          ),
                        ),

                        /////////////////////////////////////
                        Container(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 1.4,
                            child: FutureBuilder(
                              future: getAvalAppoiment(context, "all"),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<AvalAppoimentModel>>
                                      snapshot) {
                                if (snapshot.hasData) {
                                  List<AvalAppoimentModel>? AvalAppoiment2 =
                                      snapshot.data;
                                  List<AvalAppoimentModel>? AvalAppoiment =
                                      AvalAppoiment2!
                                          .where((map) =>
                                              (map.reserveDate.toString() +
                                                      " " +
                                                      map.reserveDate
                                                          .toString() +
                                                      " " +
                                                      map.reserveDate
                                                          .toString())
                                                  .toString()
                                                  .contains(dateinputC.text
                                                      .toString()) ||
                                              map.reserveDate
                                                  .toString()
                                                  .contains(dateinputC.text
                                                      .toString()))
                                          .toList();
                                  return AvalAppoiment!.isNotEmpty
                                      ? Container(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                            ),
                                            itemCount: AvalAppoiment!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              AvalAppoimentModel
                                                  avalAppoimentModel =
                                                  AvalAppoiment![index];
                                              return GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            textAlign:
                                                                TextAlign.right,
                                                            LanguageProvider.Llanguage(
                                                                'bookapp'),
                                                            style: ArabicTextStyle(
                                                                arabicFont:
                                                                    ArabicFont
                                                                        .tajawal,
                                                                fontSize: 22 *
                                                                    unitHeightValue)),
                                                        content: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                          child: Column(
                                                            children: [
                                                              Spacer(),
                                                              Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                avalAppoimentModel
                                                                    .startTime
                                                                    .toString(),
                                                                style: ArabicTextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    arabicFont:
                                                                        ArabicFont
                                                                            .tajawal,
                                                                    fontSize: 40 *
                                                                        unitHeightValue),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                LanguageProvider
                                                                    .Llanguage(
                                                                        "txxtapp"),
                                                                style: ArabicTextStyle(
                                                                    arabicFont:
                                                                        ArabicFont
                                                                            .tajawal,
                                                                    fontSize: 14 *
                                                                        unitHeightValue),
                                                              ),
                                                              Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            //  textColor: Colors.black,
                                                            onPressed: () {
                                                             /* , String RESERVATION_ID
                                                              , String CLINICS_ID
                                                              , String DOCTOR_NO*/

                                                              BookAppoiment(context,
                                                                  avalAppoimentModel.iD.toString(),
                                                                  avalAppoimentModel.clinicsID.toString(),
                                                                 '');

                                                            },
                                                            child: Text(
                                                              LanguageProvider
                                                                  .Llanguage(
                                                                      'app'),
                                                              style: ArabicTextStyle(
                                                                  arabicFont:
                                                                      ArabicFont
                                                                          .tajawal,
                                                                  color: HexColor(
                                                                      ThemP
                                                                          .getcolor()),
                                                                  fontSize: 15 *
                                                                      unitHeightValue),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            // textColor: Colors.black,
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              LanguageProvider
                                                                  .Llanguage(
                                                                      'cancel'),
                                                              style: ArabicTextStyle(
                                                                  arabicFont:
                                                                      ArabicFont
                                                                          .tajawal,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 15 *
                                                                      unitHeightValue),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(10),
                                                  padding: EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: HexColor(
                                                          ThemP.getcolor()),
                                                      width: 1.0,
                                                    ),
                                                    color: HexColor(
                                                        ThemP.getcolor()),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.timer,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      Text(
                                                        avalAppoimentModel
                                                            .startTime
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ))
                                      : Image.asset(
                                          "assets/null5.png",
                                          height: 100,
                                          width: 100,
                                        );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    ]);
  }

  Future<List<AvalAppoimentModel>> getAvalAppoiment(
      BuildContext context, String search) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var ip = Loginprovider.getFirebaseIp().toString();

    print(ip + Globalvireables.AvalAppoimentURL.toString());
    var HomeP = Provider.of<HomeProvider>(context, listen: false);

    Uri postsURL = Uri.parse(ip + Globalvireables.AvalAppoimentURL);
    try {
      // HomeP.getClinics_ID();
      // HomeP.getClinics_ID();
      var map = new Map<String, dynamic>();
      map['Clinics_ID'] = HomeP.getClinics_ID();//
      map['Reserve_Date'] = startdate;

      http.Response res = await http.post(postsURL, body: map);

      print("statusCode" + res.statusCode.toString());

      if (res.statusCode == 200) {
        print("AvalAppoiment" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<AvalAppoimentModel> AvalAppoiment = body
            .map(
              (dynamic item) => AvalAppoimentModel.fromJson(item),
            )
            .toList();


        setState(() {});

        return AvalAppoiment;
      } else {throw "Unable to retrieve AvalAppoiment.";}
    } catch (e) {
      print(e.toString() + "uuuuu");
    }

    throw "Unable to retrieve AvalAppoiment.";
  }


   BookAppoiment(BuildContext context, String RESERVATION_ID, String CLINICS_ID, String DOCTOR_NO) async {

    var LanguageProvider = Provider.of<Language>(context, listen: false);
    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var ip = Loginprovider.getFirebaseIp().toString();
    var HomeP = Provider.of<HomeProvider>(context, listen: false);


    Uri postsURL = Uri.parse(ip + Globalvireables.BookingAppoiment);
    try {
      // HomeP.getClinics_ID();


      var map = new Map<String, dynamic>();
      map['PatientNo'] = Loginprovider.getuserId().toString();
      map['RESERVATION_ID'] = RESERVATION_ID;
      map['CLINICS_ID'] = CLINICS_ID;
      map['DOCTOR_NO'] = HomeP.getdocid().toString();

      http.Response res = await http.post(postsURL, body: map);

      print("input" + map.toString());
      print("statusCode" + res.statusCode.toString());

      if (res.statusCode == 200) {
        print("ChangePass" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<ChangePassM> Doctors = body
            .map(
              (dynamic item) => ChangePassM.fromJson(item),
        )
            .toList();


        if(Doctors[0].response=='1S'){
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (context) =>
            new AlertDialog(
              title: new Text(LanguageProvider.Llanguage('app')),
              content: Text(LanguageProvider.Llanguage('appdone')),
              actions: <Widget>[],
            ),
          );

        }else{
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (context) =>
            new AlertDialog(
              title: new Text(LanguageProvider.Llanguage('anerrortitle')),
              content: Text(LanguageProvider.Llanguage('anerror')),      actions: <Widget>[],
            ),
          );

        }
      } else {
        Navigator.pop(context);

        new AlertDialog(
          title: new Text(LanguageProvider.Llanguage('anerrortitle')),
          content: Text(LanguageProvider.Llanguage('anerror')),     actions: <Widget>[],
        );
      }
    } catch (e) {
      print(e.toString() + "uuuuu");
    }

    throw "Unable to retrieve AvalAppoiment.";
  }

}
