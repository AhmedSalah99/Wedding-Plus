import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
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
            )
          ],
        ));
  }
}
