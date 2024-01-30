import 'dart:convert';

import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/Models/ProfileM.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';

import '../Models/ChangePassM.dart';
import '../Models/CreatAccountModel.dart';
import '../Models/HospitalInfo.dart';
import '../provider/LoginProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:http/http.dart' as http;

class CreatAccount2 extends StatefulWidget {
  @override
  State<CreatAccount2> createState() => _CreatAccount2State();
}

class _CreatAccount2State extends State<CreatAccount2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final newpass2 = TextEditingController();
  final newpass1 = TextEditingController();
  final otpcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var Loginproviderr = Provider.of<LoginProvider>(context, listen: false);
    var ThemP = Provider.of<Them>(context, listen: false);
    String pp='';
    try{
      pp=Loginproviderr.getphone().toString().substring(Loginproviderr.getphone().toString().length-2,Loginproviderr.getphone().toString().length);
      String pp2=Loginproviderr.getphone().toString().substring(0,3);
      pp=pp+"*******"+pp2;

    }catch(_){

    }

    var colors = [HexColor((Globalvireables.secondcolor)), HexColor((ThemP.getcolor()))];
    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [ 0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    return Stack(children: <Widget>[
      Image.asset(
        "assets/backgroundhinfo.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.white,
            bottomOpacity: 800.0,
            elevation: 4.0,
            title: Widgets.Appbar(context,LanguageProvider.Llanguage('creataccount') , unitHeightValue,LanguageProvider.langg,LanguageProvider.getDirection()
                ,'false'),
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
                        Image.asset(
                          "assets/repass.png",
                          height: 200,
                          width: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            " تم ارسال رمز التحقق المكون من 5 ارقام إلى رقمك  " + " $pp ",
                            style: ArabicTextStyle(
                                arabicFont: ArabicFont.tajawal,
                                fontWeight: FontWeight.w400,
                                color: HexColor(
                                    Globalvireables.black),
                                fontSize: 16 * unitHeightValue),
                          ),
                        ),



                        SizedBox(height: 20,),

                        Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, top: 10),
                            child: TextField(
                              controller: otpcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor(
                                            Globalvireables.black),
                                        width: 0.0),
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor(
                                            ThemP.getcolor()),
                                        width: 1.0),
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
                                    "otp"),
                              ),
                            )
                        ),


                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            width:
                            MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.only(top: 40, bottom: 5),
                            color: HexColor(Globalvireables.white),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                HexColor(ThemP.getcolor()),
                              ),
                              child: Text(
                                LanguageProvider.Llanguage('Send'),
                                style: ArabicTextStyle(
                                    arabicFont: ArabicFont.tajawal,
                                    color:
                                    HexColor(Globalvireables.white),
                                    fontSize: 13 * unitHeightValue),
                              ),
                              onPressed: () async {

                                if( otpcontroller.text==Loginproviderr.getotp().toString())
                                  CreatAccount2(context,Loginproviderr.userId);
                                else
                                  await showDialog(
                                    context: context,
                                    builder: (context) =>
                                    new AlertDialog(
                                      title: new Text(LanguageProvider.Llanguage('Gangepasswor')),
                                      content: Text(LanguageProvider.Llanguage('confrpassmost')),
                                      actions: <Widget>[],
                                    ),
                                  );

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

  CreatAccount2(BuildContext context,String patientNo) async {


    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var ip= Loginprovider.getFirebaseIp().toString();


    var LanguageProvider = Provider.of<Language>(context, listen: false);

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(LanguageProvider.getLanguage()=="AR"?'تحديث البيانات':'Updating'),
          content: Text(LanguageProvider.getLanguage()=="AR"?'جار تحديث البيانات ...':'Updating...'),
        ));



    Uri postsURL =
    Uri.parse(Loginprovider.getFirebaseIp().toString()+
        Globalvireables.CreatAccount);

    String userid=  Loginprovider.getuserId().toString();

    print("CreatAccount2 \n" + postsURL.toString());


    try {
      var map = new Map<String, dynamic>();
      map['PatientNo'] = userid;

      http.Response res = await http.post(
        postsURL,
        body: map,

      ).whenComplete(() => Navigator.pop(context));


      print("phone \n" +  Loginprovider.getphone().toString());

      print("statusCode \n" +  res.statusCode.toString());

      if (res.statusCode == 200) {

        List<dynamic> body = jsonDecode(res.body);

        List<CreatAccountModel> Doctors = body
            .map(
              (dynamic item) => CreatAccountModel.fromJson(item),)
            .toList();

        print("CreatAccount2State" + res.body.toString());

        if(!res.body.toString().contains('0E')){

        var url;


        if (Globalvireables.hospital == 'irbid') {
          url = Uri.parse(
              "https://user.4whats.net/api/qr_code?instanceid=123803&token=f5749109-7d83-4246-bc34-06aa7b2947b0&phone=" +
                  Loginprovider.getphone() +
                  "&body=" +

                  "Irbid His Login Information \n"+
                  "username : "+ Doctors[0].username.toString() +"\n"
                  "password : "+ Doctors[0].passwordd.toString() +""
          );
        } else {
          url = Uri.parse(
              "http://82.212.81.40:8080/websmpp/websms?user=Marka&pass=Marka@123&sid=Marka%20Hos&mno=" +
                  Loginprovider.getphone() +
                  "&type=1&text=" +

                  "Irbid His Login Information \n"+
                  "username : "+ Doctors[0].username.toString() +"\n"
                  "password : "+ Doctors[0].passwordd.toString() +

                  "");
        }

        var response = await http.get(url);
        if (response.statusCode == 200) {
          if (response.body.toString().contains('\"sent\":true,') &&
              Globalvireables.hospital == 'irbid') {
            Navigator.pop(context);
            Navigator.pop(context);

            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(LanguageProvider.getLanguage()=="AR"?'تحديث البيانات':'Updating'),
                  content: Text('تم ارسال معلومات تسجيل الدخول إلى رقم هاتفك '),     actions: <Widget>[],
                ));
          }
          if (!response.body.toString().contains('ERROR') &&
              Globalvireables.hospital == 'marka') {
            Navigator.pop(context);
            Navigator.pop(context);

            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(LanguageProvider.getLanguage()=="AR"?'تحديث البيانات':'Updating'),
                  content: Text('تم ارسال معلومات تسجيل الدخول إلى رقم هاتفك '),     actions: <Widget>[],
                ));
          }

          print("Response2: ${response.body}");
        } else {
          print("Error: ${response.statusCode}");
        }



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
       // Navigator.pop(context);

        new AlertDialog(
          title: new Text(LanguageProvider.Llanguage('anerrortitle')),
          content: Text(LanguageProvider.Llanguage('anerror')),     actions: <Widget>[],
        );
      }
    } catch (e) {
      Navigator.pop(context);
      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text(LanguageProvider.Llanguage('anerrortitle')),
          content: Text(LanguageProvider.Llanguage('anerror') + e.toString()),
          actions: <Widget>[],
        ),

      );
    }

  }





}

