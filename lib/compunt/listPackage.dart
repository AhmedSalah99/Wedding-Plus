import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/pages/Orabypage.dart';

class listPackage extends StatelessWidget {
  final name;
  final space;
  final location;
  final price;
  final priceDetalis;
  final capacity;
  final nave;
  final image;
  final phone;
  final hell_sec;

  listPackage(
      {this.name,
      this.space,
      this.price,
      this.priceDetalis,
      this.location,
      this.nave,
      this.capacity,
      this.phone,
      this.hell_sec,
      this.image});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 130,
        width: 130,
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                    color: Colors.white.withOpacity(.4),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Row(
                                children: <Widget>[
                                  Text(
                                    " Space :",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    space,
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              )),
                              Text(
                                "Price :",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                price,
                                style: TextStyle(color: Colors.redAccent),
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 2, left: 2),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Location:${location} ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Cairo',
                                      fontSize: 12.8),
                                ),
                              ],
                            ))
                      ],
                    )),
              ),
              Expanded(
                flex: 3,
                child: Image.asset(
                  'images/Hells/Borivage/Borivage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return OrabyDetails(
            name_d: name,
            space_d: space,
            price_d: price,
            priceDetalis_d: priceDetalis,
            location_d: location,
            hell_sec_d: hell_sec,
            capacity_d: capacity,
            phone_d: phone,
            image_d: image,
          );
        }));
      },
    );
  }
}
