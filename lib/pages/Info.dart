import 'package:flutter/material.dart';
import 'package:legal_precedents/models/quote_model.dart';

class InfoPage extends StatefulWidget {
  final Quote quote;

  InfoPage({this.quote});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2)),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.asset("images/gavel.png")),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Icon(Icons.format_quote),
                    flex: 1,
                  ),
                  Expanded(
                      flex: 6,
                      child: Text(
                        widget.quote.words,
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                    child: Icon(Icons.format_quote),
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
