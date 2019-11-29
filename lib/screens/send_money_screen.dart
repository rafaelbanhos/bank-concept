import 'package:bank_concept/screens/new_recipient_screen.dart';
import 'package:bank_concept/screens/send_details_screen.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose recipient',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.monetization_on, size: 34),
              title: Text('Send money now!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Questrial-Regular")),
              subtitle: Text('Invite your friends',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
              trailing: IconButton(
                icon: Icon(Icons.add, size: 34),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewRecipient()));
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline, size: 34),
              title: Text('John Walker',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Questrial-Regular")),
              subtitle: Text('Activo Bank CC 2356',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
              trailing: IconButton(
                icon: Icon(Icons.send, size: 34),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SendDetailsScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
