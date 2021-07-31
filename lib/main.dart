import 'package:flutter/material.dart';
import 'package:newproject/admin/Dashboard.dart';
import 'package:newproject/admin/category.dart';
import 'package:newproject/compunt/Getstart.dart';
import 'package:newproject/compunt/tips.dart';
import 'package:newproject/pages/Cars.dart';
import 'package:newproject/pages/Hall.dart';
import 'package:newproject/pages/Home.dart';
import 'package:newproject/pages/OrabyDetails.dart';
import 'package:newproject/pages/Photosetion.dart';
import 'package:newproject/pages/Section.dart';
import 'package:newproject/pages/choosecountry.dart';
import 'package:newproject/pages/login.dart';
import 'package:newproject/pages/makeup.dart';
import 'package:splashscreen/splashscreen.dart';
import 'compunt/add.dart';
import 'compunt/maps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wedding Plus",
      home: Splash(),
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
          return Makup();
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
        'tips': (context) {
          return Tips();
        },
        'add': (context) {
          return Addcat();
        },
        'dash': (context) {
          return Dashboard();
        },
        'Addcat': (context) {
          return CategoryDetails();
        },
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new Getstart(),
      title: new Text(
        ' Welcome to Wedding Plus',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      image: new Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Wedding"),
      loaderColor: Colors.redAccent,
    );
  }
}