/*

  */


/*
Spacer()
,
Container(
margin: EdgeInsets.only(
left: 25, right: 25, top: 10),
child: TextField(
controller: otpcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(
color: HexColor(
Globalvireables.black),
width: 0.0),
borderRadius:
BorderRadius.circular(10.0)),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(
color: HexColor(
ThemP.getcolor()),
width: 1.0),
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
"otpcontroller"),
),
)),
Container(
margin: EdgeInsets.only(
left: 25, right: 25, top: 10),
child: TextField(
controller: newpass1,
decoration: InputDecoration(
border: OutlineInputBorder(),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(
color: HexColor(
Globalvireables.black),
width: 0.0),
borderRadius:
BorderRadius.circular(10.0)),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(
color: HexColor(
ThemP.getcolor()),
width: 1.0),
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
"newpass"),
),
)),
Container(
margin: EdgeInsets.only(
left: 25, right: 25, top: 10),
child: TextField(
controller: newpass2,
decoration: InputDecoration(
border: OutlineInputBorder(),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(
color: HexColor(
Globalvireables.black),
width: 0.0),
borderRadius:
BorderRadius.circular(10.0)),
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(
color: HexColor(
ThemP.getcolor()),
width: 1.0),
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
"newpassconfirm"),
),
)),

Spacer(),

Align(
alignment: Alignment.bottomCenter,
child: Container(
height: 50,
width:
MediaQuery.of(context).size.width / 1.2,
margin: EdgeInsets.only(top: 40, bottom: 5),
color: HexColor(Globalvireables.white),
child: ElevatedButton(
style: ElevatedButton.styleFrom(
primary:
HexColor(ThemP.getcolor()),
),
child: Text(
LanguageProvider.Llanguage('CreatAccount2'),
style: ArabicTextStyle(
arabicFont: ArabicFont.tajawal,
color:
HexColor(Globalvireables.white),
fontSize: 13 * unitHeightValue),
),
onPressed: () async {
if(newpass1.text==newpass2.text)
CreatAccount2(context,LoginProvider().userId,newpass1.text);
else
await showDialog(
context: context,
builder: (context) =>
new AlertDialog(
title: new Text(LanguageProvider.Llanguage('Gangepasswor')),
content: Text(LanguageProvider.Llanguage('confrpassmost')),
actions: <Widget>[],
),
);
*//* Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) => Index(),
                                          ),
                                          (Route<dynamic> route) => false);*//*
},
),
),
),


Spacer()*/