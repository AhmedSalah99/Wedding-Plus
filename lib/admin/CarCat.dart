import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newproject/admin/AddCars.dart';
import 'package:newproject/admin/addeditcatagroy.dart';
import 'package:newproject/admin/draweradmin.dart';
import 'package:newproject/compunt/drawer.dart';
import 'package:http/http.dart' as http;

class CatCar extends StatefulWidget {
  @override
  _CatCarState createState() => _CatCarState();
}

class _CatCarState extends State<CatCar> {
  List catogery = List();
  Future getAllcategory() async {
    var url = "http://192.168.145.252/wedding/car.php";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        catogery = jsonData;
      });
    }
    print(catogery);
  }

  @override
  void initState() {
    getAllcategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CategoryDetails'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCars()));
              })
        ],
      ),
      body: ListView.builder(
          itemCount: catogery.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCars(
                                catagorylist: catogery,
                                index: index,
                              )));
                },
                icon: Icon(Icons.edit),
                color: Colors.blue,
              ),
              title: Text(catogery[index]['name']),
              trailing: IconButton(
                onPressed: () async {
                  var url =
                      "http://192.168.145.252/wedding/Addcar/deletcategory.php";
                  var response =
                      await http.post(url, body: {"id": catogery[index]['id']});
                  if (response.statusCode == 200) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("messege"),
                              content: Text("category Delete successful"),
                              actions: <Widget>[
                                RaisedButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("cancel"),
                                )
                              ],
                            ));
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
