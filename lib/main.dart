import 'package:flutter/material.dart';
import 'package:wecare/IndiaPage.dart';
import 'package:wecare/homepage.dart';
import 'package:wecare/india.dart';
import 'package:wecare/welcomescreen.dart';
import 'package:wecare/world.dart';
import 'loginscreen.dart';
import 'registration.dart';
import 'faqs.dart';
import 'india.dart';
import 'world.dart';
import 'countryPage.dart';


void main() {
  runApp(WeCare());
}

class WeCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
        IndiaStatus.id: (context) => IndiaStatus(),
        //WorldStatus.id: (context) => WorldStatus(),
        FAQ.id: (context) => FAQ(),
        countryPage.id: (context) => countryPage(),
        IndiaPage.id: (context) => IndiaPage(),
      },
    );
  }
}


