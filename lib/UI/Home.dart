import 'dart:convert';

import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/Doctors.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:http/http.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Models/Doctor.dart';
import '../Models/HospitalInfo.dart';
import '../Models/VisitsM.dart';
import '../provider/HomeProvider.dart';
import '../provider/HospitalProvider.dart';
import '../provider/LoginProvider.dart';
import '../provider/languageProvider.dart';
import 'Appoiments.dart';
import 'Examnation.dart';
import 'HospitalInfoS.dart';
import 'Insurance.dart';
import 'Invoices.dart';
import 'Settings.dart';
import 'VitalSigns.dart';
import 'dart:convert';
import 'dart:math' as math;
import 'XrayList.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  var data;

  String selectedSpinnerItem = 'Eliseo@gardner.biz';

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController dateinput = TextEditingController();
  var HospitLProvider;
  @override
  Widget build(BuildContext context) {
    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var homeP = Provider.of<HomeProvider>(context, listen: false);

    var colors = [
      HexColor((Globalvireables.secondcolor)),
      HexColor((Globalvireables.basecolor))
    ];
    double unitHeightValue = MediaQuery
        .of(context)
        .size
        .height * 0.00122;
    var LanguageProvider = Provider.of<Language>(context, listen: false);



    var stops = [0.0, 1.00];
    return Stack(children: <Widget>[
    Image.asset(
    "assets/background.png",
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
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
    icon: Icon(Icons.settings,),
    label: LanguageProvider.Llanguage('settings',),
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
    backgroundColor: HexColor(Globalvireables.basecolor),
    //backgroundColor: Colors.transparent,
    body: Directionality(
    textDirection: LanguageProvider.getDirection(),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
    height: MediaQuery
        .of(context)
        .size
        .height / 1.1,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    HexColor((Globalvireables.white)),
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
    width: MediaQuery
        .of(context)
        .size
        .width,
    height: MediaQuery
        .of(context)
        .size
        .height / 1.24,
    decoration: BoxDecoration(

    image: DecorationImage(
    image: AssetImage("assets/background.png"),
    fit: BoxFit.cover,),
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
    Row(
    children: [
    Container(
    width: 55 * unitHeightValue,
    height: 55 * unitHeightValue,
    child: Image.asset(
    "assets/persion2.png",
    height: 30,
    width: 30,
    ),
    ),
    SizedBox(
    width: 10,
    ),
    Text(
    LanguageProvider.getLanguage() == "AR"
    ? Loginprovider.getnameA()
        : Loginprovider.getnameE(),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    color: HexColor(Globalvireables.black2),
    fontSize: 19 * unitHeightValue,
    fontWeight: FontWeight.w700),
    ),
    Spacer(),
    Icon(
    Icons.notifications,
    color: HexColor(Globalvireables.basecolor),
    size: 33 * unitHeightValue,
    )
    ],
    ),
    SizedBox(
    height: 10,
    ),
    GestureDetector(
    onTap: () async {
     // Share.share( 'https://vuemotion.ishjo.com/portal/?user_name=view&password=view123&accession_number="+"3284"+"&key_images=true');
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => HospitalInfoS()),
    );
    },
      child: Container(
      alignment: LanguageProvider.Align(),

      child: Text(
      LanguageProvider.Llanguage("AlEsraaHospital"),
      style: ArabicTextStyle(
              arabicFont: ArabicFont.tajawal,
      color: HexColor(Globalvireables.black2),
      fontSize: 22 * unitHeightValue,
      fontWeight: FontWeight.w700)
      ),


      ),
    ),

    SizedBox(height: 5,),
    SizedBox(
    child: SizedBox(
    child: TextField(
    controller: dateinput,
    //editing controller of this TextField
    decoration: InputDecoration(
    prefixIcon: Icon(
    Icons.airline_seat_flat, color: HexColor(
    Globalvireables.basecolor),
    size: 27 * unitHeightValue,),
    suffixIcon: GestureDetector(
    onTap: () {
    setState(() {
    dateinput.text =
    LanguageProvider.Llanguage(
    'Searchbyvisit');
    });
    },
    child: Icon(color: Colors.redAccent,dateinput.text.isEmpty ||
    dateinput.text.toString() ==
    LanguageProvider.Llanguage(
    'Searchbyvisit')
    ? null
        : Icons.cancel)),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: HexColor(
    Globalvireables.basecolor),
    width: 2.0),
    borderRadius:
    BorderRadius.circular(10.0)),
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: HexColor(
    Globalvireables.basecolor),
    width: 2.0),
    borderRadius:
    BorderRadius.circular(10.0)),
    contentPadding: EdgeInsets.only(
    top: 18,
    bottom: 18,
    right: 20,
    left: 20),
    fillColor:
    HexColor(Globalvireables.white),
    filled: true,
    hintText: LanguageProvider.Llanguage(
    "Searchbyvisit"),
    ),
    readOnly: true,
    //set it true, so that user will not able to edit text
    onTap: () async {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return Center(
    child: Card(
    child: Padding(
    padding: const EdgeInsets.all(9.0),
    child: Container(
    height: MediaQuery
        .of(context)
        .size
        .height / 2,
    width: MediaQuery
        .of(context)
        .size
        .width / 1.3,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets
        .all(8.0),
    child: SizedBox(
    child: Text(
    "زياراتي",

        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
            color: HexColor(Globalvireables.black2),
            fontSize: 20 * unitHeightValue,
            fontWeight: FontWeight
                .w900
           )

   ),
    ),
    ),
      Divider(thickness: 1.0, color: Colors.grey),

    Container(
    height: MediaQuery
        .of(context)
        .size
        .height / 2.7,
    width: MediaQuery
        .of(context)
        .size
        .width / 1.3,
    child: FutureBuilder(
    future: getvisits(
    context, "277"),
    builder: (
    BuildContext context,
    AsyncSnapshot<List<
    VisitsM>> snapshot) {
    if (snapshot.hasData) {
    List<
    VisitsM>? Visits = snapshot
        .data;
    return ListView(
    children: Visits!
        .map((
    VisitsM v) =>
    Column(
      children: [
        Card(
          child: GestureDetector(
          onTap: () {

          homeP.setVisitDate(v
              .visitDate
              .toString().substring(0,10)) ;
          dateinput.text=homeP.getVisitDate();
          Navigator.pop(context);
          },
          child
              : Padding(
          padding: const EdgeInsets.all(
          8.0),
          child: SizedBox(
          child: Row(
          children: [
          Spacer(),
          Text(
          v
              .visitName
              .toString(),
          style: ArabicTextStyle(
                  arabicFont: ArabicFont.tajawal,
          color: Colors
              .black,
          fontSize: 16 *
          unitHeightValue,
          fontWeight: FontWeight
              .w700),),
          Spacer(),
          Spacer(),
          Spacer(),
          Text(
          v
              .visitDate
              .toString().substring(0,10),
          style: ArabicTextStyle(
                  arabicFont: ArabicFont.tajawal,
          color: Colors
              .black,
          fontSize: 14 *
          unitHeightValue,
          fontWeight: FontWeight
              .w700),),
          Spacer(),

          ],)

          ),
          ),
          ),
        ),
      ],
    )

    )
        .toList(),
    );
    } else {
    return Center(
    child: CircularProgressIndicator());
    }
    },
    ),
    ),
      Align(
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 4,
          color: HexColor(Globalvireables.white),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary:
              HexColor(Globalvireables.basecolor),
            ),
            child: Text(
              LanguageProvider.Llanguage('cancel'),
              style: ArabicTextStyle(
                  arabicFont: ArabicFont.tajawal,
                  color:
                  HexColor(Globalvireables.white),
                  fontSize: 14 * unitHeightValue),
            ),
            onPressed: () async {
              Navigator.of(context).pop();

            },
          ),
        ),
      )
    /*  TextButton(
    onPressed: () {
    Navigator.of(context).pop();
    },
    child: Text(
    LanguageProvider.Llanguage('cancel'),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    color: Colors.black87,
    fontSize: 15 *
    unitHeightValue),
    ),
    ),*/
    ],
    ),

    ),
    ),
    ),
    );
    },
    );
    },
    ),
    ),


    ),
    SizedBox(
    height: 15,
    ),
    Row(
    children: [
    GestureDetector(
    onTap: () async {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Appoiments()),
    );
    },
    child: Column(
    children: [
    Card(
    color: HexColor(Globalvireables.basecolor),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    height:
    MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    child: Column(
    children: [
    Spacer(),
    Icon(
    Icons.timelapse_outlined,
    color:
    HexColor(Globalvireables.white),
    size: 50 * unitHeightValue,
    ),
    Spacer(),
    ],
    ),
    ),
    ),
    Text(
    LanguageProvider.Llanguage("Appoiments"),


        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
            color: Colors.black,
            fontSize: 13 * unitHeightValue,
            fontWeight: FontWeight.w700
        )



    ),
    ],
    ),
    ),
    Spacer(),

    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Invoices()),);
    },
    child: Column(
    children: [
    Card(
    color: HexColor(
    Globalvireables.basecolor),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    height:
    MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    child: Column(
    children: [
    Spacer(),
    Icon(
    Icons.receipt,
    color:
    HexColor(Globalvireables.white),
    size: 50 * unitHeightValue,
    ),
    Spacer(),
    ],
    ),
    ),
    ),
    Text(
    LanguageProvider.Llanguage("Invoices"),


        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
            color: Colors.black,
            fontSize: 13 * unitHeightValue,
            fontWeight: FontWeight.w700
        )



    ),
    ],
    ),
    ),
    Spacer(),
    /*Column(
    children: [
    Card(
    color: HexColor(Globalvireables.basecolor),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    height:
    MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    child: Column(
    children: [
    Spacer(),
    Icon(
    Icons.monetization_on,
    color:
    HexColor(Globalvireables.white),
    size: 50 * unitHeightValue,
    ),
    Spacer(),
    ],
    ),
    ),
    ),
    Text(
    LanguageProvider.Llanguage("Payments"),


        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
            color: Colors.black,
            fontSize: 13 * unitHeightValue,
            fontWeight: FontWeight.w700
        )


    ),
    ],
    )*/
    GestureDetector(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => XrayList()),
          );
        },


        child: Column(
          children: [
            Card(
              color: HexColor(Globalvireables.basecolor),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width /
                    4.5,
                height:
                MediaQuery
                    .of(context)
                    .size
                    .width /
                    4.5,
                child: Column(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.rate_review,
                      color:
                      HexColor(Globalvireables.white),
                      size: 50 * unitHeightValue,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Text(
                LanguageProvider.Llanguage("Ray"),


                style: ArabicTextStyle(
                    arabicFont: ArabicFont.tajawal,
                    color: Colors.black,
                    fontSize: 13 * unitHeightValue,
                    fontWeight: FontWeight.w700
                )


            ),
          ],
        ),
      ),
    ],),
    SizedBox(
    height: 5,
    ),
    Row(
    children: [
    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Insurance()),);
    },
    child: Column(
    children: [
    Card(
    color: HexColor(
    Globalvireables.basecolor),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    height:
    MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    child: Column(
    children: [
    Spacer(),
    Icon(
    Icons.shield,
    color:
    HexColor(Globalvireables.white),
    size: 50 * unitHeightValue,
    ),
    Spacer(),
    ],
    ),
    ),
    ),
    Text(
    LanguageProvider.Llanguage("Insurance"),


        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
            color: Colors.black,
            fontSize: 13 * unitHeightValue,
            fontWeight: FontWeight.w700
        )


    ),
    ],
    ),
    ),
    Spacer(),
    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => VitalSigns()),);
    },
    child: Column(
    children: [
    Card(
    color: HexColor(
    Globalvireables.basecolor),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    height:
    MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    child: Column(
    children: [
    Spacer(),
    Icon(
    Icons.analytics_rounded,
    color:
    HexColor(Globalvireables.white),
    size: 50 * unitHeightValue,
    ),
    Spacer(),
    ],
    ),
    ),
    ),
    Text(
    LanguageProvider.Llanguage("Vitalsigns"),

        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
            color: Colors.black,
            fontSize: 13 * unitHeightValue,
            fontWeight: FontWeight.w700
        )

    ),
    ],
    ),
    ),
    Spacer(),
    Column(
    children: [
    Card(
    color: HexColor(Globalvireables.basecolor),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    height:
    MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    child: Column(
    children: [
    Spacer(),
    Icon(
    Icons.medical_services,
    color:
    HexColor(Globalvireables.white),
    size: 50 * unitHeightValue,
    ),
    Spacer(),
    ],
    ),
    ),
    ),
    Text(
    LanguageProvider.Llanguage("Prescription"),

        style: ArabicTextStyle(

            arabicFont: ArabicFont.tajawal,
            color: Colors.black,
            fontSize: 13 * unitHeightValue,
            fontWeight: FontWeight.w700
        )

      
    ),
    ],
    )
    ],
    ),
    SizedBox(
    height: 5,
    ),
    Row(
    children: [
    GestureDetector(
    onTap: () async {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Examnation()),
    );},
    child: Column(
    children: [
    Card(
    color: HexColor(Globalvireables.basecolor),
    child: Container(
    width: MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    height:
    MediaQuery
        .of(context)
        .size
        .width /
    4.5,
    child: Column(
    children: [
    Spacer(),
    Icon(
    Icons.abc_rounded,
    color:
    HexColor(Globalvireables.white),
    size: 50 * unitHeightValue,
    ),
    Spacer(),
    ],
    ),
    ),
    ),
    Text(
    LanguageProvider.Llanguage("examination"),

        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
            color: Colors.black,
            fontSize: 13 * unitHeightValue,
            fontWeight: FontWeight.w700
        )



    ),
    ],
    ),
    ),
    Spacer(),

    Spacer(),
    Container(
    width: MediaQuery
        .of(context)
        .size
        .width / 4.5,
    height: MediaQuery
        .of(context)
        .size
        .width / 4.5,
    )
    ],
    ),
    SizedBox(
    height: 40,
    ),
    Row(
    children: [
    Container(
    alignment: Alignment.topLeft,
    child: Text(
    LanguageProvider.Llanguage("Top"),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    color: HexColor(Globalvireables.black2),
    fontSize: 20 * unitHeightValue,
    fontWeight: FontWeight.w700),
    ),
    ),
    Spacer(),
    GestureDetector(
    onTap: () async {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Doctors()),
    );
    },
    child: Container(
    alignment: Alignment.topLeft,
    child: Text(
    LanguageProvider.Llanguage("SeeAll"),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    color: HexColor(Globalvireables.grey),
    fontSize: 16 * unitHeightValue,
    ),
    ),
    ),
    ),
    ],
    ),

    SizedBox(
    height: 10,
    ),
    SizedBox(
    width: MediaQuery
        .of(context)
        .size
        .width / 1.1,
    height: MediaQuery
        .of(context)
        .size
        .width / 2,
    child: FutureBuilder(
    future: getDoctors(context),
    builder: (BuildContext context,
    AsyncSnapshot<List<Doctor>> snapshot) {
    if (snapshot.hasData) {
    List<Doctor>? Doctors = snapshot.data;
    return ListView(
    children: Doctors!
        .map((Doctor Doctor) =>
    SizedBox(
    child: Card(
    shape: RoundedRectangleBorder(
    borderRadius:
    BorderRadius.circular(30),
    // if you need this
    side: BorderSide(
    width:
    MediaQuery
        .of(context)
        .size
        .height,
    //  color: Colors.black12.withOpacity(0.1),
    ),
    ),
    child: LanguageProvider
        .getLanguage() ==
    "EN"
    ? Row(
    children: [
    Image.asset(
    "assets/doctor2.png",
    height: 90 *
    unitHeightValue,
    width: 90 *
    unitHeightValue,
    ),
    Spacer(),
    Container(
    margin:
    EdgeInsets.all(
    10),
    child: Column(
    children: [
    Center(
    child: Text(
    Doctor
        .firsT_NAME_A
        .toString() +
    " " +
    Doctor
        .fatheR_NAME_A
        .toString() +
    " " +
    Doctor
        .lasT_NAME_A
        .toString(),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    fontSize:
    16 *
    unitHeightValue,
    fontWeight:
    FontWeight
        .w700,
    color: Colors
        .black87),
    ),
    ),
    Center(
    child: Text(
    Doctor
        .depName
        .toString(),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    fontSize:
    14 *
    unitHeightValue),
    ),
    ),
    ],
    ),
    ),
    Spacer(),
    ],
    )
        : Row(
    children: [
    Spacer(),
    Container(
    margin:
    EdgeInsets.all(
    10),
    child: Column(
    children: [
    Center(
    child: Text(
    Doctor
        .firsT_NAME_A
        .toString() +
    " " +
    Doctor
        .fatheR_NAME_A
        .toString() +
    " " +
    Doctor
        .lasT_NAME_A
        .toString(),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    fontSize:
    16 *
    unitHeightValue,
    fontWeight:
    FontWeight
        .w700,
    color: Colors
        .black87),
    ),
    ),
    Center(
    child: Text(
    Doctor
        .depName
        .toString(),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    fontSize:
    14 *
    unitHeightValue),
    ),
    ),
    ],
    ),
    ),
    Spacer(),


    Padding(
    padding: const EdgeInsets.only(left: 9.0),
    child: Container(
    child: Image.asset(
    "assets/doctor2.png",
    height: 90 *
    unitHeightValue,
    width: 90 *
    unitHeightValue,
    )),
    ),
    ],
    ))))
        .toList(),
    );
    } else {
    return Center(
    child: CircularProgressIndicator());
    }
    },
    ),
    ),


    /*     FutureBuilder(
                              future: getDoctors(context),
                              builder: (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
                                if (snapshot.hasData) {
                                  List<Doctor>? Doctors = snapshot.data;
                                  return ListView(
                                    children: Doctors!
                                        .map(
                                          (Doctor Doctor) => ListTile(

                                        leading : Container(
                                            child:  Card(
                                        child: Row(
                                        children: [
                                      Container(
                                        alignment: Alignment.topRight,
                                        width: 40,
                                        height: 40,
                                        child: Image.asset(
                                          "assets/doctor.png",
                                        ),
                                      ),


                                      ],


                                    ),
                                  )
                                        ),
                                      ),
                                    )
                                        .toList(),
                                  );
                                } else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              },
                            ),*/
    ],
    ),
    ),
    ),
    ),
    ),
    ),
    ))
    ,
    ]
    );
  }

  Future<List<Doctor>> getDoctors(BuildContext context) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    Uri postsURL =
    Uri.parse(Globalvireables.DoctorsURL);
    try {
      var map = new Map<String, dynamic>();
      map['lan'] = LanguageProvider.getLanguage();
      http.Response res = await http.post(
        postsURL,
        body: map,

      );

      if (res.statusCode == 200) {
        print("Doctors" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<Doctor> Doctors = body
            .map(
              (dynamic item) => Doctor.fromJson(item),
        )
            .toList();

        return Doctors;
      } else {
        throw "Unable to retrieve Doctors.";
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text('بيانات الأطباء'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve Doctors.";
  }

  Future<List<VisitsM>> getvisits(BuildContext context, String p) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    Uri postsURL = Uri.parse(Globalvireables.VisitsApi);
    try {
      var map = new Map<String, dynamic>();
      map['patientNo'] = p;
      http.Response res = await http.post(
        postsURL,
        body: map,
      );

      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);

        List<VisitsM> visits = body
            .map(
              (dynamic item) => VisitsM.fromJson(item),
        )
            .toList();

        return visits;
      } else {
        throw "Unable to retrieve Doctors.";
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text('بيانات الزيارت'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve Doctors.";
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
    profile(),
  ];



  Future<List<Doctor>> getProfile(BuildContext context) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    Uri postsURL =
    Uri.parse(Globalvireables.DoctorsURL);
    try {
      var map = new Map<String, dynamic>();
      map['lan'] = LanguageProvider.getLanguage();
      http.Response res = await http.post(
        postsURL,
        body: map,

      );

      if (res.statusCode == 200) {
        print("Doctors" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<Doctor> Doctors = body
            .map(
              (dynamic item) => Doctor.fromJson(item),
        )
            .toList();

        return Doctors;
      } else {
        throw "Unable to retrieve Doctors.";
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text('بيانات الأطباء'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve Doctors.";
  }


}
