import 'package:mad_pinkmindspace/constants.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(RulesApp());

class RulesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WARRIOR',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          headline3:
              TextStyle(color: Colors.pink[100], fontWeight: FontWeight.w500),
          button: TextStyle(color: kPrimaryColor),
          headline5:
              TextStyle(color: Colors.pink[100], fontWeight: FontWeight.w400),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      home: ReadScreen(),
    );
  }
}

class ReadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "   \nRules And Regulations\n  ",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      TextSpan(
                          text:
                              "    \nThe most important personal safety skills that we want students to practice include: \nAssessing the person’s behavior and being aware of potential danger signs. \nGetting centered to calm themselves down so that they can think clearly and make safer choices instead of panicking or escalating the argument. \nProtecting themselves emotionally rather than being triggered or coerced by the mean things someone says  to them. \nUsing verbal self-defense tactics to defuse a potentially violent interaction. \nProtecting themselves physically without fighting backCreating a safety plan for how to leave and for how to get help. \nLearning fighting skills, including defense against weapons, can make a big difference to a student’s self-confidence and also can increase her ability to protect herself in other situations. ",
                          style: TextStyle(fontSize: 18)
                          //Theme.of(context).textTheme.headline6,
                          )
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return;
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Rules",
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
