import 'dart:async';

import "package:flutter/material.dart";
import 'package:legal_precedents/pages/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "LP",
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
