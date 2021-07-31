import 'package:flutter/material.dart';
import 'package:newproject/compunt/Setting.dart';
import 'package:newproject/compunt/about.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contact.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  var username;
  var email;

  bool isSignin = false;

  getpref() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    username = preferences.getString('username');
    email = preferences.getString('email');

    if (username != null) {
      setState(() {
        username = preferences.getString('username');
        email = preferences.getString('email');

        isSignin = true;
      });
    }
  }

  @override
  void initState() {
    getpref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.bottomLeft, colors: [
          Colors.redAccent[100],
          Colors.redAccent[100],
          Colors.cyanAccent[200]
        ]),
      ),
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: isSignin ? Text(username) : Text(" "),
            accountEmail: isSignin ? Text(email) : Text(" "),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white60,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.redAccent[400],
                image: DecorationImage(
                  image: AssetImage("images/pexels-studio-negarin-2613461.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          ListTile(
            title: Text("Home page"),
            leading: Icon(
              Icons.home,
              color: Colors.redAccent[400],
            ),
            onTap: () {
              Navigator.of(context).pushNamed('home');
            },
          ),
          ListTile(
            title: Text("Sections"),
            leading: Icon(Icons.category_rounded),
            onTap: () {
              Navigator.of(context).pushNamed('categores');
            },
          ),
          ListTile(
            title: Text("Setting"),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
          isSignin
              ? ListTile(
                  title: Text("loge out"),
                  leading: Icon(Icons.logout),
                  onTap: () async {
                    final SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.remove("username");
                    preferences.remove("email");
                    Navigator.of(context).pushNamed("tips");
                  },
                )
              : ListTile(
                  title: Text("loge in"),
                  leading: Icon(Icons.login),
                  onTap: () {
                    Navigator.of(context).pushNamed("login");
                  },
                ),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
            onTap: () {},
          ),
          ListTile(
            title: Text("Contact With Us"),
            leading: Icon(Icons.info),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
        ],
      ),
    ));
  }
}
