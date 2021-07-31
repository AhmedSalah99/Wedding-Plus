import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var myMarker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Maps search"),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent[200],
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(30.5666644, 31.499998), zoom: 13),
              onMapCreated: (GoogleMapController googleMapController) {
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('2'),
                    position: LatLng(30.568728608744003, 31.506259096699853),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('3'),
                    position: LatLng(30.571761973389826, 31.488327110997318),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('4'),
                    position: LatLng(30.573658533373745, 31.483040946572842),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('5'),
                    position: LatLng(30.583496223349286, 31.529303238040583),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('6'),
                    position: LatLng(30.60694245285146, 31.47824253048763),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('7'),
                    position: LatLng(30.608347982243554, 31.47655835663061),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('8'),
                    position: LatLng(30.605338853952844, 31.480173631909302),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('9'),
                    position: LatLng(30.60746095699505, 31.476774908529155),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('10'),
                    position: LatLng(30.59589838313102, 31.480923740604684),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('11'),
                    position: LatLng(30.65751793799561, 31.579963797221968),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('12'),
                    position: LatLng(30.58001334331214, 31.482634897151215),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('13'),
                    position: LatLng(30.58281969398413, 31.485903384109893),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
                setState(() {
                  myMarker.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(30.595060129553513, 31.468977845843746),
                  ));
                });
              },
              markers: myMarker,
            )
          ],
        ));
  }
}
