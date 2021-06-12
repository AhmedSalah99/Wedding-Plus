import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Choosecountry extends StatefulWidget {
  Choosecountry({Key key}) : super(key: key);
  @override
  _ChoosecountryState createState() => _ChoosecountryState();
}

class _ChoosecountryState extends State<Choosecountry> {
  savepref(String country) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("country", country);
    print(preferences.getString("country"));
  }

  getpref() async {
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var countrys = preferences.getString("country");
    if (countrys != null) {
      Navigator.of(context).pushNamed('home');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getpref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose country"),
          backgroundColor: Colors.redAccent[400],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Sharqia"),
                onTap: () {
                  savepref("Sharqia");
                },
              ),
              ListTile(
                title: Text("Alexandria"),
                onTap: () {
                  savepref("Alexandria");
                },
              ),
              ListTile(
                title: Text("Cairo"),
                onTap: () {
                  savepref("Cairo");
                },
              ),
              ListTile(
                title: Text("Giza"),
                onTap: () {
                  savepref("Giza");
                },
              ),
              ListTile(
                title: Text("Ismailia"),
                onTap: () {
                  savepref("Ismailia");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
