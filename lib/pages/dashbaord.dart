import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legal_precedents/services/firestore_service.dart';

class Dashbaord extends StatefulWidget {
  @override
  _DashbaordState createState() => _DashbaordState();
}

// TODO => Refactor and remove the other provider
// TODO => Setup the new Provider => Done
// TODO => Design the list tile
// TODO => Setup the Add function and ensure it works
// TODO => Feed the display

class _DashbaordState extends State<Dashbaord> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirestoreService _db = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  final int number;
//  final String words;
//  final String author;
//  final String userId;
//  final String timeStamp;

  submit(String words, String author) async {
    FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    var timeStamp = DateTime.now().toIso8601String();
  }

  //Code for dialogues
  Future<String> createAlertDialog(BuildContext context) {
    final maxLines = 5;
    final _formKey = GlobalKey<FormState>();
    TextEditingController wordsController = new TextEditingController();
    TextEditingController authorController = new TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text("Add Quote"),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: maxLines.toDouble() * 30,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'This field cannot be left blank';
                            }
                            return null;
                          },
                          maxLines: maxLines,
                          controller: authorController,
                          decoration: InputDecoration(
                              hintText: "Write your Law Quote",
                              fillColor: Theme.of(context).primaryColorLight,
                              filled: true),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field cannot be left blank';
                          }
                          return null;
                        },
                        controller: wordsController,
                        decoration: InputDecoration(
                            hintText: "Author",
                            fillColor: Theme.of(context).primaryColorLight,
                            filled: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
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
              Image.asset(
                "images/no_content.png",
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await createAlertDialog(context);
        },
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
