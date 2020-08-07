import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

class Dashbaord extends StatefulWidget {
  @override
  _DashbaordState createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  //Code for dialogues
  createAlertDialog(BuildContext context) {
    return showDialog(context: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "No Posts yet",
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SvgPicture.asset(
                "images/no_content.svg",
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Create Post",
          style: TextStyle(fontSize: 20),
        ),
        icon: Icon(
          Icons.add,
          size: 24,
        ),
      ),
    );
  }
}
