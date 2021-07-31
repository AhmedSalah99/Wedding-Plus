import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newproject/compunt/drawer.dart';
import 'package:newproject/compunt/listCars.dart';
import 'package:newproject/compunt/listPackage.dart';
import 'package:http/http.dart' as http;

class Cars extends StatefulWidget {
  @override
  _CatagoresState createState() => _CatagoresState();
}

class _CatagoresState extends State<Cars> {
  Future getData() async {
    var url = "http://192.168.145.252/wedding/car.php";

    var response = await http.post(url);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[400],
        title: Text("car"),
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
        child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListCars(
                      name: snapshot.data[i]['name'],
                      space: snapshot.data[i]['space'],
                      price: snapshot.data[i]['price'],
                      priceDetalis: snapshot.data[i]['priceDetalis'],
                      location: snapshot.data[i]['location'],
                      phone: snapshot.data[i]['phone'],
                      capacity: snapshot.data[i]['capacity'],
                      image_post: snapshot.data[i]['image_post'],
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
