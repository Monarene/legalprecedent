import "package:flutter/material.dart";
import 'package:legal_precedents/Provider/startup_provider.dart';
import 'package:legal_precedents/pages/Login.dart';
import 'package:legal_precedents/pages/SplashScreen.dart';
import 'package:legal_precedents/pages/dashbaord.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    var startUpProvider = Provider.of<StartUpProvider>(context);
    if (startUpProvider.onAuthenticated) {
      return Dashbaord();
    } else if (startUpProvider.onfirstStart) {
      startUpProvider.setOnFirstStart(true);
      return SplashScreen();
    } else {
      return SignIn();
    }
  }
}
