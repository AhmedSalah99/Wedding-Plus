import 'package:flutter/material.dart';
import 'package:newproject/compunt/MyPdfViewer.dart';
import 'package:http/http.dart' as http;

class Booking extends StatefulWidget {
  final price;
  final named;
  const Booking({this.price, this.named});
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime datetime;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController invID = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController date = TextEditingController();

  Future addInvoice() async {
    var data = {
      "name": name.text,
      "email": email.text,
      "invID": invID.text,
      "phone": phone.text,
      "price": choosedprice,
      "date": day + " / " + month + " / " + year,
    };
    var response = await http
        .post("http://192.168.145.252/wedding/add-invoice.php", body: data);
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyPDFViewer(
                    invID: invID.text,
                  )));
      print(response.body);
    } else {
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

  String choosedprice;
  String day;
  String month;
  String year;
  var list_d = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];
  var list_m = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  var list_y = ["2021", "2022", "2023", "2024", "2025"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking " + widget.named + ""),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        labelText: "name",
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
                    controller: email,
                    decoration: InputDecoration(
                        labelText: "email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.redAccent,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: TextFormField(
                    controller: invID,
                    decoration: InputDecoration(
                        labelText: "ID",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(
                          Icons.phone,
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
                          Icons.phone,
                          color: Colors.redAccent,
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 100,
                    left: 110,
                  ),
                  height: 50,
                  child: DropdownButton(
                    hint: Text(
                      "Select Price",
                      style: TextStyle(color: Colors.black),
                    ),
                    dropdownColor: Colors.grey,
                    icon: Icon(Icons.arrow_drop_down),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    value: choosedprice,
                    onChanged: (newValue) {
                      setState(() {
                        choosedprice = newValue;
                      });
                    },
                    items: [
                      "price  : " + widget.price + ".",
                    ].map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Choose The Date",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            right: 10, left: 10, bottom: 10, top: 10),
                        width: 100,
                        child: DropdownButton(
                          hint: Text(
                            "day",
                            style: TextStyle(color: Colors.black),
                          ),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          value: day,
                          onChanged: (newValue) {
                            setState(() {
                              day = newValue;
                            });
                          },
                          items: list_d.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        width: 100,
                        child: DropdownButton(
                          hint: Text(
                            "month",
                            style: TextStyle(color: Colors.black),
                          ),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          value: month,
                          onChanged: (newValue) {
                            setState(() {
                              month = newValue;
                            });
                          },
                          items: list_m.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 10, left: 10, bottom: 10, top: 10),
                        width: 100,
                        child: DropdownButton(
                          hint: Text(
                            "year",
                            style: TextStyle(color: Colors.black),
                          ),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          value: year,
                          onChanged: (newValue) {
                            setState(() {
                              year = newValue;
                            });
                          },
                          items: list_y.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: GestureDetector(
                      onTap: () {
                        addInvoice();
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Booking",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
