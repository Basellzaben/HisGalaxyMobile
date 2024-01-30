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
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../Models/xRAYM.dart';
import '../provider/HomeProvider.dart';
import '../provider/ImgaeXrayProvider.dart';
import '../provider/LoginProvider.dart';
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

  late WebViewController controlimg;

  //controller
  @override
  void dispose() {
    super.dispose();
  }

  int selectedIndex = 1;

  final _key = UniqueKey();
  final _keyimg = UniqueKey();

  @override
  Widget build(BuildContext context) {

    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);


    var ImgaeXrayProvide =
        Provider.of<ImgaeXrayProvider>(context, listen: false);
    var ThemP = Provider.of<Them>(context, listen: false);

    String link, linkimg;
    // link=ImgaeXrayProvide.PLACEHOLDER.toString().trim();
    // linkimg=ImgaeXrayProvide.PLACEHOLDER_HTML.toString().trim();
    linkimg =
        'https://myvue.ishjo.com/portal/?user_name=view&password=view123&accession_number=150278'; //ImgaeXrayProvide.PLACEHOLDER_HTML.toString().trim();

    /* controller = WebViewController()..loadRequest(Uri.parse(
        link.trim()
    ));*/
    /*controller
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
*/
    controlimg = WebViewController()..loadRequest(Uri.parse(linkimg.trim()));
    controlimg
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    return Stack(children: <Widget>[
      Image.asset(
        "assets/background.png",
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
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [


                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor(ThemP.getcolor())),
                              color: Colors.white54,

                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      height: 100,
                                      child: Image(
                                          image: new AssetImage(
                                              "assets/newlogo.png")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "تقرير صورة الاشعة",
                                        style: ArabicTextStyle(
                                            arabicFont: ArabicFont.tajawal,
                                            fontWeight: FontWeight.w400,
                                            color: HexColor(
                                                Globalvireables.black),
                                            fontSize: 16 * unitHeightValue),
                                      ),
                                    ),

                                    Column(
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                          child: Row(
                                            children: [
                                              Text( 'رقم المريض : '
                                                  ,
                                                  style: ArabicTextStyle(
                                                      arabicFont:
                                                      ArabicFont.tajawal,
                                                      color: HexColor(
                                                          Globalvireables.black),
                                                      fontSize:
                                                      12 * unitHeightValue)),
                                              Text(
                                                Loginprovider.getuserId(),
                                                style: ArabicTextStyle(
                                                    arabicFont:
                                                    ArabicFont.tajawal,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: HexColor(
                                                        Globalvireables
                                                            .black),
                                                    fontSize: 14 *
                                                        unitHeightValue),
                                              )
                                            ],
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                          child: Row(
                                            children: [

                                              Text('اسم المريض : '
                                                  ,
                                                  style: ArabicTextStyle(
                                                      arabicFont:
                                                      ArabicFont.tajawal,
                                                      color: HexColor(
                                                          Globalvireables.black),
                                                      fontSize:
                                                      12 * unitHeightValue)),
                                              Text(
                                                Loginprovider.nameA,
                                                style: ArabicTextStyle(
                                                    arabicFont:
                                                    ArabicFont.tajawal,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: HexColor(
                                                        Globalvireables
                                                            .black),
                                                    fontSize: 14 *
                                                        unitHeightValue),
                                              )
                                            ],
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Divider(
                                              thickness: 1.0,
                                              color: Colors.black),
                                        ),

                                        SizedBox(height: 20,),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            textAlign: TextAlign
                                                .left,
                                            ImgaeXrayProvide.PLACEHOLDER_HTML.toString().replaceAll(':', "")
                                                .replaceAll('-', '').replaceAll('.', '').replaceAll('Procedure', ' : Procedure')
                                                .replaceAll('Technique', ' : Technique')
                                                .replaceAll('Findings', ' : Findings')
                                                .replaceAll('Impression', ' : Impression'),

                                            style: ArabicTextStyle(
                                                arabicFont:
                                                ArabicFont.tajawal,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: HexColor(
                                                    Globalvireables
                                                        .black),
                                                fontSize: 14 *
                                                    unitHeightValue),
                                          ),
                                        )


                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3,
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
                                Share.share(
                                    subject: 'Report',
                                    ImgaeXrayProvide.PLACEHOLDER_HTML
                                        .trim());
//print("xx   "+ImgaeXrayProvide.PLACEHOLDER_HTML.trim());
                                //                  openUrl(ImgaeXrayProvide.PLACEHOLDER_HTML.trim());
                              },
                            ),
                          ),


                          ////
SizedBox(height: 100,),


                          Text(
                            LanguageProvider.Llanguage('Rayi'),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: HexColor(Globalvireables.black),
                                fontSize: 18 * unitHeightValue),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.width,
                              width: MediaQuery.of(context).size.width,
                              child: WebViewWidget(
                                // initialUrl: Uri.encodeFull(EnterUrlHere),
                                controller: controlimg, key: _keyimg,
                              )),


                          Text(
                           'قد لا يستطيع جهازك عرض الصوره ، يمكنك فتح الرابط من خلال جهاز كمبيوتر',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 10 * unitHeightValue),
                          ),

                          Center(
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 3,
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
                                      Share.share(
                                          subject: 'Irbid Hospital ',
                                          ImgaeXrayProvide.PLACEHOLDER_HTML
                                              .trim());
//print("xx   "+ImgaeXrayProvide.PLACEHOLDER_HTML.trim());
                                      //                  openUrl(ImgaeXrayProvide.PLACEHOLDER_HTML.trim());
                                    },
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 3,
                                  margin: EdgeInsets.only(top: 10, bottom: 5),
                                  color: HexColor(Globalvireables.white),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: HexColor(ThemP.getcolor()),
                                    ),
                                    child: Text(
                                      LanguageProvider.Llanguage('openbrowser'),
                                      textAlign: TextAlign.center,
                                      style: ArabicTextStyle(
                                          arabicFont: ArabicFont.tajawal,
                                          color: HexColor(Globalvireables.white),
                                          fontSize: 12 * unitHeightValue),
                                    ),
                                    onPressed: () async {
                                      openUrl(
                                          'https://myvue.ishjo.com/portal/?user_name=view&password=view123&accession_number=150278');

                                      //  linkimg='https://myvue.ishjo.com/portal/?user_name=view&password=view123&accession_number=150278&key_images=true';//ImgaeXrayProvide.PLACEHOLDER_HTML.toString().trim();
                                    },
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    ]);
  }

  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $_url');
    }
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
