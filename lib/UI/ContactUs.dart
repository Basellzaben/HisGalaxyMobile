import 'dart:convert';

import 'package:arabic_font/arabic_font.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/HospitalInfo.dart';
import '../Models/ProfileM.dart';
import '../provider/LoginProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/material.dart'; // Import the Flutter material library for the ScaffoldMessenger and SnackBar

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    super.initState();
  }
//galaxygr12
  @override
  void dispose() {
    super.dispose();
  }

  final noteController = TextEditingController();


  final nationalIDController = TextEditingController();

  String dropdownvalue = 'استفسار';

  var items = [
    'شكوى',
    'تعليق',
    'استفسار',
  ];



  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [ 0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    var ThemP = Provider.of<Them>(context, listen: false);

    return Stack(children: <Widget>[
      Image.asset(
        "assets/backgroundhinfo.png",
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
            title: Widgets.Appbar(context,LanguageProvider.Llanguage('contactus') , unitHeightValue,LanguageProvider.langg,LanguageProvider.getDirection()
            ,"false"),
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
                end:  FractionalOffset.bottomCenter,
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
                         "assets/problem.png",
                         height: MediaQuery.of(context).size.width/1.6,
                         width: MediaQuery.of(context).size.width,
                       ),

                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                           textAlign: TextAlign.center,
                           "نرحب بملاحظاتكم بشكل كبير، فإذا كان لديكم أي تعليق أو اقتراح، فلا تترددوا في إرساله",
                           style: ArabicTextStyle(
                               arabicFont: ArabicFont.tajawal,
                               fontWeight: FontWeight.w400,
                               color: HexColor(
                                   Globalvireables.black),
                               fontSize: 16 * unitHeightValue),
                         ),
                       ),

                   Row(
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
                                 textAlign: TextAlign.right,
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
                             });
                           },

                         )
                       ),
                     ],
                   ),

                       Container(
                           margin: EdgeInsets.only(
                               left: 10, right: 10, top: 30),
                           child: TextField(
                             textAlign: TextAlign.center,
                             controller: noteController,
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
                                   "message"),
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

                               getProfile(context,noteController.text);

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


 getProfile(BuildContext context,String bodyyy) async {

    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var ip= Loginprovider.getFirebaseIp().toString();


    Uri postsURL =
    Uri.parse(ip+Globalvireables.profileURL);
    try {




      var map = new Map<String, dynamic>();
      map['PatientNo'] = Loginprovider.getuserId();
      http.Response res = await http.post(
        postsURL,
        body: map,

      );

      print("Profileinput" + map.toString());


      if (res.statusCode == 200) {
        print("Profile------" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<ProfileM> Doctors = body
            .map(
              (dynamic item) => ProfileM.fromJson(item),
        )
            .toList();


        Loginprovider.setphone(Doctors[0].mobilENO.toString());
        sendEmail(bodyyy);
        return Doctors;
      } else {
      }
    } catch (e) {

    }

  }
  sendEmail( String body) async {
   // getProfile(context);
    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);


    String messagetype='نوع الرساله :'+dropdownvalue.toString();
    String userId='رقم المريض :'+Loginprovider.userId.toString();
    String nameA='اسم المريض :'+Loginprovider.nameA.toString();
    String phone='رقم هاتف المريض :'+Loginprovider.getphone().toString();

    String info=messagetype+"\n"+nameA+"\n"+phone+"\n"+userId;

    final Email email = Email(
      body: info+"\n"+body,
      subject: 'ملاحظات المرضى',
      recipients: ['basellalzaben@gmail.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
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


  Future<List<HospitalInfo>> getHospitalInf(BuildContext context) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var ip= Loginprovider.getFirebaseIp().toString();


    Uri postsURL =
    Uri.parse(ip+Globalvireables.HospitalInfoURL);
    try {
      http.Response res = await http.post(
        postsURL,
      );

      if (res.statusCode == 200) {
        print("Doctors" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<HospitalInfo> Doctors = body
            .map(
              (dynamic item) => HospitalInfo.fromJson(item),
        )
            .toList();

print("facebookAPI "+Doctors[0].Facebook.toString());

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
  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);

    print("urrri "+url);

    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) { // <--
      throw Exception('Could not launch $_url');
    }
  }

}
