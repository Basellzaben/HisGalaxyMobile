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
import '../Models/HospitalInfo.dart';
import '../provider/LoginProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:http/http.dart' as http;

class ForgetPassword2 extends StatefulWidget {
  @override
  State<ForgetPassword2> createState() => _ForgetPassword2State();
}

class _ForgetPassword2State extends State<ForgetPassword2> {
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
            title: Widgets.Appbar(context,LanguageProvider.Llanguage('Gangepasswor') , unitHeightValue,LanguageProvider.langg,LanguageProvider.getDirection()
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
                           " تم ارسال رمز التحقق المكون من 5 ارقام إلى واتساب رقم  " + " $pp ",
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


                        Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, top: 10),
                            child: Text(textAlign: TextAlign.right,'يجب أن تكون كلمة المرور أطول من 6 أحرف و تحتوي كلمة المرور على احرف كبيرة و صغيرة ورموز '
                            ,style: TextStyle(color: Colors.red),)),



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
                                LanguageProvider.Llanguage('Gangepasswor'),
                                style: ArabicTextStyle(
                                    arabicFont: ArabicFont.tajawal,
                                    color:
                                    HexColor(Globalvireables.white),
                                    fontSize: 13 * unitHeightValue),
                              ),
                              onPressed: () async {

                                if(newpass1.text==newpass2.text && otpcontroller.text==Loginproviderr.getotp().toString())
                                  _validatePassword(newpass2.text);
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

   ForgetPassword2(BuildContext context,String patientNo,String newPass) async {

     var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var ip= Loginprovider.getFirebaseIp().toString();

         print("userid :"+patientNo.toString());

    var LanguageProvider = Provider.of<Language>(context, listen: false);

     showDialog(
         context: context,
         builder: (_) => AlertDialog(
           title: Text(LanguageProvider.getLanguage()=="AR"?'تحديث البيانات':'Updating'),
           content: Text(LanguageProvider.getLanguage()=="AR"?'جار تحديث البيانات ...':'Updating...'),
         ));



    Uri postsURL =
    Uri.parse(    Loginprovider.getFirebaseIp().toString()+
        Globalvireables.ChangePassURL);


     print("ForgetPassword2" + postsURL.toString());


     try {
      var map = new Map<String, dynamic>();
      map['PatientNo'] = patientNo;
      map['password'] = newPass;

      http.Response res = await http.post(
        postsURL,
        body: map,

      ).whenComplete(() => Navigator.pop(context));

      if (res.statusCode == 200) {
        print("ForgetPassword2" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<ChangePassM> Doctors = body
            .map(
              (dynamic item) => ChangePassM.fromJson(item),
        )
            .toList();


        if(Doctors[0].response=='1S'){

         var prefs = await SharedPreferences.getInstance();

            prefs.setString('ForgetPassword2','yes');

         Navigator.pop(context);
         Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (context) =>
            new AlertDialog(
              title: new Text(LanguageProvider.Llanguage('Gangepasswor')),
              content: Text(LanguageProvider.Llanguage('SGangepasswor')),
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


   _validatePassword(String password) {

     var Loginproviderr = Provider.of<LoginProvider>(context, listen: false);


     String _errorMessage='';
    if (password.length <6) {
      _errorMessage += ' يجب أن تحتوي كلمة المرور أطول من 6 أحرف و ';
    }
    // Contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      _errorMessage += ' يجب أن تحتوي كلمة المرور على احرف كبيرة و ';

    }
    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      _errorMessage += ' يجب أن تحتوي كلمة المرور على احرف صغيرة و ';

    }
    // Contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      _errorMessage += ' يجب أن تحتوي كلمة المرور على ارقام و ';

    }
    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      _errorMessage += ' يجب أن تحتوي كلمة المرور على رموز ';
    }

if(_errorMessage.length>3)
{
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(_errorMessage),
  ));
}else
  ForgetPassword2(context,Loginproviderr.userId,newpass1.text);
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
LanguageProvider.Llanguage('ForgetPassword2'),
style: ArabicTextStyle(
arabicFont: ArabicFont.tajawal,
color:
HexColor(Globalvireables.white),
fontSize: 13 * unitHeightValue),
),
onPressed: () async {
if(newpass1.text==newpass2.text)
ForgetPassword2(context,LoginProvider().userId,newpass1.text);
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