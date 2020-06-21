import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:wecare/registration.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(minutes: 2), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child:  Container(
                    height: 150.0,
                    child: Image.asset('assets/logo.jpg'),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['We Care'],
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                'Because Together We Care',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue.shade400,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
              child: Divider(
                color: Colors.blue,
                thickness: 10.0,
              ),
            ),
            Container(
              child: Text(
                '*BOND OF UNDERSTANDING*',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Text(
                'These Terms and Conditions constitute a legally binding agreement made between you, whether personally or on behalf of an entity (“you”) and [your business name] (“we,” “us” or “our”), concerning your access to and use of our mobile application (the “Application”). You agree that by accessing the Application, you have read, understood, and agree to be bound by all of these Terms and Conditions Use. IF YOU DO NOT AGREE WITH ALL OF THESE TERMS AND CONDITIONS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE APPLICATION AND YOU MUST DISCONTINUE USE IMMEDIATELY.',
              ),

            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Text(
                'This application is designed for track of COVID-19 patiets and rasing voice against Domestic Violence as well as Child Abuse',
              ),
            ),
            SizedBox(
              height: 100.0,
              child: Divider(
                color: Colors.blue,
                thickness: 10.0,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Implement login functionality.
                    setState(() {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    });
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Agree & Continue',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}