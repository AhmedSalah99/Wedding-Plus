import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:newproject/compunt/Booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakeupDetails extends StatefulWidget {
  final name_d;
  final space_d;
  final location_d;
  final price_d;
  final priceDetalis_d;
  final capacity_d;
  final image_d;
  final phone_d;
  final image_post_d;

  MakeupDetails({
    this.name_d,
    this.space_d,
    this.price_d,
    this.priceDetalis_d,
    this.location_d,
    this.capacity_d,
    this.phone_d,
    this.image_d,
    this.image_post_d,
  });

  @override
  _State createState() => _State();
}

class _State extends State<MakeupDetails> {
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
              padding: EdgeInsets.only(top: 10),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Booking(
                                  price: widget.price_d,
                                  named: widget.name_d,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Reservation",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
