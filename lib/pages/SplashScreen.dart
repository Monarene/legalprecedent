import 'dart:async';

import "package:flutter/material.dart";
import "package:legal_precedents/Provider/startup_provider.dart";
import 'package:legal_precedents/pages/Login.dart';
import 'package:legal_precedents/pages/dashbaord.dart';
import "package:provider/provider.dart";

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var startupProvider = Provider.of<StartUpProvider>(context);

  @override
  Widget build(BuildContext context) {
    if (startupProvider.onAuthenticated) {
      return Dashbaord();
    } else if (startupProvider.onfirstStart) {
      return SignIn();
    } else {
      return initScreen(context);
    }
  }

  @override
  void initState() {
    super.initState();
    startupProvider.onfirstStart ? null : startTimer();
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
