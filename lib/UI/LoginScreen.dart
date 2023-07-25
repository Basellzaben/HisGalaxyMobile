import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hismobileapp/provider/LoginProvider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import '../Models/ChangePassM.dart';
import '../Models/HospitalInfo.dart';
import '../provider/HospitalProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import 'Home.dart';
import 'Index.dart';
import  'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:arabic_font/arabic_font.dart';

import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _ipControler = TextEditingController();


  var check = false;

  @override
  void initState() {
    Getrememper();
    super.initState();
  }
var Terms;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }
var prefs;
  bool _obscured = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  var Loginprovider;
  @override
  Widget build(BuildContext context) {
_ipControler.text='10.0.1.65:9999';
double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;


var ThemP = Provider.of<Them>(context, listen: false);
var LanguageProvider = Provider.of<Language>(context, listen: false);




     Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    return Stack(children: <Widget>[
      Image.asset(
        "assets/background.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Directionality(
          textDirection: LanguageProvider.getDirection(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: MediaQuery.of(context).size.width / 1,
                          child: Column(
                            children: [
                              Center(
                                child: Container(

                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Image(
                                        image: new AssetImage(
                                         "assets/esraalogo.png"))),
                              ),
          Container(
              alignment:Alignment.center,
margin: EdgeInsets.only(top: 0),
              child: Text(
    textAlign: TextAlign.center,
                  LanguageProvider.Llanguage("AlEsraaHospital"),
                  style: ArabicTextStyle(
                      arabicFont: ArabicFont.tajawal,
                      color: HexColor(Globalvireables.black2),
                      fontSize: 25 * unitHeightValue,
                      fontWeight: FontWeight.w700)
              )),
                              SizedBox(
                                height: 17,
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 25, right: 25, top: 10),
                                  child: TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email,color: HexColor(ThemP.getcolor())),
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
                                          "username"),
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 25, right: 25, top: 44),
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: _obscured,
                                    controller: _passController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.admin_panel_settings_sharp,color: HexColor(ThemP.getcolor()),),
                                      suffixIcon: GestureDetector(
                                          onTap: _toggleObscured,
                                          child: Icon(_obscured
                                              ? Icons.remove_red_eye_rounded
                                              : Icons.lens_blur_outlined)),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor(
                                                  ThemP.getcolor()),
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
                                          'password'),
                                    ),
                                  )),
                             /* Container(
                                  margin: EdgeInsets.only(
                                      left: 25, right: 25, top: 44),
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _ipControler,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.add_circle),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor(
                                                  ThemP.getcolor()),
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
                                      hintText: 'IP Address',
                                    ),
                                  )),*/
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
                                      LanguageProvider.Llanguage('login'),
                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                          color:
                                              HexColor(Globalvireables.white),
                                          fontSize: 13 * unitHeightValue),
                                    ),
                                    onPressed: () async {

                                      Login(_emailController.text.toString(),_passController.text.toString(),context);

                                     /* Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) => Index(),
                                          ),
                                          (Route<dynamic> route) => false);*/
                                    },
                                  ),
                                ),
                              ),
                              if (LanguageProvider.langg == "AR")
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 0),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            value: check,
                                            //set variable for value
                                            onChanged: (bool? value) async {
                                              setState(()  {
                                                check = !check;

                                                if(!check){
                                                  prefs.setString('username','');
                                                  prefs.setString('password','');
                                                }

                                                //Provider.of<LoginProvider>(context, listen: false).setRemember(check);
                                                //   saveREstate(check.toString());
                                              });
                                            }),
                                        Text(
                                            LanguageProvider.Llanguage(
                                                "RememberMe"),
                                            style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    12 * unitHeightValue)),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 0),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            value: check,
                                            //set variable for value
                                            onChanged: (bool? value) async {
                                              setState(() {
                                                check = !check;
                                                cleanRemember(check);
                                                //Provider.of<LoginProvider>(context, listen: false).setRemember(check);
                                                //   saveREstate(check.toString());
                                              });
                                            }),
                                        Text(
                                            LanguageProvider.Llanguage(
                                                "RememberMe"),
                                            style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    12 * unitHeightValue)),
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(
                               child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    margin: EdgeInsets.only(top: 10, bottom: 30),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              HexColor(ThemP.getcolor()),
                                        ),
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Text(
                                              LanguageProvider.Llanguage(
                                                  'finger'),
                                              style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                  color: Colors.white,
                                                  fontSize: 12 * unitHeightValue),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.fingerprint,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        onPressed: () async {


                                          try {
                                            final bool didAuthenticate = await auth.authenticate(

                                              localizedReason: 'Please authenticate to show account balance',
                                              options: const AuthenticationOptions(useErrorDialogs: true,
                                                  stickyAuth: false,
                                                  sensitiveTransaction: true
                                              ),
                                            );
                                           if(didAuthenticate && check){
                                             prefs = await SharedPreferences.getInstance();
                                             Login(
                                             prefs.getString('username'),
                                             prefs.getString('password'),context
                                             );
                                          }else{
                                             showDialog(
                                                 context: context,
                                                 builder: (_) => AlertDialog(
                                                   title: Text(LanguageProvider.Llanguage('login')),
                                                   content: Text(LanguageProvider.Llanguage('loginerrorfinget')),
                                                 ));
                                           }
                                          } on PlatformException catch (e) {
                                            print("errorlogiin "+ e.message.toString());
                                           /* if (e.code == auth_error.notEnrolled) {
                                              // Add handling of no hardware here.
                                            } else if (e.code == auth_error.lockedOut ||
                                                e.code == auth_error.permanentlyLockedOut) {
                                            } else {
                                             print("errorlogiin "+ e.message.toString());
                                            }*/
                                          }

                                        }),
                                  ),
                                ),
                             ),

                              SizedBox(height: 14),
                              LanguageProvider.getLanguage()!='AR'?
                              Center(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      "Powered By",
                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                          color: HexColor(Globalvireables.black)),
                                    ),
                                    SizedBox(width: 5,),
                                    Image.asset(
                                      "assets/logo.png",
                                      height: 25,
                                    ),
                                    Spacer()



                                  ],
                                ),
                              ):
                              Center(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Image.asset(
                                      "assets/logo.png",
                                      height: 25,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "Powered By",
                                      style: ArabicTextStyle(
                                          arabicFont: ArabicFont.tajawal,
                                          color: HexColor(Globalvireables.black)),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              )


                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }


  cleanRemember(bool r) async {
    prefs = await SharedPreferences.getInstance();

    if(!r){
      prefs.setString('username','');
      prefs.setString('password','');
    }

  }
  final LocalAuthentication auth = LocalAuthentication();
  Getrememper() async {
    prefs = await SharedPreferences.getInstance();
   try{
    if(prefs.getString('them')!=null && prefs.getString('them').toString().length>4){
      Provider.of<Them>(context, listen: false).setcolor(prefs.getString('them').toString());
    }}catch(_){

   }

    setState(() {

      Future<void> authinticate() async {

      }

      if(prefs.getString('password').toString().length>1 && prefs.getString('password').toString()!='null'
      && prefs.getString('password').toString()!=null){
        _passController.text= prefs.getString('password').toString();
        _emailController.text= prefs.getString('username').toString();

        check=true;
      }else{
        _passController.text='';
        _emailController.text='';
      }
    });



  }


  Login(String username, String password, BuildContext context) async {

    getHospitalInf();


    prefs = await SharedPreferences.getInstance();
    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var l = Provider.of<Language>(context, listen: false);

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title:  Text(l.Llanguage('login')),
          content: Text(l.getLanguage()=="AR"?'جار تسجيل الدخول ...':'Logging in...'),
        ));


    print("UUSER" + username.toString());
    print("PPass" + password.toString());


    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;

    /*final json = {"username": username.trim(), "password": password.trim(),"id":"0","refreshToken":"string","accessToken":"string"};
    print("wheeenuser" + json.toString());
*/
    try {
      Uri apiUrl = Uri.parse(Globalvireables.loginAPI);

      http.Response response = await http
          .post(apiUrl, body:map,  )
          .whenComplete(() => Navigator.pop(context));

      var jsonResponse = jsonDecode(response.body);

      print("wheeen" + jsonResponse.toString());
      print("wheeen2" + jsonResponse["token"].toString());

      Loginprovider.setpass(password.toString());
      Loginprovider.setid(jsonResponse["id"].toString());
      Loginprovider.setusername(jsonResponse["username"]);
      Loginprovider.setcustno(jsonResponse["custno"].toString());
      Loginprovider.setrefreshToken(jsonResponse["refreshToken"]);
      Loginprovider.settoken(jsonResponse["token"]);
      Loginprovider.setnameA(jsonResponse["nameA"]);
      Loginprovider.setnameE(jsonResponse["nameE"]);
      Loginprovider.setuserId(jsonResponse["userId"].toString());
      Loginprovider.setuserType(jsonResponse["userType"].toString());
      Loginprovider.setcreatedDate(jsonResponse["createdDate"].toString());


      print(jsonResponse["nameA"]+"UUU");
      print(jsonResponse["nameE"]+"UUU2");

        if (jsonResponse["username"] == username) {

          prefs = await SharedPreferences.getInstance();

          if(check){
            prefs.setString('username',username);
            prefs.setString('password',password);
          }


if(jsonResponse["userType"].toString()!='2'){
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l.Llanguage('login')),
        content: Text(l.Llanguage('anerror')),
      ));
}
else
          CheckTerms(jsonResponse["userId"].toString(),jsonResponse["username"].toString());



        } else {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(l.Llanguage('login')),
                content: Text(l.Llanguage('loginerror')),
              ));
        }
    } catch (e) {
      //Navigator.pop(context);

      await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(l.Llanguage('login')),
          content: Text(l.Llanguage('loginerror') ),
          actions: <Widget>[],
        ),
      );

    }
  }


  CheckTerms(String PatientNo,String Patientname) async {

    var LanguageProvider = Provider.of<Language>(context, listen: false);

    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;

    var l = Provider.of<Language>(context, listen: false);




    var map = new Map<String, dynamic>();
    map['PatientNo'] = PatientNo;

    Uri apiUrl = Uri.parse(Globalvireables.TermsACCSEPT);

    http.Response response = await http
        .post(apiUrl, body:map,  );

    try {
      var jsonResponse = jsonDecode(response.body);


      print("teeerms "+jsonResponse.toString());
      if (!jsonResponse.toString().contains(PatientNo) ) {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,

            context: context,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.85,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/1.1,
                  child: SingleChildScrollView(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [


                      Text(
                          textAlign: TextAlign.center,

                          LanguageProvider.Llanguage("terms"),
                          style: ArabicTextStyle(
                              arabicFont: ArabicFont.tajawal,
                              fontWeight:
                              FontWeight
                                  .w700,
                              fontSize: 18 *
                                  unitHeightValue)),

                      Padding(padding: const EdgeInsets.all(10),
                          child: Text(
                              textAlign: TextAlign.center,
                              Terms.toString()
                                    )),



                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          width:
                          MediaQuery
                              .of(context)
                              .size
                              .width / 1.2,
                          margin: EdgeInsets.only(top: 40, bottom: 5),
                          color: HexColor(Globalvireables.white),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                              HexColor(Provider.of<Them>(context, listen: false)
                                  .getcolor()),
                            ),
                            child: Text(
                              l.Llanguage('loginandacept'),
                              style: ArabicTextStyle(
                                  arabicFont: ArabicFont.tajawal,
                                  color:
                                  HexColor(Globalvireables.white),
                                  fontSize: 13 * unitHeightValue),
                            ),
                            onPressed: () async {
                              ChangeTerms(context,PatientNo,Patientname);

                            },
                          ),
                        ),
                      ),

                    ],),
                  ),),
                ),
              );
            });
      }else{
        Navigator.pop(context);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
                (Route<dynamic> route) => false);
      }


    }catch(e){
      print("teeerms "+e.toString());

      showModalBottomSheet(
          isDismissible: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,

          context: context,
          builder: (context) {
            return SingleChildScrollView(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [

                Text(
                    textAlign: TextAlign.center,

                    LanguageProvider.Llanguage("terms"),
                    style: ArabicTextStyle(
                        arabicFont: ArabicFont.tajawal,
                        fontWeight:
                        FontWeight
                            .w700,
                        fontSize: 16 *
                            unitHeightValue)),

                Padding(padding: const EdgeInsets.all(10),
                    child:Text(
                        textAlign: TextAlign.center,
                        Terms.toString()
                                 )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width:
                    MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    margin: EdgeInsets.only(top: 40, bottom: 5),
                    color: HexColor(Globalvireables.white),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                        HexColor(Provider.of<Them>(context, listen: false)
                            .getcolor()),
                      ),
                      child: Text(
                        l.Llanguage('login'),
                        style: ArabicTextStyle(
                            arabicFont: ArabicFont.tajawal,
                            color:
                            HexColor(Globalvireables.white),
                            fontSize: 13 * unitHeightValue),
                      ),
                      onPressed: () async {

                        ChangeTerms(context,PatientNo,Patientname);



                      },
                    ),
                  ),
                ),

              ],),
            ),);
          });

    }




  }


  ChangeTerms(BuildContext context,String patientNo,String patientname) async {

    print("userid :"+patientNo.toString());

    var LanguageProvider = Provider.of<Language>(context, listen: false);

    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String time = DateFormat("hh:mm:ss a").format(DateTime.now());

    Uri postsURL =
    Uri.parse(Globalvireables.ChangeTermsACCSEPTURL);
    try {
      var map = new Map<String, dynamic>();
      map['PatientNo'] = patientNo;
      map['patientname'] = patientname;
      map['date'] = date;
      map['time'] = time;

      http.Response res = await http.post(
        postsURL,
        body: map,
      );

      if (res.statusCode == 200) {
        print("ChangePass" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<ChangePassM> Doctorss = body
            .map(
              (dynamic item) => ChangePassM.fromJson(item),
        )
            .toList();


        if(Doctorss[0].response=='1S'){

          Navigator.pop(context);

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
                  (Route<dynamic> route) => false);

        }else{
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (context) =>
            new AlertDialog(
              title: new Text(LanguageProvider.Llanguage('anerrortitle')),
              content: Text(LanguageProvider.Llanguage('anerror')),
              actions: <Widget>[],
            ),
          );
        }


      } else {
        Navigator.pop(context);

        await showDialog(
          context: context,
          builder: (context) =>
          new AlertDialog(
            title: new Text(LanguageProvider.Llanguage('anerrortitle')),
            content: Text(LanguageProvider.Llanguage('anerror')),
            actions: <Widget>[],
          ),
        );
      }
    } catch (e) {
      Navigator.pop(context);

      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text(LanguageProvider.Llanguage('anerrortitle')),
          content: Text(LanguageProvider.Llanguage('anerror')),
          actions: <Widget>[],
        ),
      );
    }

  }


  Future<List<HospitalInfo>> getHospitalInf() async {
    var HosProvider = Provider.of<HospitalProvider>(context, listen: false);
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    Uri postsURL =
    Uri.parse(Globalvireables.HospitalInfoURL);
    print(Globalvireables.HospitalInfoURL.toString());
    try {
      http.Response res = await http.post(
        postsURL,
      );

      if (res.statusCode == 200) {
        print("Doctors" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<HospitalInfo> HINFO = body
            .map(
              (dynamic item) => HospitalInfo.fromJson(item),
        )
            .toList();

        print(HINFO[0].Terms.toString()+"sdafdsf");

        Terms=HINFO[0].Terms.toString();

        HosProvider.setTerms(HINFO[0].Terms.toString());
        HosProvider.setFacebook(HINFO[0].Facebook.toString());
        HosProvider.setTwitter(HINFO[0].Twitter.toString());


        return HINFO;
      } else {
        throw "Unable to retrieve Doctors. orrr";
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text(LanguageProvider.Llanguage('anerrortitle')),
          content: Text(LanguageProvider.Llanguage('anerror')),

          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve Doctors.";
  }


}
