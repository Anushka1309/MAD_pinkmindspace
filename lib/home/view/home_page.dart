import 'dart:async';

import 'package:mad_pinkmindspace/authentication/bloc/authentication_bloc.dart';
import 'package:mad_pinkmindspace/domestic.violence.dart';
import 'package:mad_pinkmindspace/home/widgets/avatar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseReference _ref = FirebaseDatabase.instance.reference().child('sos');
  Timer timer;

  final databaseReference = FirebaseDatabase.instance.reference();
  void getCurrentLocation(String email) async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;

    print("$lat ,$long");

    Map<String, dynamic> locationCoordinates = {
      'email': email,
      'latitude': lat,
      'longitude': long,
      'dateTime': DateTime.now().toString(),
    };
    _ref.child(email.replaceAll(".", "")).push().set(locationCoordinates);
    print("pushed");
  }

  cancelTimer() {
    timer.cancel();
    print("cancelled");
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4.0),
            Text(user.email, style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.name ?? '', style: textTheme.headline5),
            MaterialButton(
              onPressed: () {
                timer = Timer.periodic(Duration(seconds: 2), (timer) {
                  getCurrentLocation(user.email);
                });
              },
              color: Colors.blue[800],
              child: Text("SOS",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            MaterialButton(
              onPressed: () {
                cancelTimer();
              },
              color: Colors.blue[800],
              child: Text("Stop",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyApp()));
              },
              color: Colors.blue[800],
              child: Text("About Domestic Violence",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
