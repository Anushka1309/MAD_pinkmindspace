import 'package:mad_pinkmindspace/constants.dart';
import 'package:flutter/material.dart';
import 'package:mad_pinkmindspace/home/home.dart';
import 'package:mad_pinkmindspace/laws.dart';

import 'constants.dart';

void main() => runApp(SecondlawsApp());

class SecondlawsApp extends StatelessWidget {
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
                        text:
                            "   \nSection 498A of the IPC (Indian Penal Code)\n  ",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      TextSpan(
                          text:
                              "This is a Criminal Law, which applies to husbands or family members of husband who are merciless to women. Under Section 498A of the IPC, harassment for Dowry by the family members of the husband or by husband is recognized as a Crime. This harassment can be of any type either Physical or Mental. Despite the fact that Marital Rape isn’t considered as a Crime in India, forced sex with one’s wife can be viewed as Cruelty under this Section. Section 498A has a vast scope. It also includes any and all intentional behaviours against a women which force the women to attempt suicide or risk to life or grave injury or risk to limb or overall health. Here, health incorporates the physical and mental health of the women."
                          //"This is an act of the Indian Parliament enacted to protect women from Domestic Violence. It prohibits a wide range of Physical, Sexual, Emotional & Economical abuse against women and all these are broadly defined under the Act. It provides security to women in a family from men in a family. The extent of the Act covers not only the protection of women who are married to men but also women who are in Live-in-relationship, just as family members including Grandmothers, Mothers, etc. A women has right to be liberated from any type of violence under this Act. Under this law, women can look for security against Domestic Violence, Financial Compensation, Right to live in their mutual house and they can get maintenance from their abuser in case they are living separated."
                          //  "This law is to guarantee that women don’t get kicked out of their own house and can support themselves if they have been abused. It also ensure the protection of women from their abusers."
                          //"There are several Laws in India which directly deals with the protection of married women from her partner and her partner’s family.",
                          //text:
                          // "    \nThe most important personal safety skills that we want students to practice include: \nAssessing the person’s behavior and being aware of potential danger signs. \nGetting centered to calm themselves down so that they can think clearly and make safer choices instead of panicking or escalating the argument. \nProtecting themselves emotionally rather than being triggered or coerced by the mean things someone says  to them. \nUsing verbal self-defense tactics to defuse a potentially violent interaction. \nProtecting themselves physically without fighting backCreating a safety plan for how to leave and for how to get help. \nLearning fighting skills, including defense against weapons, can make a big difference to a student’s self-confidence and also can increase her ability to protect herself in other situations. ",
                          ,
                          style: TextStyle(fontSize: 18)
                          //Theme.of(context).textTheme.headline6,
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
                              builder: (BuildContext context) => LawsApp()));
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
                            "Back to laws",
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
