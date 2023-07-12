
import 'dart:io';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';


class Globalvireables {

  static String basecolor="#3268BA";
  static String secondcolor="#B6D0E2";
  static String white="#F5F5F5";
  static String black="#191919";
  static String black2="#333334";
  static String grey="#707070";
  static String secondcolor2="#d0e8ee";
  static String connectIP="10.0.1.120:9999";

  static String loginAPI="http://"+Globalvireables.connectIP+"/api/auth/Mobilelogin";
  static String DoctorsURL="http://"+Globalvireables.connectIP+"/api/Doctor/GetDoctors";
  static String InsuranceURL="http://"+Globalvireables.connectIP+"/api/PatientInsurances/GetPatientInsurances";
  static String VitalSignsURL="http://"+Globalvireables.connectIP+"/api/VitalSigns/GetVitalSigns";
  static String InvoicesURL="http://"+Globalvireables.connectIP+"/api/InvoiceAll/GetInvoiceAll";
  static String VisitsApi="http://"+Globalvireables.connectIP+"/api/PatientVisits/GetVisits";
  static String ExamnationURL="http://"+Globalvireables.connectIP+"/api/ExamnationController/GetExamnationController";
  static String XrayListURL="http://"+Globalvireables.connectIP+"/api/xray/Getxray";
  static String AppoimentsURL="http://"+Globalvireables.connectIP+"/api/Appoiments/GetAppoiments";
  static String HospitalInfoURL="http://"+Globalvireables.connectIP+"/api/HospitalINF/GetHospitalINF";
   static String ExamnatioGroupURL="http://"+Globalvireables.connectIP+"/api/ExamnationGroupController/GetExamnationGroupController";
  static String profileURL="http://"+Globalvireables.connectIP+"/api/Persiomdata/GetPersiomdata";
  static String prescptionURL="http://"+Globalvireables.connectIP+"/api/prespction/GetPrespction";
  static String ChangePassURL="http://"+Globalvireables.connectIP+"/api/PasswordCangeController/PasswordCange";
  static String DrugInHOSPITALURL="http://"+Globalvireables.connectIP+"/api/prespctionHoo/GetprespctionHoo";
  static String TermsACCSEPT="http://"+Globalvireables.connectIP+"/api/Terms/GetTermsAP";

  static String ChangeTermsACCSEPTURL="http://"+Globalvireables.connectIP+"/api/TermsAController/TermsACange";
  static String UpdateInformationURL="http://"+Globalvireables.connectIP+"/api/UpdateinfoControler/UpdateInfo";


  static String them1="#229954";
  static String them2="#2E86C1";
  static String them3="#8E44AD";
  static String them4="#2E4053";
  static String them5="#D35400";




}