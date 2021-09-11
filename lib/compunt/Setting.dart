import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  File file;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  Future picker() async {
    final myfile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(myfile.path);
    });
  }

  Future addEditcategroy() async {
    if (username.text != "") {
      var url = "http://192.168.145.252/wedding/account/updatecategory.php";
      var response = await http.post(url, body: {
        "username": username.text,
        "password": password.text,
      });
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("messege"),
                  content: Text("category update successful"),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('setting account'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: username,
                decoration: InputDecoration(labelText: "username"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: password,
                decoration: InputDecoration(labelText: "password"),
              ),
            ),
            IconButton(
                icon: Icon(Icons.camera_alt_outlined), onPressed: picker),
            Center(
              child: file == null ? Text("image notselect") : Image.file(file),
            ),
            MaterialButton(
                color: Colors.redAccent,
                child: Text("save"),
                onPressed: () {
                  addEditcategroy();
                }),
          ],
        ));
  }
}
