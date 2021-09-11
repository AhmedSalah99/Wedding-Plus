import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("About "),
          ],
        ),
      ),
    );
  }
}
