import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  var arr = [
    {
      "title": "Search for your car from here",
      "info": "",
      "image": "images/catagory/35429538.jpg"
    },
    {
      "title": "Look for the makeup here",
      "info": "",
      "image": "images/catagory/32581964.jpg"
    },
    {
      "title": "Look for the session here",
      "info": "",
      "image": "images/catagory/26389397.jpg"
    }
  ];
  @override
  Widget build(BuildContext context) {
    double myhight = MediaQuery.of(context).size.height / 5;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: myhight * 4,
              child: PageIndicatorContainer(
                shape: IndicatorShape.circle(),
                length: arr.length,
                align: IndicatorAlign.bottom,
                indicatorColor: Colors.white,
                indicatorSelectorColor: Colors.redAccent,
                child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: arr.length,
                    itemBuilder: (BuildContext context, i) {
                      return SingleTips(
                          title: arr[i]["title"],
                          info: arr[i]["info"],
                          image: arr[i]["image"]);
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              height: myhight,
              child: ListView(
                children: <Widget>[
                  Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("login");
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          )),
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

class SingleTips extends StatelessWidget {
  final String title;
  final String info;
  final String image;
  SingleTips({this.title, this.info, this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        )),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Text(
            info,
            style: TextStyle(
                color: Colors.grey, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
