import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hismobileapp/provider/LoginProvider.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import '../provider/languageProvider.dart';
import 'Home.dart';
import 'Index.dart';
import 'package:http/http.dart' as http;
import 'package:arabic_font/arabic_font.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _ipControler = TextEditingController();


  var check = false;
  final auth = LocalAuthentication();

  @override
  void initState() {
    Getrememper();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }
var prefs;
  bool _obscured = false;
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
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    height:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: Image(
                                        image: new AssetImage(
                                         "assets/esraalogo.png"))),
                              ),
          Container(
              alignment:Alignment.center,
margin: EdgeInsets.only(top: 5),
              child: Text(
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
                                      prefixIcon: Icon(Icons.email,color: HexColor(Globalvireables.basecolor)),
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
                                                  Globalvireables.basecolor),
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
                                      prefixIcon: Icon(Icons.password_sharp,color: HexColor(Globalvireables.basecolor),),
                                      suffixIcon: GestureDetector(
                                          onTap: _toggleObscured,
                                          child: Icon(_obscured
                                              ? Icons.lens_blur_outlined
                                              : Icons.remove_red_eye_rounded)),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor(
                                                  Globalvireables.basecolor),
                                              width: 0.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor(
                                                  Globalvireables.basecolor),
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
                                                  Globalvireables.basecolor),
                                              width: 0.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor(
                                                  Globalvireables.basecolor),
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
                                          HexColor(Globalvireables.basecolor),
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
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  margin: EdgeInsets.only(top: 10, bottom: 30),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            HexColor(Globalvireables.basecolor),
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
                                      onPressed: () async {}),
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
  Getrememper() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      _passController.text= prefs.getString('password').toString();
      _emailController.text= prefs.getString('username').toString();

      if(prefs.getString('password').toString().length>1){
        check=true;
      }
    });



  }

  Login(String username, String password, BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var l = Provider.of<Language>(context, listen: false);

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title:  Text(l.Llanguage('login')),
          content: Text(l.getLanguage()=="AR"?'جار تسجيل الدخول ...':'Logging in...'),
        ));


    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['password'] = password;

    /*final json = {"username": username.trim(), "password": password.trim(),"id":"0","refreshToken":"string","accessToken":"string"};
    print("wheeenuser" + json.toString());
*/
    try {
      Uri apiUrl = Uri.parse(Globalvireables.loginAPI);

      http.Response response = await http
          .post(apiUrl, body: json.encode(map),  headers: {
        "content-type" : "application/json",
      },)
          .whenComplete(() => Navigator.pop(context));

      var jsonResponse = jsonDecode(response.body);

      print("wheeen" + jsonResponse.toString());
      print("wheeen2" + jsonResponse["token"].toString());

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

        if (jsonResponse["username"] == username) {

          prefs = await SharedPreferences.getInstance();

          if(check){
            prefs.setString('username',username);
            prefs.setString('password',password);
          }


          Navigator.pop(context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
                  (Route<dynamic> route) => false);
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
          content: Text(l.Llanguage('loginerror') +"\n"+e.toString()),
          actions: <Widget>[],
        ),
      );

    }
  }

}
