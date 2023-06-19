import 'dart:convert';

import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/provider/LoginProvider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';

import '../Models/ProfileM.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:http/http.dart' as http;

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ThemP = Provider.of<Them>(context, listen: false);

    var colors = [HexColor((Globalvireables.secondcolor)), HexColor((ThemP.getcolor()))];
    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [ 0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);
   var Loginprovider = Provider.of<LoginProvider>(context, listen: false);

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
                  label: LanguageProvider.Llanguage('Home')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: LanguageProvider.Llanguage('profile')
              ),
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
            title: Widgets.Appbar(context,LanguageProvider.Llanguage('profile')
           ,unitHeightValue,LanguageProvider.langg,LanguageProvider.getDirection()),
         ),
          backgroundColor: HexColor(ThemP.getcolor()),
          // backgroundColor: Colors.transparent,

          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor((Globalvireables.secondcolor)), HexColor((ThemP.getcolor()))
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
                  height: MediaQuery.of(context).size.height/1.24,
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
                          future: getProfile(context,Loginprovider.userId),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<ProfileM>> snapshot) {
                            if (snapshot.hasData) {
                              List<ProfileM>? Doctors = snapshot.data;
                              return   ListView(
                                children: Doctors!
                                    .map((ProfileM Doctor) => SizedBox(
                                    child: Column(children: [
                                      Doctor.gender=='1'? Container(
                                        width: 120 * unitHeightValue,
                                        height: 120 * unitHeightValue,
                                        child: Image.asset(
                                          "assets/persion2.png",
                                          height: 120,
                                          width: 120,
                                        ),
                                      ):
                                      Container(
                                        width: 120 * unitHeightValue,
                                        height: 120 * unitHeightValue,
                                        child: Image.asset(
                                          "assets/girl.png",
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),

SizedBox(height: 20,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/1.2,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          // if you need this
                                          side: BorderSide(
                                            width: MediaQuery.of(context)
                                                .size
                                                .height,
                                            //  color: Colors.black12.withOpacity(0.1),
                                          ),
                                        ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Icon(
                                              Icons.person,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Center(child: Text(Doctor.fulLANAME.toString(),
                                              style: ArabicTextStyle(
                                                  arabicFont: ArabicFont.tajawal,
                                                  color: HexColor(Globalvireables.black2),
                                                  fontSize: 18 * unitHeightValue,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                          ),
                                        ],
                                      ),

                                      ),
                                    ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/1.2,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            // if you need this
                                            side: BorderSide(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              //  color: Colors.black12.withOpacity(0.1),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.person,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Center(child: Text(Doctor.fulLENAME.toString(),
                                                  style: ArabicTextStyle(
                                                      arabicFont: ArabicFont.tajawal,
                                                      color: HexColor(Globalvireables.black2),
                                                      fontSize: 18 * unitHeightValue,
                                                      fontWeight: FontWeight.w700),
                                                )),
                                              ),
                                            ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/1.2,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            // if you need this
                                            side: BorderSide(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              //  color: Colors.black12.withOpacity(0.1),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.phone,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Center(child: Text(Doctor.mobilENO.toString(),
                                                  style: ArabicTextStyle(
                                                      arabicFont: ArabicFont.tajawal,
                                                      color: HexColor(Globalvireables.black2),
                                                      fontSize: 18 * unitHeightValue,
                                                      fontWeight: FontWeight.w700),
                                                )),
                                              ),
                                            ],
                                          ),

                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/1.2,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            // if you need this
                                            side: BorderSide(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              //  color: Colors.black12.withOpacity(0.1),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.child_friendly_rounded,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Center(child: Text(Doctor.bdate.toString().substring(0,10),
                                                  style: ArabicTextStyle(
                                                      arabicFont: ArabicFont.tajawal,
                                                      color: HexColor(Globalvireables.black2),
                                                      fontSize: 18 * unitHeightValue,
                                                      fontWeight: FontWeight.w700),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/1.2,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            // if you need this
                                            side: BorderSide(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              //  color: Colors.black12.withOpacity(0.1),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.girl_sharp,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Center(child: Text(Doctor.gender.toString()=='1'?'ذكر':'أنثى',
                                                  style: ArabicTextStyle(
                                                      arabicFont: ArabicFont.tajawal,
                                                      color: HexColor(Globalvireables.black2),
                                                      fontSize: 18 * unitHeightValue,
                                                      fontWeight: FontWeight.w700),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),


                                      SizedBox(height: 240,),
                                      Text("Version 1.0 - Galaxy Group")


                                    ],)))
                                    .toList(),
                              );
                            } else {
                              return Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      // getProfile();

                     ],
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
        MaterialPageRoute(builder: (context) => nav[index]),);
    });
  }
  int selectedIndex = 1;

  final List<Widget> nav = [
    Settings(),
    Home(),
    profile(),
  ];


  Future<List<ProfileM>> getProfile(BuildContext context,String patientNo) async {
    Uri postsURL =
    Uri.parse(Globalvireables.profileURL);
    try {
      var map = new Map<String, dynamic>();
      map['PatientNo'] = patientNo;
      http.Response res = await http.post(
        postsURL,
        body: map,

      );

      if (res.statusCode == 200) {
        print("Profile" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<ProfileM> Doctors = body
            .map(
              (dynamic item) => ProfileM.fromJson(item),
        )
            .toList();

        return Doctors;
      } else {
        throw "Unable to retrieve Profile.";
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text('بيانات المريض'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve Profile.";
  }

}
