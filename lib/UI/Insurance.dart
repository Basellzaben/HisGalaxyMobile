import 'dart:convert';
import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';

import '../Models/InsuranceM.dart';
import '../provider/HomeProvider.dart';
import '../provider/LoginProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:http/http.dart' as http;

class Insurance extends StatefulWidget {
  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Map<String, double> dataMap = {
    "": 70,
  };
  var prefs;

  @override
  Widget build(BuildContext context) {
    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);

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
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            selectedItemColor: HexColor(Globalvireables.white),
            unselectedItemColor: Colors.white,
            backgroundColor: HexColor(ThemP.getcolor()),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: LanguageProvider.Llanguage('settings'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: LanguageProvider.Llanguage('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: LanguageProvider.Llanguage('Insurance')),
            ],
            iconSize: 30 * unitHeightValue,
            unselectedFontSize: 12 * unitHeightValue,
            selectedFontSize: 16 * unitHeightValue,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            selectedIconTheme:
                IconThemeData(color: HexColor(Globalvireables.white)),
            onTap: _onItemTapped,
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottomOpacity: 800.0,
            elevation: 4.0,
            title: Widgets.Appbar(
                context,
                LanguageProvider.Llanguage('Insurance'),
                unitHeightValue,
                LanguageProvider.langg,
                LanguageProvider.getDirection()),
          ),
          backgroundColor: HexColor(ThemP.getcolor()),
          // backgroundColor: Colors.transparent,
          body: Directionality(
            textDirection: LanguageProvider.getDirection(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.15,
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
                    height: MediaQuery.of(context).size.height / 1.24,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0.0),
                          bottomRight: Radius.circular(40.0),
                          topLeft: Radius.circular(0.0),
                          bottomLeft: Radius.circular(40.0)),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 1.2,
                            child: FutureBuilder(
                              future: getInsurance(context, Loginprovider.userId),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<InsuranceM>> snapshot) {
                                if (snapshot.hasData) {
                                  List<InsuranceM>? Insurance = snapshot.data;
                                  return ListView(
                                    children: Insurance!
                                        .map((InsuranceM insurance) => SizedBox(
                                                child: Column(children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.account_balance,
                                                    size: 40 * unitHeightValue,
                                                    color: HexColor(
                                                       ThemP.getcolor()),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: SizedBox(
                                                      width: MediaQuery.of(context).size.width/1.4,
                                                      child: Text(
                                                        maxLines: 3,
                                                        overflow: TextOverflow.ellipsis,
                                                        LanguageProvider.getLanguage() == "AR"
                                                            ? insurance.payoRNAMEA.toString()+""
                                                            : insurance.payoRNAMEE
                                                            .toString(),
                                                        style: ArabicTextStyle(
                                                            arabicFont: ArabicFont.tajawal,
                                                            fontWeight: FontWeight.w900,
                                                            fontSize: 19 * unitHeightValue
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      LanguageProvider
                                                                  .getLanguage() ==
                                                              "AR"
                                                          ? "معلومات التامين :"
                                                          : "Insurance information :",
                                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                        fontSize: 18 *
                                                            unitHeightValue,
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer()
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30 * unitHeightValue,
                                              ),
                                              Row(
                                                children: [
                                                  Spacer(),
                                                  SizedBox(
                                                    child: Column(
                                                      children: [
                                                        CircularPercentIndicator(
                                                          radius: 60.0 *
                                                              unitHeightValue,
                                                          lineWidth: 15.0,
                                                          percent: double.parse(
                                                                  insurance
                                                                      .labPercent
                                                                      .toString()) /
                                                              100,
                                                          center: new Text(
                                                            insurance.labPercent
                                                                .toString(),
                                                            style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 18 *
                                                                    unitHeightValue),
                                                          ),
                                                          progressColor: HexColor(
                                                             ThemP.getcolor()),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          LanguageProvider
                                                                      .getLanguage() ==
                                                                  "AR"
                                                              ? "المختبر"
                                                              : "lab",
                                                          style: ArabicTextStyle(
                                                              arabicFont: ArabicFont.tajawal,
                                                              fontWeight:
                                                              FontWeight.w700,
                                                              fontSize: 18 * unitHeightValue
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Spacer(),
                                                  Spacer(),
                                                  Spacer(),
                                                  SizedBox(
                                                    child: Column(
                                                      children: [
                                                        CircularPercentIndicator(
                                                          radius: 60.0 *
                                                              unitHeightValue,
                                                          lineWidth: 15.0,
                                                          percent: double.parse(
                                                                  insurance
                                                                      .pharmacyPercent
                                                                      .toString()) /
                                                              100,
                                                          center: new Text(
                                                            insurance
                                                                .pharmacyPercent
                                                                .toString(),
                                                            style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 18 *
                                                                    unitHeightValue),
                                                          ),
                                                          progressColor: HexColor(
                                                             ThemP.getcolor()),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          LanguageProvider
                                                                      .getLanguage() ==
                                                                  "AR"
                                                              ? "الصيدلية"
                                                              : "pharmacy",
                                                          style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 18 *
                                                                  unitHeightValue),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30 * unitHeightValue,
                                              ),
                                              Row(
                                                children: [
                                                  Spacer(),
                                                  SizedBox(
                                                    child: Column(
                                                      children: [
                                                        CircularPercentIndicator(
                                                          radius: 60.0 *
                                                              unitHeightValue,
                                                          lineWidth: 15.0,
                                                          percent: double.parse(
                                                                  insurance
                                                                      .servicePercent
                                                                      .toString()) /
                                                              100,
                                                          center: new Text(
                                                            insurance
                                                                .servicePercent
                                                                .toString(),
                                                            style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 18 *
                                                                    unitHeightValue),
                                                          ),
                                                          progressColor: HexColor(
                                                             ThemP.getcolor()),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          LanguageProvider
                                                                      .getLanguage() ==
                                                                  "AR"
                                                              ? "الخدمة"
                                                              : "service",
                                                          style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 18 *
                                                                  unitHeightValue),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Spacer(),
                                                  Spacer(),
                                                  Spacer(),
                                                  SizedBox(
                                                    child: Column(
                                                      children: [
                                                        CircularPercentIndicator(
                                                          radius: 60.0 *
                                                              unitHeightValue,
                                                          lineWidth: 15.0,
                                                          percent: double.parse(
                                                                  insurance
                                                                      .suppliesPercent
                                                                      .toString()) /
                                                              100,
                                                          center: new Text(
                                                            insurance
                                                                .suppliesPercent
                                                                .toString(),
                                                            style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                fontSize: 18 *
                                                                    unitHeightValue),
                                                          ),
                                                          progressColor: HexColor(
                                                             ThemP.getcolor()),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          LanguageProvider
                                                                      .getLanguage() ==
                                                                  "AR"
                                                              ? "لوازم"
                                                              : "supplies",
                                                          style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 18 *
                                                                  unitHeightValue),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                            ])))
                                        .toList(),
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    ]);
  }

  _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nav[index]),
      );
    });
  }

  int selectedIndex = 1;

  final List<Widget> nav = [
    Settings(),
    Home(),
    Insurance(),
  ];

  Future<List<InsuranceM>> getInsurance(BuildContext context, String p) async {
    Uri postsURL = Uri.parse(Globalvireables.InsuranceURL);
    try {

      var map = new Map<String, dynamic>();
      map['PatientNo'] = p;
      http.Response res = await http.post(
        postsURL,
        body: map,);


      if (res.statusCode == 200) {
        print("insurance" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);
        List<InsuranceM> Doctors = body.map(
        (dynamic item) => InsuranceM.fromJson(item),)
        .toList();

        return Doctors;
      } else {
        throw "Unable to retrieve Doctors.";
      }

    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('بيانات الأطباء'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve Doctors.";
  }
}
