import 'package:flutter/material.dart';
import 'package:newproject/compunt/Tips.dart';

import 'contact.dart';

class Getstart extends StatefulWidget {
  @override
  _GetstartState createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
  @override
  Widget build(BuildContext context) {
    double myhight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: myhight * 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("images/catagory/32705782.jpg"),
                      fit: BoxFit.contain)),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              height: myhight,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: ListView(
                children: <Widget>[
                  Column(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 120),
                        child: Text(
                          "Wedding plus",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "This application is for booking halls, courses and photos",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 150, top: 30),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Tips();
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Get Start",
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
