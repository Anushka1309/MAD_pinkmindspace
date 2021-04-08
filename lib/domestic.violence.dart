import 'package:mad_pinkmindspace/constants.dart';
import 'package:flutter/material.dart';
import 'package:mad_pinkmindspace/rules.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
                        text: "   \nWhat is Domestic violence?\n  ",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      TextSpan(
                        text:
                            "    \nDomestic violence — also called intimate partner violence; occurs between people in an intimate relationship.Abusive relationships always involve an imbalance of power and control. An abuser uses intimidating, hurtful words and behaviors to control his or her partner.It might not be easy to identify domestic violence at first. While some relationships are clearly abusive from the outset, abuse often starts subtly and gets worse over time.You might be experiencing domestic violence if you're in a relationship with someone who:\n "
                            "Calls you names, insults you or puts you down. Prevents or discourages you from going to work or school or seeing family members or friends. Gets angry when drinking alcohol or using drugs. Threatens to tell friends, family, colleagues or community members your sexual orientation or gender identity.",
                        style: TextStyle(fontSize: 19.0),
                        // Theme.of(context).textTheme.headline6,
                        //  (fontSize: 10),
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => RulesApp()));
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
