import 'package:flutter/material.dart';
import 'package:newproject/pages/Cars.dart';
import 'package:newproject/pages/Hall.dart';
import 'package:newproject/pages/Home.dart';
import 'package:newproject/pages/Orabypage.dart';
import 'package:newproject/pages/Photosetion.dart';
import 'package:newproject/pages/Section.dart';
import 'package:newproject/pages/choosecountry.dart';
import 'package:newproject/pages/login.dart';
import 'package:newproject/pages/makeup.dart';

import 'compunt/maps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wedding Plus",
      home: Home(),
      routes: {
        'categores': (context) {
          return Section();
        },
        'home': (context) {
          return Home();
        },
        'Halls': (context) {
          return Halls();
        },
        'Photosetion': (context) {
          return Photosetion();
        },
        'Cars': (context) {
          return Cars();
        },
        'Makeup': (context) {
          return Makeup();
        },
        'OrabyDetails': (context) {
          return OrabyDetails();
        },
        'login': (context) {
          return Login();
        },
        'maps': (context) {
          return Maps();
        },
      },
    );
  }
}
