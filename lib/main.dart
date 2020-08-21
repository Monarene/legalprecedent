import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_precedents/pages/SplashScreen.dart';
import 'package:legal_precedents/services/firestore_service.dart';
import "package:provider/provider.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final FirestoreService _db = FirestoreService();

    return MultiProvider(
      providers: [
        StreamProvider(
          create: (BuildContext context) => _db.getQuote(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
