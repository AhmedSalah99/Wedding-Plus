import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:newproject/compunt/drawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newproject/compunt/listPackage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Homepage();
  }
}

class Homepage extends State<Home> {
  List<dynamic> listsearch = [];
  Future getData() async {
    var url = "http://192.168.145.252/wedding/search.php";
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      listsearch.add(responsebody[i]['name']);
    }
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(" Wedding plus"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent[200],
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  return showSearch(
                      context: context, delegate: Datasearch(list: listsearch));
                })
          ],
          elevation: 6,
          /*  leading: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),*/
          //  titleSpacing: 10,
          brightness: Brightness.light,
        ),
        drawer: Mydrawer(),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.redAccent[100],
              Colors.cyan[200],
              Colors.cyanAccent
            ]),
          ),
          child: ListView(
            children: <Widget>[
              // start Carousel
              Container(
                height: 200.0,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 6.0,
                  dotIncreasedColor: Color(0xFFFF335C),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  borderRadius: true,
                  radius: Radius.circular(10),
                  images: [
                    AssetImage('images/pexels-alexgtacar-1592384.jpg'),
                    AssetImage('images/pexels-asad-photo-maldives-169211.jpg'),
                    AssetImage('images/pexels-dimitri-kuliuk-1486101.jpg'),
                    AssetImage('images/pexels-freestocksorg-129065.jpg'),
                    AssetImage('images/pexels-fu-zhichao-587741.jpg'),
                    AssetImage('images/pexels-studio-negarin-2613461.jpg'),
                  ],
                ),
              ),
              //end Carousel
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sections",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              //Start catagory
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("Halls");
                        },
                        title: Icon(
                          Icons.account_balance,
                          size: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Halls",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("Photosetion");
                        },
                        title: Icon(
                          Icons.camera,
                          size: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Photo Setion",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("Cars");
                        },
                        title: Icon(
                          Icons.car_repair,
                          size: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "Cars",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed("Makeup");
                        },
                        title: Icon(
                          Icons.brush_outlined,
                          size: 80,
                        ),
                        subtitle: Container(
                          child: Text(
                            "MakeUp",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //end Catagory
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "latest additions",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Container(
                  height: 500,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: GridTile(
                            child: Image.asset(
                                "images/Hells/AhmedOraby/enter.jpg"),
                            footer: cGradTile(" Ahmed Oraby"),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("Halls");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: GridTile(
                            child: Image.asset(
                                "images/Hells/Borivage/Borivage.jpg"),
                            footer: cGradTile("Borivage"),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("Halls");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: GridTile(
                            child: Image.asset("images/waths.jpeg"),
                            footer: cGradTile("Al Masa"),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("Halls");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: GridTile(
                            child:
                                Image.asset("images/Hells/marbila/marbila.jpg"),
                            footer: cGradTile("Marbila"),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("Halls");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: GridTile(
                            child: Image.asset(
                                "images/Hells/Porto Laguna/portolagona.jpg"),
                            footer: cGradTile("Porto"),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("Halls");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child: GridTile(
                            child: Image.asset("images/Hells/Reval/reval.jpg"),
                            footer: cGradTile(" Reval"),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed("Halls");
                          },
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}

cGradTile(String txt) {
  return Container(
    color: Colors.redAccent[400].withOpacity(.7),
    child: Text(
      txt,
      style: TextStyle(),
      textAlign: TextAlign.center,
    ),
  );
}

class Datasearch extends SearchDelegate<String> {
  List<dynamic> list;
  Datasearch({this.list});
  Future getsearchdata() async {
    var url = "http://192.168.145.252/wedding/searchhell.php";
    var data = {"searchhells": query};

    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
      IconButton(
          icon: Icon(Icons.location_on_outlined),
          onPressed: () {
            Navigator.of(context).pushNamed("maps");
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(
      future: getsearchdata(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return listPackage(
                  name: snapshot.data[i]['name'],
                  space: snapshot.data[i]['space'],
                  price: snapshot.data[i]['price'],
                  priceDetalis: snapshot.data[i]['priceDetalis'],
                  location: snapshot.data[i]['location'],
                  phone: snapshot.data[i]['phone'],
                  image: snapshot.data[i]["image"],
                  capacity: snapshot.data[i]['capacity'],
                );
              });
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var listsearch =
        query.isEmpty ? list : list.where((s) => s.startsWith(query)).toList();
    // TODO: implement buildSuggestions
    return ListView.builder(
      itemCount: listsearch.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.account_balance),
          title: Text(listsearch[i]),
          onTap: () {
            query = listsearch[i];
            showResults(context);
          },
        );
      },
    );
  }
}
