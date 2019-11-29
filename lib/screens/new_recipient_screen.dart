import 'package:flutter/material.dart';

class NewRecipient extends StatefulWidget {
  @override
  _NewRecipientState createState() => _NewRecipientState();
}

class _NewRecipientState extends State<NewRecipient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New recipient",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
    );
  }
}
