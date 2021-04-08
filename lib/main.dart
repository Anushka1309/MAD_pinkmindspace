import 'package:mad_pinkmindspace/app.dart';
import 'package:mad_pinkmindspace/simple_bloc_observer.dart';
import 'package:mad_pinkmindspace/theme.dart';
import 'package:mad_pinkmindspace/welcomepage.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mad_pinkmindspace/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  //Bloc.observer = SimpleBlocObserver();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false, theme: theme, home: WelcomeScreen()),
    // App(
    //   authenticationRepository: AuthenticationRepository(),
    // ),
  );
}
