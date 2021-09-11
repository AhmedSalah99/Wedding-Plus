import 'package:flutter/material.dart';
import 'package:newproject/admin/CarCat.dart';
import 'package:newproject/admin/Makeupecat.dart';
import 'package:newproject/admin/category.dart';
import 'package:newproject/admin/draweradmin.dart';
import 'package:newproject/admin/setioncat.dart';
import 'package:newproject/compunt/drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      drawer: Mydraweradmin(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.redAccent, Colors.cyan[200], Colors.cyan[400]]),
        ),
        child: GridView(
          padding: EdgeInsets.only(top: 50),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            Container(
              child: InkWell(
                child: Card(
                  color: Colors.white.withOpacity(.3),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Icon(
                          Icons.account_balance,
                          size: 80,
                        ),
                      ),
                      Text(
                        "Halls",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryDetails()));
                },
              ),
            ),
            InkWell(
              child: Card(
                color: Colors.white.withOpacity(.3),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Icon(
                        Icons.camera,
                        size: 80,
                      ),
                    ),
                    Text(
                      "PhotoSetion",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetionCat()));
              },
            ),
            InkWell(
              child: Card(
                color: Colors.white.withOpacity(.3),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Icon(
                        Icons.car_repair,
                        size: 80,
                      ),
                    ),
                    Text(
                      "Cars",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CatCar()));
              },
            ),
            InkWell(
              child: Card(
                color: Colors.white.withOpacity(.3),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Icon(
                        Icons.brush_outlined,
                        size: 80,
                      ),
                    ),
                    Text(
                      "MakeUp",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MakupeCat()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
