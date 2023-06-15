import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/LoginScreen.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'package:arabic_font/arabic_font.dart';
class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [0.0, 1.00];
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
            title: Widgets.Appbar(context, LanguageProvider.Llanguage('settings'), unitHeightValue,LanguageProvider.langg,LanguageProvider.getDirection()),
          ),
          backgroundColor: HexColor(Globalvireables.basecolor),
          body: Container(
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
            child: Directionality(
              child: SafeArea(
                child: Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.24,
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
                    child: Container(
                      padding: EdgeInsets.only(left: 11, right: 11),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                    alignment: LanguageProvider.Align(),
                                    child: Text(
                                      LanguageProvider.Llanguage("general"),
                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                          fontSize: 17.5 * unitHeightValue,
                                          color: HexColor(Globalvireables.grey),
                                          fontWeight: FontWeight.w500),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () async {

                                    setState(() {
                                      if (LanguageProvider.getLanguage() ==
                                          'AR') {
                                        LanguageProvider.setLanguage('EN');
                                      } else {
                                        LanguageProvider.setLanguage('AR');
                                      }
                                    });
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    pref.setString(
                                        'language', LanguageProvider.langg);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color:
                                            HexColor(Globalvireables.basecolor),
                                        size: 35 * unitHeightValue,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        LanguageProvider.Llanguage('language'),
                                        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                            fontSize: 17.5 * unitHeightValue,
                                            color:
                                                HexColor(Globalvireables.black),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Spacer(),
                                      Text(
                                        LanguageProvider.getLanguage(),
                                        style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                          fontSize: 15.5 * unitHeightValue,
                                          color: HexColor(Globalvireables.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Divider(thickness: 1.0, color: Colors.black),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.change_circle_outlined,
                                      color:
                                          HexColor(Globalvireables.basecolor),
                                      size: 35 * unitHeightValue,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      LanguageProvider.Llanguage('Gangepasswor'),
                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                          fontSize: 17.5 * unitHeightValue,
                                          color:HexColor(Globalvireables.black),
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Divider(thickness: 1.0, color: Colors.black),
                                GestureDetector(
                                    onTap: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Expanded(
                                            child: AlertDialog(
                                              title: Text(
                                                  LanguageProvider.Llanguage('Logout'),
                                                  style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                      fontSize: 22 *
                                                          unitHeightValue)),
                                              content: Text(
                                                LanguageProvider.Llanguage("txxt"),
                                                style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                    fontSize:
                                                        14 * unitHeightValue),
                                              ),
                                              actions: [
                                                TextButton(
                                                  //  textColor: Colors.black,
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoginScreen(),
                                                            ),
                                                            (Route<dynamic>
                                                                    route) =>
                                                                false);
                                                  },
                                                  child: Text(
                                                    LanguageProvider.Llanguage('Logout'),
                                                    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                        color: Colors.redAccent,
                                                        fontSize: 15 *
                                                            unitHeightValue),
                                                  ),
                                                ),
                                                TextButton(
                                                  // textColor: Colors.black,
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
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      //Widgets.ShowLoaderDialog(context, "Logout","");
                                      /*Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
              (Route<dynamic> route) => false);*/
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout_outlined,
                                          color: HexColor(
                                              Globalvireables.basecolor),
                                          size: 35 * unitHeightValue,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          LanguageProvider.Llanguage('Logout'),
                                          style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                              fontSize: 17.5 * unitHeightValue,
                                              color: HexColor(
                                                  Globalvireables.black),
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: 40,
                                ),
                                Align(
                                    alignment: LanguageProvider.Align(),
                                    child: Text(
                                      LanguageProvider.Llanguage("Feedback"),
                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                          fontSize: 17.5 * unitHeightValue,
                                          color:
                                              HexColor(Globalvireables.black),
                                          fontWeight: FontWeight.w400),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.report_gmailerrorred,
                                      color:
                                          HexColor(Globalvireables.basecolor),
                                      size: 35 * unitHeightValue,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      LanguageProvider.Llanguage("callus"),
                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                          fontSize: 17.5 * unitHeightValue,
                                          color:
                                              HexColor(Globalvireables.black),
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Divider(thickness: 1.0, color: Colors.black),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(children: [
                                  Icon(
                                    Icons.message_outlined,
                                    color: HexColor(Globalvireables.basecolor),
                                    size: 35 * unitHeightValue,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    LanguageProvider.Llanguage("Sendfeedback"),
                                    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                        fontSize: 17.5 * unitHeightValue,
                                        color: HexColor(Globalvireables.grey),
                                        fontWeight: FontWeight.w500),
                                  )
                                ])
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              textDirection: LanguageProvider.getDirection(),
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
}
