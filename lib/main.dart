import 'package:bank_concept/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bank Concept",
      theme: ThemeData(
          fontFamily: "Questrial-Regular",
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)),
      home: Home(),
    );
  }
}
