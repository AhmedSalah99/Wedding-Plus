import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class OrabyDetails extends StatefulWidget {
  final name_d;
  final space_d;
  final location_d;
  final price_d;
  final priceDetalis_d;
  final capacity_d;
  final image_d;
  final phone_d;
  final hell_sec_d;
  OrabyDetails(
      {this.name_d,
      this.space_d,
      this.price_d,
      this.priceDetalis_d,
      this.location_d,
      this.capacity_d,
      this.hell_sec_d,
      this.phone_d,
      this.image_d});

  @override
  _State createState() => _State();
}

class _State extends State<OrabyDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent[400],
          title: Text(
            " Details",
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              child: GridTile(
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 6.0,
                  dotIncreasedColor: Color(0xFFFF335C),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  borderRadius: true,
                  radius: Radius.circular(5),
                  images: [
                    AssetImage('images/Hells/almardian/mardian.jpg'),
                    AssetImage('images/Hells/almasuh/masauh.jpg'),
                    AssetImage('images/Hells/Fayrouz/Fayrouz.jpg'),
                    AssetImage('images/Hells/Festival/festival.jpg'),
                    AssetImage('images/Hells/janhaleazizuh/jana.jpg'),
                    AssetImage('images/pexels-studio-negarin-2613461.jpg'),
                  ],
                ),
                footer: Container(
                  height: 20,
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: Text(
                    widget.name_d,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(.5)),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "like",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.thumb_up,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                  ),
                ),
                Expanded(
                    child: Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "dislik",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.thumb_down,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                )),
                Expanded(
                    child: Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "comments",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                )),
              ],
            ),
            Divider(color: Colors.grey.withOpacity(.5)),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "المواصفات :",
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.pinkAccent.withOpacity(0.6),
              child: Row(
                children: <Widget>[
                  Text(
                    "اسم المكان: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                      child: Text(
                    widget.name_d,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Text(
                    "المساحه : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                      child: Text(
                    widget.space_d,
                    style: TextStyle(fontSize: 18, color: Colors.redAccent),
                  ))
                ],
              ),
            ),
            Container(
              height: 70,
              padding: EdgeInsets.all(10),
              color: Colors.pinkAccent.withOpacity(0.6),
              child: Row(
                children: <Widget>[
                  Text(
                    "الموقع  : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                    child: Text(
                      widget.location_d,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Cairo'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Text(
                    " الاسعار  : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                      child: Text(
                    widget.priceDetalis_d,
                    style: TextStyle(fontSize: 12, color: Colors.redAccent),
                  ))
                ],
              ),
            ),
            /* Container(
              padding: EdgeInsets.all(10),
              color: Colors.redAccent.withOpacity(0.6),
              child: Row(
                children: <Widget>[
                  Text(
                    "  المتسع : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                      child: Text(
                    widget.capacity_d,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ))
                ],
              ),
            ),*/
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.pinkAccent.withOpacity(0.6),
              child: Row(
                children: <Widget>[
                  Text(
                    "  رقم لتليفون  : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                      child: Text(
                    widget.phone_d,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ))
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30, right: 10),
                child: Center(
                  child: RaisedButton(
                    child: Text("Reservation"),
                    color: Colors.redAccent,
                    onPressed: () {},
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
