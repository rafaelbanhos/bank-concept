import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TransactionsScreem extends StatefulWidget {
  @override
  _TransactionsScreemState createState() => _TransactionsScreemState();
}

class _TransactionsScreemState extends State<TransactionsScreem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 14, top: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              //padding: EdgeInsets.only(top: 16.0, right: 210.0),
              child: Text(
                '€560.85',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Questrial-Regular"),
              ),
            ),
            Container(
              child: Text(
                'Current Balance',
                style: TextStyle(fontSize: 14, fontFamily: "Questrial-Regular"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 16.0,
              ),
              child: Text(
                'Setember',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Questrial-Regular"),
              ),
            ),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                MdiIcons.cash,
              )),
              title: Text(
                "Withdraw ATM",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              subtitle: Text(
                'Setember 19',
                style: TextStyle(fontSize: 12, fontFamily: "Questrial-Regular"),
              ),
              trailing: Text(
                "- €120.00",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                MdiIcons.cash,
              )),
              title: Text(
                "Withdraw ATM",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              subtitle: Text(
                'Setember 19',
                style: TextStyle(fontSize: 12, fontFamily: "Questrial-Regular"),
              ),
              trailing: Text("- €70.00"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                MdiIcons.cashRegister,
              )),
              title: Text(
                "Continente Guimarães",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              subtitle: Text(
                'Setember 19',
                style: TextStyle(fontSize: 12, fontFamily: "Questrial-Regular"),
              ),
              trailing: Text(
                "- €35.99",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              onTap: () {},
            ),
            Container(
              padding: EdgeInsets.only(
                top: 16.0,
              ),
              child: Text(
                'August',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Questrial-Regular"),
              ),
            ),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                MdiIcons.cashRefund,
              )),
              title: Text(
                "Deposit",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              subtitle: Text(
                'August 19',
                style: TextStyle(fontSize: 12, fontFamily: "Questrial-Regular"),
              ),
              trailing: Text(
                "+ €450.00",
                style: TextStyle(
                    fontFamily: "Questrial-Regular",
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                MdiIcons.cashRegister,
              )),
              title: Text(
                "Pingo Doce",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              subtitle: Text(
                'August 19',
                style: TextStyle(fontSize: 12, fontFamily: "Questrial-Regular"),
              ),
              trailing: Text(
                "- €2.65",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                MdiIcons.cashRegister,
              )),
              title: Text(
                "Submarino.com",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              subtitle: Text(
                'August 19',
                style: TextStyle(fontSize: 12, fontFamily: "Questrial-Regular"),
              ),
              trailing: Text(
                "- €2.65",
                style: TextStyle(fontFamily: "Questrial-Regular"),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
