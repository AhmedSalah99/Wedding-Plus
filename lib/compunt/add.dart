import 'package:flutter/material.dart';
import 'package:newproject/pages/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Addcat extends StatefulWidget {
  showloading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Row(
            children: <Widget>[Text("loding.."), CircularProgressIndicator()],
          ));
        });
  }

  @override
  _AddcatState createState() => _AddcatState();
}

class _AddcatState extends State<Addcat> {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  TextEditingController name = new TextEditingController();
  TextEditingController space = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController priceDetails = new TextEditingController();
  TextEditingController capacity = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController hell_sec = new TextEditingController();

  GlobalKey<FormState> formstateadd = new GlobalKey<FormState>();

  add() async {
    var formdata = formstateadd.currentState;
    if (formdata.validate()) {
      formdata.save();

      var data = {
        "name": name.text,
        "space": space.text,
        'location': location.text,
        'price': price.text,
        'priceDetails': priceDetails.text,
        'capacity': capacity.text,
        'phone': phone.text,
        'hell_sec': hell_sec.text,
      };

      var url = "http://10.0.2.2/wedding/add.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == 'success') {
        print("yes");
      } else {
        print(responsebody['status']);
      }
    } else {
      print("not vaild");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("add"),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.only(right: 20, left: 20),
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: <Widget>[
              Container(
                child: Form(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            labelText: "name ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: space,
                        decoration: InputDecoration(
                            labelText: "space",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: location,
                        decoration: InputDecoration(
                            labelText: "location",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: price,
                        decoration: InputDecoration(
                            labelText: "price",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: priceDetails,
                        decoration: InputDecoration(
                            labelText: "priceDetails",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: capacity,
                        decoration: InputDecoration(
                            labelText: "capacity",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                            labelText: "phone",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: TextFormField(
                        controller: hell_sec,
                        decoration: InputDecoration(
                            labelText: "hell_sec",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, right: 10),
                      child: Center(
                        child: RaisedButton(
                            child: Text(
                              "Create account",
                            ),
                            color: Colors.redAccent,
                            onPressed: add),
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
