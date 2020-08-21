import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:legal_precedents/models/quote_model.dart';
import 'package:legal_precedents/pages/Info.dart';
import 'package:legal_precedents/services/firestore_service.dart';
import 'package:provider/provider.dart';

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
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirestoreService _db = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var timeStamp = DateTime.now().toIso8601String();

  //  final int number;
//  final String words;
//  final String author;
//  final String userId;
//  final String timeStamp;

  //Code for dialogues
  Future<String> createAlertDialog(BuildContext context, quotes) async {
    FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
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
                          controller: wordsController,
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
                        controller: authorController,
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
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if (quotes.length == 0) {
                      await _db.addQuote(1, wordsController.text,
                          authorController.text, uid, timeStamp);
                      wordsController.clear();
                      authorController.clear();
                      Navigator.pop(context);
                    } else {
                      await _db.addQuote(
                          quotes.length + 1,
                          wordsController.text,
                          authorController.text,
                          uid,
                          timeStamp);
                      wordsController.clear();
                      authorController.clear();
                      Navigator.pop(context);
                    }
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
    var quotes = Provider.of<List<Quote>>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Legal Precedent",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 25),
        )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: quotes == null
          ? CircularProgressIndicator()
          : SafeArea(
              child: quotes.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "No Posts yet",
                            style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).primaryColor),
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
                    )
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: ListView.builder(
                          itemCount: quotes.length,
                          itemBuilder: (context, index) {
                            Quote quote = quotes[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).primaryColor),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InfoPage(
                                                quote: quote,
                                              )));
                                },
                                selected: false,
                                leading: Icon(
                                  Icons.format_quote,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  quote.words + ".",
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  child: Text(
                                    "Quote by " + quote.author,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await createAlertDialog(context, quotes);
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
