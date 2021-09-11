import 'dart:convert';
import "package:toast/toast.dart";
import 'package:flutter/material.dart';
import 'package:newproject/pages/login.dart';
import 'package:http/http.dart' as http;

class Forgetpass extends StatefulWidget {
  @override
  _ForgetpassState createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController email = new TextEditingController();
  bool verifaybuttom = false;
  String verifaylink;
  Future checkuser() async {
    var response =
        await http.post('http://192.168.145.252/wedding/chekpass.php', body: {
      "email": email.text,
    });
    String jsonsDataString = response.toString();
    var link = jsonDecode(response.body);
    if (link == "INVALIDEMAIL") {
      setState(() {
        verifaylink = link;
        verifaybuttom = true;
      });
    } else {
      setState(() {
        verifaylink = link;
        verifaybuttom = true;
      });
    }
    print(link);
    showdialogall(context, "forget pass", link);
  }

  @override
  void initState() {
    checkuser();

    super.initState();
  }

  var nawPass = 0;
  Future reset() async {
    var response = await http.post(verifaylink);
    var link = jsonDecode(response.body);
    setState(() {
      nawPass = link;
    });

    print(link);
    showToast(
      "Your pass has been reset : $nawPass",
      duration: 4,
      gravity: Toast.CENTER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan.withOpacity(.3),
            Colors.cyan.withOpacity(.3),
            Colors.cyanAccent.withOpacity(.3)
          ]),
        ),
        padding: EdgeInsets.only(top: 120),
        child: ListView(
          children: <Widget>[
            Container(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 50),
                curve: Curves.easeInOutBack,
                height: 430,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                child: Form(
                    child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: "Email ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.redAccent,
                            )),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 30, left: 110),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Row(
                              children: <Widget>[
                                Center(
                                  child: Text("Back to login ?",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: RaisedButton(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.redAccent,
                            onPressed: () {
                              checkuser();
                            }),
                      ),
                    ),

                    // isloading ? CircularProgressIndicator(): Padding(padding: EdgeInsets.all(0)),
                    Container(
                      margin: EdgeInsets.only(
                        top: 30,
                      ),
                    )
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  showToast(String msg, {int duration, gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
