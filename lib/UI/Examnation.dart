import 'dart:convert';

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

import '../Models/ExamnationM.dart';
import '../provider/HomeProvider.dart';
import '../provider/SingleEXAMProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'ExamnationGroup.dart';
import 'ExamnationSingle.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:intl/intl.dart';
import 'package:arabic_font/arabic_font.dart';
class Examnation extends StatefulWidget {
  @override
  State<Examnation> createState() => _ExamnationState();
}

class _ExamnationState extends State<Examnation> {
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

  setsearch(BuildContext context) {
    var homeP = Provider.of<HomeProvider>(context, listen: false);

    dateinputC.text = homeP.getVisitDate();
  }

  @override
  Widget build(BuildContext context) {

    var ThemP = Provider.of<Them>(context, listen: false);

    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    var SINGLEEx = Provider.of<SingleEXAMProvider>(context, listen: false);

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
                LanguageProvider.Llanguage('Examnation'),
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
                          SizedBox(
                            child: TextField(
                              controller: dateinputC,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: HexColor(ThemP.getcolor()),
                                  size: 27 * unitHeightValue,
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      print("ex 1");
                                      setState(() {
                                        dateinputC.text =
                                            LanguageProvider.Llanguage(
                                                'SearchbyDate');
                                      });
                                    },
                                    child: Icon(color: Colors.redAccent,dateinputC.text.isEmpty ||
                                            dateinputC.text.toString() ==
                                                LanguageProvider.Llanguage(
                                                    'SearchbyDate')
                                        ? null
                                        : Icons.cancel)),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            HexColor(ThemP.getcolor()),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            HexColor(ThemP.getcolor()),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                contentPadding: EdgeInsets.only(
                                    top: 18, bottom: 18, right: 20, left: 20),
                                fillColor: HexColor(Globalvireables.white),
                                filled: true,
                                hintText:
                                    LanguageProvider.Llanguage("SearchbyDate"),
                              ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate + "formattedDate");
                                  setState(() {
                                    dateinputC.text = formattedDate
                                        .toString(); //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
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
                              future: getExamnation(
                                  context,
                                  "8",
                                      dateinputC.text.isEmpty ||
                                      dateinputC.text.toString() ==
                                      LanguageProvider.Llanguage(
                                      'SearchbyDate')
                                      ? "202"
                                      : dateinputC.text,
                              ),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<ExamnationM>> snapshot) {
                                if (snapshot.hasData) {
                                  List<ExamnationM>? Examnation = snapshot.data;
                                  return Examnation!.isNotEmpty? ListView(
                                    children: Examnation!
                                        .map((ExamnationM inv) => SizedBox(
                                            child: GestureDetector(
                                         onTap: () {

                                                  },
                                              child: Card(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: HexColor(
                                                            ThemP.getcolor()),
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
                                                              Align(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child: Container(
                                                                  height: 40,
                                                                  width: 100,
                                                                  color: HexColor(
                                                                      Globalvireables
                                                                          .white),
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      primary: HexColor(
                                                                          ThemP.getcolor()),
                                                                    ),
                                                                    child: Text(
                                                                      'Show',
                                                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                          color: HexColor(Globalvireables
                                                                              .white),
                                                                          fontSize:
                                                                              13 *
                                                                                  unitHeightValue),
                                                                    ),
                                                                    onPressed:
                                                                        () async {

                                                                          SINGLEEx.setDATE(inv.ExDate.toString());
                                                                          SINGLEEx.setNORMALRANGE(inv.normalRange.toString());
                                                                          SINGLEEx.setDOCTORNAME(inv.doctorName.toString());
                                                                          SINGLEEx.setRESULT(inv.result.toString());
                                                                          SINGLEEx.setUNIT(inv.unitDesc.toString());
                                                                          SINGLEEx.setSERVDESC(inv.serVDESC.toString());

                                                                          SINGLEEx.setServNo(inv.servNo.toString());
                                                                          SINGLEEx.setOrderNo(inv.orederNo.toString());


                                                                          if(inv.normalRange!="null"){
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => ExamnationSingle()),
                                                                            );
                                                                          }else{
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => ExamnationGroup()),
                                                                            );
                                                                          }



                                                                        },
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  children: [
                                                                    Align(
                                                                      alignment: Alignment.topLeft,
                                                                      child: Text(
                                                                          textAlign: TextAlign.left,
                                                                          inv.serVDESC.toString() == null
                                                                           ||  inv.serVDESC.toString() == 'NULL'
                                                                           || inv.serVDESC.toString() == 'null'? '' : inv.serVDESC.toString()
                                                                            .trim(),
                                                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,color: Colors.black,fontWeight: FontWeight.w900),),
                                                                    ),
                                                                    Align(
                                                                      alignment: Alignment.topLeft,
                                                                      child: Text(
                                                                          textAlign: TextAlign.left,
                                                                          inv.doctorName.toString() == null
                                                                              ||  inv.doctorName.toString() == 'NULL'
                                                                              || inv.doctorName.toString() ==
                                                                              'null'? '' : "DR . "+inv.doctorName.toString()
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

  Future<List<ExamnationM>> getExamnation(
      BuildContext context, String patientid, String date) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    Uri postsURL = Uri.parse(Globalvireables.ExamnationURL);
    try {
      var map = new Map<String, dynamic>();
      map['PatientNo'] = patientid;
      map['Date'] = date;
      http.Response res = await http.post(
        postsURL,
        body: map,
      );

      if (res.statusCode == 200) {
        print("Examnation" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<ExamnationM> Examnation = body
            .map(
              (dynamic item) => ExamnationM.fromJson(item),
            )
            .toList();

        return Examnation;
      } else {
        throw "Unable to retrieve Examnation." + res.statusCode.toString();
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

    throw "Unable to retrieve Examnation.";
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
