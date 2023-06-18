import 'dart:convert';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../Models/xRAYM.dart';
import '../provider/HomeProvider.dart';
import '../provider/ImgaeXrayProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:arabic_font/arabic_font.dart';
class XrayImage extends StatefulWidget {
  @override
  State<XrayImage> createState() => _XrayImageState();
}

class _XrayImageState extends State<XrayImage> {
  @override
  void initState() {


    super.initState();
  }
  late  WebViewController controller;
  @override
  void dispose() {
    super.dispose();
  }

  int selectedIndex = 1;


  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    var ImgaeXrayProvide = Provider.of<ImgaeXrayProvider>(context, listen: false);
    var ThemP = Provider.of<Them>(context, listen: false);

    controller = WebViewController()..loadRequest(Uri.parse(
        "https://vuemotion.ishjo.com/portal/?user_name=view&password=view123&accession_number="+ImgaeXrayProvide.passno+"&key_images=true"

    ));
    controller
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);


    double unitHeightValue = MediaQuery
        .of(context)
        .size
        .height * 0.00122;
    var stops = [0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);

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

    appBar: AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 800.0,
      elevation: 4.0,
    title: Widgets.Appbar(
    context,
    LanguageProvider.Llanguage('Ray'),
    unitHeightValue,
    LanguageProvider.langg,
    LanguageProvider.getDirection()),
    ),
    //backgroundColor: HexColor(ThemP.getcolor()),
    // backgroundColor: Colors.transparent,
    body: Directionality(
    textDirection: LanguageProvider.getDirection(),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 1.15,

    child: SafeArea(
    child: Container(
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 1.2,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/background.png"),
    fit: BoxFit.cover,
    ),
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

        SizedBox(
          height: MediaQuery.of(context).size.height/1.3,
          width: MediaQuery.of(context).size.width,
          child: WebViewWidget(controller: controller,key: _key,)
      ),
        Align(
    alignment: Alignment.bottomCenter,
    child: Container(
    height: 40,
    width:
    MediaQuery.of(context).size.width / 3,
    margin: EdgeInsets.only(top: 10, bottom: 5),
    color: HexColor(Globalvireables.white),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: HexColor(ThemP.getcolor()),
    ),
    child: Text(
    LanguageProvider.Llanguage('Share'),
    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
    color:
    HexColor(Globalvireables.white),
    fontSize: 14 * unitHeightValue),
    ),
    onPressed: () async {


      Share.share(subject:'El esraa Hospital - '+ImgaeXrayProvide.date,  'https://vuemotion.ishjo.com/portal/?user_name=view&password=view123&accession_number='+ImgaeXrayProvide.passno+'&key_images=true');



    },
    ),
    ),
    )

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


  String retturndatenewformat(String DATE) {
    String newMonth = "";
    var parts = DATE.substring(0, 10).split('-');
    String y = parts[0].trim();
    int m = int.parse(parts[1].trim());
    String d = parts[2].trim();

    if (m == 1) {
      newMonth = 'January';
    } else if (m == 2) {
      newMonth = 'Februay';
    } else if (m == 3) {
      newMonth = 'March';
    } else if (m == 4) {
      newMonth = 'April';
    } else if (m == 5) {
      newMonth = 'May';
    } else if (m == 6) {
      newMonth = 'June';
    } else if (m == 7) {
      newMonth = 'July';
    } else if (m == 8) {
      newMonth = 'August';
    } else if (m == 9) {
      newMonth = 'September';
    } else if (m == 10) {
      newMonth = 'October';
    } else if (m == 11) {
      newMonth = 'November';
    } else if (m == 12) {
      newMonth = 'December';
    }

    return newMonth + " " + d + "," + y;
  }
}
