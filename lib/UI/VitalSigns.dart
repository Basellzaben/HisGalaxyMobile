import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:arabic_font/arabic_font.dart';
import '../Models/VitalSignsM.dart';
import '../Models/VitalSignsM.dart';
import '../provider/HomeProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class VitalSigns extends StatefulWidget {
  @override
  State<VitalSigns> createState() => _VitalSignsState();
}

class _VitalSignsState extends State<VitalSigns> {
  @override
  void initState() {
    setsearch(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selectedIndex = 1;

  final List<Widget> nav = [
    Settings(),
    Home(),
    profile(),
  ];
  TextEditingController dateinput = TextEditingController();
  setsearch(BuildContext context){

    var homeP = Provider.of<HomeProvider>(context, listen: false);

    dateinput.text=homeP.getVisitDate();
  }
  @override
  Widget build(BuildContext context) {
    var ThemP = Provider.of<Them>(context, listen: false);

    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [0.0, 1.00];
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
            backgroundColor: HexColor(ThemP.getcolor()),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: LanguageProvider.Llanguage('settings'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: LanguageProvider.Llanguage('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: LanguageProvider.Llanguage('profile')),
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
          appBar: AppBar( backgroundColor: Colors.white,
            bottomOpacity: 800.0,
            elevation: 4.0,
            title: Widgets.Appbar(
                context,
                LanguageProvider.Llanguage("Vitalsigns"),

                unitHeightValue,
                LanguageProvider.langg,
                LanguageProvider.getDirection()),
          ),
          backgroundColor: HexColor(ThemP.getcolor()),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.15,
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
                  height: MediaQuery.of(context).size.height / 1.24,
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
                          child: TextField(
                            controller: dateinput, //editing controller of this TextField
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.date_range,color: HexColor(
                                  ThemP.getcolor()),size: 27*unitHeightValue,),
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      dateinput.text=LanguageProvider.Llanguage('SearchbyDate');
                                    });
                                   },
                                  child: Icon(color: Colors.redAccent,dateinput.text.isEmpty||dateinput.text.toString()==LanguageProvider.Llanguage('SearchbyDate')
                                      ? null
                                      : Icons.cancel)),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor(
                                          ThemP.getcolor()),
                                      width: 2.0),
                                  borderRadius:
                                  BorderRadius.circular(10.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor(
                                          ThemP.getcolor()),
                                      width: 2.0),
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
                                  "SearchbyDate"),
                            ),
                            readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                              );

                              if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16

                                setState(() {
                                  dateinput.text = formattedDate; //set output date to TextField value.
                                });
                              }else{
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 1.24,
                          child: FutureBuilder(
                            future: getVitalSigns(context, "277", dateinput.text.isEmpty||dateinput.text.toString()==LanguageProvider.Llanguage('SearchbyDate')?"202":dateinput.text),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<VitalSignsM>> snapshot) {
                              if (snapshot.hasData) {
                                List<VitalSignsM>? VitalSigns = snapshot.data;
                                return VitalSigns!.isNotEmpty? ListView(
                                  children: VitalSigns!
                                      .map((VitalSignsM VitalSignsM) =>
                                          SizedBox(
                                              child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        retturndatenewformat(
                                                      VitalSignsM.datee
                                                          .toString())+ " - " +VitalSignsM.vITALSIGNSAllModelS![0].reaDTIME.toString()
                                                      ,
                                                      style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                        color: HexColor(ThemP.getcolor()),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                              ),


                                                 Card(
                                                   shape: RoundedRectangleBorder(
                                                   borderRadius: BorderRadius.circular(30),
                                                   side: BorderSide(
                                                     width: MediaQuery.of(context)
                                                         .size
                                                         .height,
                                                     //  color: Colors.black12.withOpacity(0.1),
                                                   ),
                                                 ),
                                                   child: SizedBox(
                                                     child: GridView.builder(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 0.0,
                                                        mainAxisSpacing: 0.0,
                                                      ),
                                                      itemCount: VitalSignsM.vITALSIGNSAllModelS!.asMap().length,
                                                      itemBuilder: (context, index) {
                                                        return Container(
                                                            color: Colors.transparent,
                                                            child: Column(
                                                              children: [
                                                                CircularPercentIndicator(
                                                                  radius: 50.0 *
                                                                      unitHeightValue,
                                                                  lineWidth: 10.0,
                                                                  percent: 0.50,
                                                                  progressColor:
                                                                      present(VitalSignsM
                                                                          .vITALSIGNSAllModelS![
                                                                      index]
                                                                          .desCA
                                                                          .toString()
                                                                          ,VitalSignsM
                                                                          .vITALSIGNSAllModelS![
                                                                      index]
                                                                          .vitaLSIGNREAD
                                                                          .toString()),
                                                                  center: new Text(
                                                                    VitalSignsM
                                                                        .vITALSIGNSAllModelS![
                                                                    index]
                                                                        .vitaLSIGNREAD
                                                                        .toString(),
                                                                    style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        fontSize: 16 *
                                                                            unitHeightValue),
                                                                  ),

                                                                ),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  VitalSignsM
                                                                      .vITALSIGNSAllModelS![
                                                                  index]
                                                                      .desCA
                                                                      .toString(),
                                                                  style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                      fontSize: 16 *
                                                                          unitHeightValue),
                                                                )
                                                              ],
                                                            ),
                                                        );
                                                      },
                                                ),
                                                   ),
                                                 ),

                                              /* SizedBox(
                                                  child: GridView.builder(
                                                    physics: ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: snapshot.data!.length,
                                                    itemBuilder: (BuildContext context, int index) =>
                                                            Padding(
                                                      padding: EdgeInsets.all(2),
                                                      child: SizedBox(
                                                        child: Column(
                                                          children: [
                                                            CircularPercentIndicator(
                                                              radius: 50.0 *
                                                                  unitHeightValue,
                                                              lineWidth: 15.0,
                                                              percent: 0.50,
                                                              center: new Text(
                                                                VitalSignsM
                                                                    .vITALSIGNSAllModelS![
                                                                        index]
                                                                    .vitaLSIGNREAD
                                                                    .toString(),
                                                                style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize: 16 *
                                                                        unitHeightValue),
                                                              ),
                                                              progressColor: HexColor(
                                                                  Globalvireables
                                                                      .basecolor),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              VitalSignsM
                                                                  .vITALSIGNSAllModelS![
                                                                      index]
                                                                  .desCA
                                                                  .toString(),
                                                              style: ArabicTextStyle(
            arabicFont: ArabicFont.tajawal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 16 *
                                                                      unitHeightValue),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 5,
                                                    crossAxisSpacing: 5.0,
                                                    mainAxisSpacing: 5.0,
                                                  ),
                                                  ),
                                                ),*/

                                            ],
                                          )))
                                      .toList(),
                                ):Image.asset(
                              "assets/null.png",
                              height: 100,
                              width: 100,
                              );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
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

  Future<List<VitalSignsM>> getVitalSigns(



      BuildContext context, String patientNo, String searchDate) async {
    print(" dateinput.text :"+ dateinput.text);

    Uri postsURL = Uri.parse(Globalvireables.VitalSignsURL);
    try {
      var map = new Map<String, dynamic>();
      map['patientNo'] = patientNo;
      map['searchDate'] = searchDate;
      http.Response res = await http.post(
        postsURL,
        body: map,
      );

      if (res.statusCode == 200) {
        print("VitalSigns" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<VitalSignsM> VitalSignss = body
            .map(
              (dynamic item) => VitalSignsM.fromJson(item),
            )
            .toList();

        return VitalSignss;
      } else {
        throw "Unable to retrieve VitalSigns." + e.toString();
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('بيانات الأطباء'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve VitalSigns." + e.toString();
  }

  _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nav[index]),
      );
    });
  }
  Color present(String name,String result){
    Color C;
    C=Colors.green;

    if(name=="ضغط"){
      var parts = result.split('/');
      String on = parts[0].trim();
      String of = parts[1].trim();

      if(double.parse(on)>80){
        C=Colors.redAccent;
      }
      if(double.parse(of)>120){
        C=Colors.redAccent;
      }
      if(double.parse(on)<80){
        C=Colors.redAccent;
      }
      if(double.parse(of)<120){
        C=Colors.redAccent;
      }}
    else if(name=="حرارة"){
if(double.parse(result)>38.0){
  C=Colors.redAccent;
}
    }else if(name=="تنفس"){
      if(double.parse(result)>16.0 || double.parse(result)<12){
        C=Colors.redAccent;
      }
    }else if(name=="النبض"){
      if(double.parse(result)>100.0 || double.parse(result)<60.0){
        C=Colors.redAccent;
      }
    }else if(name=="معدل الاكسجين"){
      if(double.parse(result)>100.0 || double.parse(result)<95.0){
        C=Colors.redAccent;
      }
    }else if(name=="الوزن"){
      C=Colors.green;

  }else {
      C=Colors.green;

    }


    return C;
  }
  String retturndatenewformat(String DATE){

    String newMonth="";
    var parts = DATE.substring(0,10).split('-');
    String y = parts[0].trim();
    int m = int.parse(parts[1].trim());
    String d = parts[2].trim();

    if(m==1){
      newMonth='January';
    }else  if(m==2){
      newMonth='Februay';

    }else  if(m==3){
      newMonth='March';

    }else  if(m==4){
      newMonth='April';

    }else  if(m==5){
      newMonth='May';

    }else  if(m==6){
      newMonth='June';

    }else  if(m==7){
      newMonth='July';

    }else  if(m==8){
      newMonth='August';

    }else  if(m==9){
      newMonth='September';

    }else  if(m==10){
      newMonth='October';

    }else  if(m==11){
      newMonth='November';

    }else  if(m==12){
      newMonth='December';

    }

return newMonth+" "+ d+","+y ;

  }

}


