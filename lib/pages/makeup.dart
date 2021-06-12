import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newproject/compunt/drawer.dart';
import 'package:newproject/compunt/listPackage.dart';

class Makeup extends StatefulWidget {
  @override
  _CatagoresState createState() => _CatagoresState();
}

class _CatagoresState extends State<Makeup> {
  Future getData() async {
    var url = "http://192.168.1.6/wedding/index.php";
    var data = {"sec": "1"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[400],
        title: Text("MakeUp"),
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
                    return listPackage(
                      name: snapshot.data[i]['name'],
                      space: snapshot.data[i]['space'],
                      price: snapshot.data[i]['price'],
                      location: snapshot.data[i]['location'],
                      phone: snapshot.data[i]['phone'],
                      capacity: snapshot.data[i]['capacity'],
                      hell_sec: snapshot.data[i]['hell_sec'],
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
