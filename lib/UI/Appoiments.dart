import 'dart:convert';

import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../Models/AppoimentsM.dart';
import '../provider/HomeProvider.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:intl/intl.dart';

class Appoiments extends StatefulWidget {
  @override
  State<Appoiments> createState() => _AppoimentsState();
}

class _AppoimentsState extends State<Appoiments> {
  @override
  void initState() {
    setsearch(context);
    super.initState();
  }

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
var state=false;
  setsearch(BuildContext context) {
    var homeP = Provider.of<HomeProvider>(context, listen: false);

    dateinputC.text = homeP.getVisitDate();
  }

  @override
  Widget build(BuildContext context) {
    var colors = [
      HexColor((Globalvireables.secondcolor)),
      HexColor((Globalvireables.basecolor))
    ];
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
            backgroundColor: HexColor(Globalvireables.basecolor),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: LanguageProvider.Llanguage(
                  'settings',
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: LanguageProvider.Llanguage('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: LanguageProvider.Llanguage('profile')),
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
                LanguageProvider.Llanguage('Appoiments'),
                unitHeightValue,
                LanguageProvider.langg,
                LanguageProvider.getDirection()),
          ),
          backgroundColor: HexColor(Globalvireables.basecolor),
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
                    HexColor((Globalvireables.basecolor))
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
                    height: MediaQuery.of(context).size.height / 1.2,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0.0),
                          bottomRight: Radius.circular(29.0),
                          topLeft: Radius.circular(0.0),
                          bottomLeft: Radius.circular(29.0)),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(

child: Row(children: [
   SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width / 2.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:
    state?  HexColor(Globalvireables.basecolor): HexColor(Globalvireables.grey),
        ),
        child: Text(
        LanguageProvider.Llanguage('History') ,
          style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
              color: HexColor(Globalvireables.white),
              fontSize: 15 * unitHeightValue),
        ),
        onPressed: () async {
          if(!state){
            setState(() {
              state=true;
            });
          }
     },
    ),
  )
  ,Spacer(),
  SizedBox(
    height: 50,
    width: MediaQuery.of(context).size.width / 2.5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary:
        state?  HexColor(Globalvireables.grey): HexColor(Globalvireables.basecolor),),
      child: Text(LanguageProvider.Llanguage('Schedule'),
        style: ArabicTextStyle(
        arabicFont: ArabicFont.tajawal,
        color: HexColor(Globalvireables.white),
        fontSize: 15 * unitHeightValue),
      ),
      onPressed: () async {
       if(state){
         setState(() {
           state=false;
         });

       }

      },
    ),
  )

],),

                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.11,
                            height: MediaQuery.of(context).size.height / 1.2,
                            child: FutureBuilder(
                              future: getAppoiments(
                                context,
                                "8","20"

                              ),
                              builder: (BuildContext context, AsyncSnapshot<List<AppoimentsM>> snapshot) {
                                if (snapshot.hasData) {
                                  List<AppoimentsM>? Appoiments = snapshot.data;

                                 return Appoiments!.isNotEmpty? ListView(
                                    children: Appoiments!
                                        .map((AppoimentsM inv) =>
                                        SizedBox(
                                        child: GestureDetector(
                                          onTap: () {



                                          },
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10,),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                    textAlign: TextAlign.left,
                                                    inv.sessionDate.toString() == null
                                                        ||  inv.sessionDate.toString() == 'NULL'
                                                        || inv.sessionDate.toString() ==
                                                        'null'? '' : retturndatenewformat(inv.sessionDate.toString())
                                                        .trim()),
                                              ),
                                              Card(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: HexColor(
                                                            Globalvireables
                                                                .basecolor),
                                                        width: 2),
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(13),
                                                    child: SizedBox(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [

                                                              Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Align(
                                                                      alignment: Alignment.topLeft,
                                                                      child: Text(
                                                                        textAlign: TextAlign.left,
                                                                        inv.doctornamEE.toString() == null
                                                                            ||  inv.doctornamEE.toString() == 'NULL'
                                                                            || inv.doctornamEE.toString() == 'null'? '' : inv.doctornamEE.toString()
                                                                            .trim(),
                                                                        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,color: Colors.black,fontWeight: FontWeight.w900),),
                                                                    ),
                                                                    Align(
                                                                      alignment: Alignment.topLeft,
                                                                      child: Text(
                                                                          textAlign: TextAlign.left,
                                                                          inv.sessionNameE.toString() == null
                                                                              ||  inv.sessionNameE.toString() == 'NULL'
                                                                              || inv.sessionNameE.toString() ==
                                                                              'null'? '' : "DR . "+inv.sessionNameE.toString()
                                                                              .trim()),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),



                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        )))
                                        .toList(),
                                  ):Image.asset(
                                "assets/null.png",
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

  Future<List<AppoimentsM>> getAppoiments(
      BuildContext context, String patientid, String date) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    Uri postsURL = Uri.parse(Globalvireables.AppoimentsURL);
    try {
      String state1='3247';
      String state2='2';

      var map = new Map<String, dynamic>();
      map['PatientNo'] = patientid;
      map['searchDate'] = date;
      if(state){
        state1='3248';
        state2='1';
      }
      map['state'] = state1;
      map['state2'] = state2;
      http.Response res = await http.post(
        postsURL,
        body: map,
      );

      if (res.statusCode == 200) {
        print("Appoiments" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<AppoimentsM> Appoiments = body
            .map(
              (dynamic item) => AppoimentsM.fromJson(item),
        )
            .toList();

        return Appoiments;
      } else {
        throw "Unable to retrieve Appoiments." + res.statusCode.toString();
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

    throw "Unable to retrieve Appoiments.";
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

  String retturndatenewformat(String DATE) {
    String newMonth = "";
    var parts = DATE.substring(0, 10).split('-');
    String y = parts[0].trim();
    int m = int.parse(parts[1].trim());
    String d = parts[2].trim();

    if (m == 1) {
      newMonth = 'January';
    } else if (m == 2) {
      newMonth = 'Februay';
    } else if (m == 3) {
      newMonth = 'March';
    } else if (m == 4) {
      newMonth = 'April';
    } else if (m == 5) {
      newMonth = 'May';
    } else if (m == 6) {
      newMonth = 'June';
    } else if (m == 7) {
      newMonth = 'July';
    } else if (m == 8) {
      newMonth = 'August';
    } else if (m == 9) {
      newMonth = 'September';
    } else if (m == 10) {
      newMonth = 'October';
    } else if (m == 11) {
      newMonth = 'November';
    } else if (m == 12) {
      newMonth = 'December';
    }

    return newMonth + " " + d + "," + y;
  }
}
