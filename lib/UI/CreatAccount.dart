import 'dart:convert';
import 'dart:math';

import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/Models/ProfileM.dart';
import 'package:hismobileapp/UI/CreatAccount2.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';

import '../Models/HospitalInfo.dart';
import '../provider/CreateAccountProvider.dart';
import '../provider/LoginProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:http/http.dart' as http;

class CreatAccount extends StatefulWidget {
  @override
  State<CreatAccount> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatAccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  String dropdownvalue = '..';

  var items = [
    'غير اردني',
    'اردني',
    '..',
  ];

  final newpass2 = TextEditingController();
  final newpass1 = TextEditingController();
  final otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var Loginproviderr = Provider.of<LoginProvider>(context, listen: false);
    var ThemP = Provider.of<Them>(context, listen: false);
    var creatProvider = Provider.of<CreateAccountProvider>(context, listen: false);


    var colors = [
      HexColor((Globalvireables.secondcolor)),
      HexColor((ThemP.getcolor()))
    ];
    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [0.0, 1.00];
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
            title: Widgets.Appbar(
                context,
                LanguageProvider.Llanguage('creataccount'),
                unitHeightValue,
                LanguageProvider.langg,
                LanguageProvider.getDirection(),
                'false'),
          ),
          backgroundColor: HexColor(ThemP.getcolor()),
          // backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1,
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
                  height: MediaQuery.of(context).size.height / 1,
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
                        SizedBox(
                          height: 50,
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.center,
                           "جنسيتك",
                            style: ArabicTextStyle(
                                arabicFont: ArabicFont.tajawal,
                                fontWeight: FontWeight.w400,
                                color: HexColor(Globalvireables.black),
                                fontSize: 16 * unitHeightValue),
                          ),
                        ),
                        Container(
                          color: Colors.white54,
                          child: Row(
                            children: [
                              Spacer(),
                              Container(
                                  color: Colors.transparent,
                                  child: DropdownButton(
                                    value: dropdownvalue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          textAlign: TextAlign.center,
                                          style: ArabicTextStyle(
                                            arabicFont: ArabicFont.tajawal,
                                            fontWeight: FontWeight.w400,
                                            color: HexColor(Globalvireables.black),
                                            fontSize: 16 * unitHeightValue,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;

                                        creatProvider.setNationality(newValue);


                                      });
                                    },

                                  )
                              ),
                              Spacer(),

                            ],
                          ),
                        ),


                        creatProvider.getNationality().toString().length>3 && creatProvider.getNationality().toString()!=".."?
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            creatProvider.getNationality()=="اردني"?"ادخل رقمك الوطني او رقم الملف الطبي":"ادخل رقم الوثيقة او رقم الملف الطبي",
                            style: ArabicTextStyle(
                                arabicFont: ArabicFont.tajawal,
                                fontWeight: FontWeight.w400,
                                color: HexColor(Globalvireables.black),
                                fontSize: 16 * unitHeightValue),
                          ),
                        ):Container(),
                        creatProvider.getNationality().toString().length>3 && creatProvider.getNationality().toString()!=".."?
                        Container(
                            margin:
                                EdgeInsets.only(left: 25, right: 25, top: 10),
                            child: TextField(
                              controller: otpcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor(Globalvireables.black),
                                        width: 0.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor(ThemP.getcolor()),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                contentPadding: EdgeInsets.only(
                                    top: 18, bottom: 18, right: 20, left: 20),
                                fillColor: HexColor(Globalvireables.white),
                                filled: true,
                                hintText:
                                    LanguageProvider.Llanguage("nationalid"),
                              ),
                            )):Container(),

                        creatProvider.getNationality().toString().length>3 && otpcontroller.text.length>3 && creatProvider.getNationality().toString()!=".."?
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.only(top: 40, bottom: 5),
                            color: HexColor(Globalvireables.white),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: HexColor(ThemP.getcolor()),
                              ),
                              child: Text(
                                LanguageProvider.Llanguage('Send'),
                                style: ArabicTextStyle(
                                    arabicFont: ArabicFont.tajawal,
                                    color: HexColor(Globalvireables.white),
                                    fontSize: 13 * unitHeightValue),
                              ),
                              onPressed: () async {
                                if (otpcontroller.text.toString().length < 4) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => new AlertDialog(
                                      title: new Text(
                                        'ادخل رقمك الوطني بشكل صحيح',
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: <Widget>[],
                                    ),
                                  );
                                }
                                {
                                  getProfile(context, otpcontroller.text);
                                }
                              },
                            ),
                          ),
                        ):Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    ]);
  }



  int selectedIndex = 1;

  final List<Widget> nav = [
    Settings(),
    Home(),
    profile(),
  ];

  void SendWhatsapp(String number) async {
    Random random = Random();
    int randomNumber = 10000 + random.nextInt(90000);
    int otp = randomNumber;

    var url = Uri.parse(
        "https://api.4whats.net/sendMessage/?instanceid=123803&token=f5749109-7d83-4246-bc34-06aa7b2947b0&phone=" +
            number.toString() +
            "&body=" +
            otp.toString());

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Response: ${response.body}");
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}

