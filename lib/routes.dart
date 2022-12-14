import 'package:app_find_job/main_app.dart';
import 'package:app_find_job/main_page.dart';
import 'package:app_find_job/screens/ForgotPassword/forgotpassword.dart';
import 'package:app_find_job/screens/Recruiter/Recruiter.dart';
import 'package:app_find_job/screens/home/home.dart';
import 'package:app_find_job/screens/intro/intro.dart';
import 'package:app_find_job/screens/login/login.dart';
import 'package:app_find_job/screens/profile/profile.dart';
import 'package:app_find_job/screens/savejob_applyjob/savejob_applyjob.dart';
import 'package:app_find_job/screens/splash/splash.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  IntroPage.routeName: (context) => const IntroPage(),
  MainApp.routeName: (context) => MainApp(),
  HomePage.routeName: (context) => HomePage(),
  SavejobApplyJobPage.routeName: (context) => SavejobApplyJobPage(),
  RecruiterPage.routeName: (context) => const RecruiterPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  //LoginPage.routeName: (context) => LoginPage(),
  MainPage.routeName: (context) => MainPage(),
  ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
};
