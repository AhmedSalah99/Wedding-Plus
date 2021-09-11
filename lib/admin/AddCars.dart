import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:newproject/admin/category.dart';

class AddCars extends StatefulWidget {
  final catagorylist;
  final index;
  AddCars({this.catagorylist, this.index});
  @override
  _AddCarsState createState() => _AddCarsState();
}

class _AddCarsState extends State<AddCars> {
  TextEditingController catnamecontroler = TextEditingController();
  TextEditingController catspacecontroler = TextEditingController();
  TextEditingController catpricecontroler = TextEditingController();
  TextEditingController catpriceDetaliscontroler = TextEditingController();
  TextEditingController catlocationcontroler = TextEditingController();
  TextEditingController catphonecontroler = TextEditingController();

  bool editMod = false;
  File file;
  Future picker() async {
    final myfile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(myfile.path);
    });
  }

  Future Upload() async {
    if (file == null) return;
    String base64 = base64Encode(file.readAsBytesSync());
    String imagename = file.path.split("/").last;
    var url = "http://192.168.145.252/wedding/Addcar/addcategory.php";
    var data = {"imagename": imagename, "image64": base64};
    var response = await http.post(url, body: data);
  }

  Future addEditcategroy() async {
    if (catnamecontroler.text != "") {
      if (editMod) {
        var url = "http://192.168.145.252/wedding/Addcar/updatecategory.php";
        var response = await http.post(url, body: {
          "id": widget.catagorylist[widget.index]['id'],
          "name": catnamecontroler.text,
          "space": catspacecontroler.text,
          "price": catpricecontroler.text,
          "priceDetalis": catpriceDetaliscontroler.text,
          "location": catlocationcontroler.text,
          "phone": catphonecontroler.text,
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
      } else {
        var url = "http://192.168.145.252/wedding/Addcar/addcategory.php";
        var response = await http.post(url, body: {
          "name": catnamecontroler.text,
          "space": catspacecontroler.text,
          "price": catpricecontroler.text,
          "priceDetalis": catpriceDetaliscontroler.text,
          "location": catlocationcontroler.text,
          "phone": catphonecontroler.text,
        });
        if (response.statusCode == 200) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("messege"),
                    content: Text("category add successful"),
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
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMod = true;
      catnamecontroler.text = widget.catagorylist[widget.index]['name'];
      catspacecontroler.text = widget.catagorylist[widget.index]['space'];
      catpricecontroler.text = widget.catagorylist[widget.index]['price'];
      catpriceDetaliscontroler.text =
          widget.catagorylist[widget.index]['priceDetalis'];
      catlocationcontroler.text = widget.catagorylist[widget.index]['location'];
      catphonecontroler.text = widget.catagorylist[widget.index]['phone'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editMod ? "Update" : "Add"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: catnamecontroler,
              decoration: InputDecoration(labelText: "name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: catspacecontroler,
              decoration: InputDecoration(labelText: "space"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: catpricecontroler,
              decoration: InputDecoration(labelText: "price"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: catpriceDetaliscontroler,
              decoration: InputDecoration(labelText: "priceDetalis"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: catlocationcontroler,
              decoration: InputDecoration(labelText: "location"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: catphonecontroler,
              decoration: InputDecoration(labelText: "phone"),
            ),
          ),
          IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: picker),
          Center(
            child: file == null ? Text("image notselect") : Image.file(file),
          ),
          MaterialButton(
              color: Colors.redAccent,
              child: Text(editMod ? "Update" : "save"),
              onPressed: () {
                addEditcategroy();
                Upload();
              }),
        ],
      ),
    );
  }
}
