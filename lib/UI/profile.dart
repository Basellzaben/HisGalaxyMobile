import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';

import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';

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
    var colors = [HexColor((Globalvireables.secondcolor)), HexColor((Globalvireables.basecolor))];
    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [ 0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);

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
            title: Widgets.Appbar(context,LanguageProvider.Llanguage('profile') , unitHeightValue,LanguageProvider.langg,LanguageProvider.getDirection()),
         ),
          backgroundColor: HexColor(Globalvireables.basecolor),
          // backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor((Globalvireables.secondcolor)), HexColor((Globalvireables.basecolor))
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
                     children: [],
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
}
