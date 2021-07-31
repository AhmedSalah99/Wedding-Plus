import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newproject/admin/Dashboard.dart';
import 'package:newproject/pages/Forgetpassword.dart';
import 'package:newproject/pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Row(
          children: <Widget>[Text("looding.."), CircularProgressIndicator()],
        ));
      });
}

showdialogall(context, String mytitle, String mycontent) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(mytitle),
          content: Text(mycontent),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("done"))
          ],
        );
      });
}

class _LoginState extends State<Login> {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();

  GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>();

  savepref(String username, String email) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("username", username);
    preferences.setString("email", email);
    print(preferences.getString("username"));
    print(preferences.getString("email"));
  }

  String vaildusername(String val) {
    if (val.trim().isEmpty) {
      return "Enter the username ";
    }
    if (val.length < 4) {
      return " username must not be less than 4 characters  ";
    }
  }

  String vaildemail(String val) {
    if (val.trim().isEmpty) {
      return "Enter the email ";
    }
    if (val.length < 6) {
      return " username must not be less than 6 characters  ";
    }
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "The email address is not correct";
    }
  }

  String vaildpassword(String val) {
    if (val.trim().isEmpty) {
      return "enter passowrd";
    }
    if (val.length < 8) {
      return " Password must not be less than 8 digits";
    }
  }

  String vaildconfpassword(String val) {
    if (val != password.text) {
      return " The password is not the same";
    }
  }

  signin() async {
    var formdata = formstatesignin.currentState;
    if (formdata.validate()) {
      formdata.save();

      showloading(context);
      var data = {"email": email.text, "password": password.text};
      var url = "http://192.168.145.252/wedding/login.php";
      var respons = await http.post(url, body: data);
      var responsbody = jsonDecode(respons.body);
      if (responsbody['status'] == "success") {
        if (responsbody['statuse'] == "Admin") {
          Navigator.of(context).pushNamed("dash");
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
        savepref(responsbody['username'], responsbody['email']);
        print(responsbody['username']);
      } else {
        print("email or password is rowwing");
        Navigator.of(context).pop();
        showdialogall(context, "Error", "Email or password is Rowwing");
      }
    } else {
      print("not vaild");
    }
  }

  signup() async {
    var formdata = formstatesignup.currentState;
    if (formdata.validate()) {
      formdata.save();
      showloading(context);
      var data = {
        "email": email.text,
        "password": password.text,
        'username': username.text,
      };

      var url = "http://192.168.145.252/wedding/signup.php";
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == 'success') {
        if (responsebody['statuse'] == "Admin") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
        print("yes");
        Navigator.of(context).pushNamed("home");
      } else {
        print(responsebody['status']);
        Navigator.of(context).pop();
        showdialogall(context, "Error", "This email already exists");
      }
    } else {
      print("not vaild");
    }
  }

  TapGestureRecognizer _changesigin;
  bool showsignin = true;

  @override
  void initState() {
    _changesigin = new TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showsignin = !showsignin;
        });
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
        top: 50,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/catagory/pexels-soulseeker-1589820.jpg"),
            fit: BoxFit.cover),
      ),
      child: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(bottom: 0),
              child: Container(
                padding: EdgeInsets.only(right: 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      showsignin ? "Sign In" : "Sign Up",
                      style: TextStyle(color: Colors.redAccent, fontSize: 50),
                    )
                  ],
                ),
              )),
          showsignin
              ? AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutBack,
                  height: 430,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(.1),
                      borderRadius: BorderRadius.circular(60)),
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Form(
                      autovalidate: true,
                      key: formstatesignin,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            child: TextFormField(
                              controller: email,
                              validator: vaildemail,
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
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: TextFormField(
                              obscureText: true,
                              validator: vaildpassword,
                              controller: password,
                              decoration: InputDecoration(
                                  labelText: "passowrd",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.lock,
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
                                            builder: (context) =>
                                                Forgetpass()));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Center(
                                        child: Text("Forget passowrd ?",
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
                                  onPressed: showsignin ? signin : signup),
                            ),
                          ),
                          // isloading ? CircularProgressIndicator(): Padding(padding: EdgeInsets.all(0)),
                          Container(
                            margin: EdgeInsets.only(
                              top: 30,
                            ),
                            child: Center(
                              child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: showsignin
                                      ? "if you dont have account you can"
                                      : "if you  have account you can",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                    recognizer: _changesigin,
                                    text: showsignin
                                        ? " create one from her"
                                        : " Sign in from her",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700))
                              ])),
                            ),
                          )
                        ],
                      )),
                )
              : AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutBack,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(.1),
                      borderRadius: BorderRadius.circular(60)),
                  padding:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Form(
                            autovalidate: true,
                            key: formstatesignup,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: TextFormField(
                                    controller: username,
                                    validator: vaildusername,
                                    decoration: InputDecoration(
                                        labelText: "User name",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
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
                                    controller: email,
                                    validator: vaildemail,
                                    decoration: InputDecoration(
                                        labelText: "Email",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.redAccent,
                                        )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: password,
                                    validator: vaildpassword,
                                    decoration: InputDecoration(
                                        labelText: "passowrd",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
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
                                    obscureText: true,
                                    validator: vaildconfpassword,
                                    controller: confirmpassword,
                                    decoration: InputDecoration(
                                        labelText: "Confirm password",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.redAccent,
                                        onPressed: signup),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: Center(
                                    child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                        text: showsignin
                                            ? "if you dont have account you can"
                                            : "Already an acounte ?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(
                                          recognizer: _changesigin,
                                          text: showsignin
                                              ? " create one from her"
                                              : " login",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w700))
                                    ])),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                )
        ],
      ),
    ));
  }
}
