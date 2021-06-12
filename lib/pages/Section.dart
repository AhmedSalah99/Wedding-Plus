import 'package:flutter/material.dart';
import 'package:newproject/compunt/drawer.dart';

class Section extends StatefulWidget {
  @override
  _CatagoresState createState() => _CatagoresState();
}

class _CatagoresState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[400],
        title: Text("Section"),
        centerTitle: true,
      ),
      drawer: Mydrawer(),
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
                  Navigator.of(context).pushNamed("Halls");
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
                Navigator.of(context).pushNamed("Photosetion");
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
                Navigator.of(context).pushNamed("Cars");
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
                Navigator.of(context).pushNamed("Makeup");
              },
            ),
          ],
        ),
      ),
    );
  }
}
