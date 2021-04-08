import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_core/firebase_core.dart ';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  DatabaseReference _ref;
  final databaseReference = FirebaseDatabase.instance.reference();
  var locationMessage = "";
  var flag = 0;

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    print("$lat ,$long");

    Map<String, double> storeLocation = {
      'latitude': lat,
      'longitude': long,
    };
    _ref.push().set(storeLocation);
    print("pushed");
    setState(() {
      locationMessage = "Latitude : $lat , Longitude : $long";
    });
  }

  Timer timer;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('storeLocation');
    timer =
        Timer.periodic(Duration(seconds: 2), (Timer t) => getCurrentLocation());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void readData() {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Location Services"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 46.0,
                color: Colors.blue,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Get user Location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Position: $locationMessage"),
              MaterialButton(
                onPressed: () {
                  getCurrentLocation();
                },
                color: Colors.blue[800],
                child: Text("SoS",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              MaterialButton(
                onPressed: () {
                  dispose();
                },
                color: Colors.blue[800],
                child: Text("close",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ));
  }
}
