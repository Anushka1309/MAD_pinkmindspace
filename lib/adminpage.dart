import 'dart:async';

import 'package:mad_pinkmindspace/authentication/bloc/authentication_bloc.dart';
import 'package:mad_pinkmindspace/home/widgets/avatar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AdminPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AdminPage());
  }

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
    };
    _ref.push().set(locationCoordinates);
    print("pushed");
  }

  cancelTimer() {
    timer.cancel();
    print("cancelled");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }

  // void getData() async {
  //   var db = FirebaseDatabase.instance.reference().child("sos");
  //   await db.once().then((DataSnapshot snapshot) {
  //     Map<dynamic, dynamic> values = snapshot.value;
  //     values.forEach((key, values) {
  //       email.add(values['email']);
  //       print(email.length);
  //       latitude.add(values['latitude']);
  //       longitude.add(values['longitude']);
  //     });
  //   });
  // }

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
      body: Center(
        child: ListView(
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4.0),
            Text(user.email, style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.name ?? '', style: textTheme.headline5),
            Container(
              // height: 300,
              child: StreamBuilder(
                stream:
                    FirebaseDatabase.instance.reference().child("sos").onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data.snapshot.value != null) {
                    List email = [];
                    List latitude = [];
                    List longitude = [];

                    //print((snapshot.data as Event).snapshot.value);
                    Map<dynamic, dynamic> values =
                        (snapshot.data as Event).snapshot.value;
                    values.forEach((key, values) {
                      print((values as Map<dynamic, dynamic>)
                          .entries
                          .first
                          .value);

                      email.add((values as Map<dynamic, dynamic>)
                          .entries
                          .first
                          .value['email']);
                      latitude.add((values as Map<dynamic, dynamic>)
                          .entries
                          .first
                          .value['latitude']);
                      longitude.add((values as Map<dynamic, dynamic>)
                          .entries
                          .first
                          .value['longitude']);
                    });
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: Colors.pink[100],
                          title: Text(email[index]),
                          subtitle: Text("Help me at"
                              "Lat: ${latitude[index]}, Long: ${longitude[index]}"),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: email.length,
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
