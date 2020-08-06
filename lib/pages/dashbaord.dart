import 'package:flutter/material.dart';

class Dashbaord extends StatefulWidget {
  @override
  _DashbaordState createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  @override
  Widget build(BuildContext context) {
//    var startupProvider = Provider.of<StartUpProvider>(context);
//    startupProvider.setOnAuthenticated(true);
    return Scaffold(
      body: Center(
        child: Text('dashbaord.com'),
      ),
    );
  }
}
