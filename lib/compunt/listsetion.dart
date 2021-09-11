import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/pages/OrabyDetails.dart';
import 'package:newproject/pages/setioDetails.dart';

class ListSetion extends StatelessWidget {
  final name;
  final space;
  final location;
  final price;
  final priceDetalis;
  final capacity;
  final nave;
  final image;
  final phone;
  final image_post;
  final id;

  ListSetion({
    this.name,
    this.space,
    this.price,
    this.priceDetalis,
    this.location,
    this.nave,
    this.capacity,
    this.phone,
    this.image_post,
    this.image,
    this.id,
  });
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
                child: Image.network(
                  "http://192.168.145.252/wedding/Addphotosetion/upload/$image_post",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SetionDetails(
            name_d: name,
            space_d: space,
            price_d: price,
            priceDetalis_d: priceDetalis,
            location_d: location,
            capacity_d: capacity,
            phone_d: phone,
          );
        }));
      },
    );
  }
}