Future<List<ProfileM>> getProfile(
    BuildContext context, String patientNo) async {
  var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
  var ip = Loginprovider.getFirebaseIp().toString();
  var LanguageProvider = Provider.of<Language>(context, listen: false);


  showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(LanguageProvider.getLanguage()=="AR"?'إنشاء حساب':'creat account'),
        content: Text(LanguageProvider.getLanguage()=="AR"?'جار تحديث البيانات ...':'Updating...'),
      ));

  ip = 'http://' + Globalvireables.connectIP;
  Uri postsURL = Uri.parse(ip + Globalvireables.profileURL);
  try {
    print("patientNo" + patientNo.toString());

    var map = new Map<String, dynamic>();
    map['PatientNo'] = patientNo.toString();
    http.Response res = await http.post(
      postsURL,
      body: map,
    );

    print("Profileinput" + map.toString());

    if (res.statusCode == 200) {
      print("Profile" + res.body.toString());

      List<dynamic> body = jsonDecode(res.body);

      List<ProfileM> Doctors = body
          .map(
            (dynamic item) => ProfileM.fromJson(item),
          )
          .toList();

      //http://82.212.81.40:8080/websmpp/websms?user=Marka&pass=Marka@123&sid=Marka%20Hos&mno=962779176141&type=1&text=testing%20English%20message

      Random random = Random();
      int randomNumber = 10000 + random.nextInt(90000);
      int otp = randomNumber;

      String phone = Doctors[0].mobilENO.toString().replaceAll('07', '9627');

      var url;

      if (Globalvireables.hospital == 'irbid') {
        url = Uri.parse(
            "https://user.4whats.net/api/qr_code?instanceid=123803&token=f5749109-7d83-4246-bc34-06aa7b2947b0&phone=" +
                phone +
                "&body=" +
                otp.toString());
      } else {
        url = Uri.parse(
            "http://82.212.81.40:8080/websmpp/websms?user=Marka&pass=Marka@123&sid=Marka%20Hos&mno=" +
                phone +
                "&type=1&text=" +
                otp.toString() +
                "");
      }

      var response = await http.get(url);
      if (response.statusCode == 200) {
        if (response.body.toString().contains('\"sent\":true,') &&
            Globalvireables.hospital == 'irbid') {
          Loginprovider.setotp(otp.toString());
          Loginprovider.setphone(phone);
          Loginprovider.setuserId(patientNo);
          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatAccount2()),
          );
        }
        if (!response.body.toString().contains('ERROR') &&
          Globalvireables.hospital == 'marka') {
          Loginprovider.setotp(otp.toString());
          Loginprovider.setphone(phone);
          Loginprovider.setuserId(patientNo);
          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatAccount2()),
          );
        }

        print("Response: ${response.body}");
      } else {
        await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('error'),
            content: Text(e.toString()),
            actions: <Widget>[],
          ),
        );
      }

      return Doctors;
    } else {

      Navigator.pop(context);

      await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('error'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );


      throw "Unable to retrieve Profile.";
    }
  } catch (e) {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('error'),
        content: Text(e.toString()),
        actions: <Widget>[],
      ),
    );
  }

  throw "Unable to retrieve Profile.";
}
