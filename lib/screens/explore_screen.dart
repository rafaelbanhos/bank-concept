import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemBuilder: (a, b) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                color: Colors.white,
                elevation: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.card_giftcard, size: 34),
                      title: Text('Invite Friends',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Questrial-Regular")),
                      subtitle: Text('Earn money with friends',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Questrial-Regular")),
                    ),
                  ],
                ),
              );
            },
            itemCount: 1),
      ),
    );
  }
}
