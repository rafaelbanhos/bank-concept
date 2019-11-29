import 'package:bank_concept/screens/explore_screen.dart';
import 'package:bank_concept/screens/send_money_screen.dart';
import 'package:bank_concept/screens/transactions_screen.dart';
import 'package:bank_concept/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
              MdiIcons.account,
            )),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Wallet',
                ),
                Tab(
                  text: 'Home',
                ),
                Tab(
                  text: 'Explore',
                ),
              ],
              labelColor: Colors.black,
            ),
            title: Text(
              'Bank Concept',
              style: TextStyle(
                  color: Colors.black, fontFamily: "Questrial-Regular"),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: IconButton(
                  icon: new Icon(MdiIcons.searchWeb),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: IconButton(
                  icon: new Icon(MdiIcons.settings),
                ),
                onPressed: () {
                  _settingModalBottomSheet(context);
                },
              )
            ],
          ),
          body: TabBarView(
            children: [
              WalletScreen(),
              TransactionsScreem(),
              ExploreScreen(),
            ],
          ),
          floatingActionButton: SpeedDial(
            // both default to 16
            marginRight: 18,
            marginBottom: 20,
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 22.0),
            // this is ignored if animatedIcon is non null
            // child: Icon(Icons.add),
            //visible: _dialVisible,
            // If true user is forced to close dial manually
            // by tapping main button and overlay is not rendered.
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: Color.fromRGBO(53, 161, 138, 1),
            foregroundColor: Colors.white,
            elevation: 8.0,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                  child: IconButton(
                      icon: Icon(MdiIcons.cashMultiple,
                          color: Colors.white, size: 18)),
                  backgroundColor: Color.fromRGBO(53, 161, 138, 1),
                  label: 'Transfers',
                  labelStyle: TextStyle(
                      fontSize: 14.0, fontFamily: "Questrial-Regular"),
                  onTap: () => print('FIRST CHILD')),
              SpeedDialChild(
                child: IconButton(
                    icon: Icon(MdiIcons.send, color: Colors.white, size: 18)),
                backgroundColor: Color.fromRGBO(53, 161, 138, 1),
                label: 'Send Money',
                labelStyle:
                    TextStyle(fontSize: 14.0, fontFamily: "Questrial-Regular"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SendMoney()));
                },
              ),
              SpeedDialChild(
                child: IconButton(
                    icon: Icon(
                  MdiIcons.receipt,
                  color: Colors.white,
                  size: 18,
                )),
                backgroundColor: Color.fromRGBO(53, 161, 138, 1),
                label: 'Request Money',
                labelStyle:
                    TextStyle(fontSize: 14.0, fontFamily: "Questrial-Regular"),
                onTap: () => print('THIRD CHILD'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.format_list_bulleted),
                    title: new Text('Balance'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.location_on),
                  title: new Text('ATM map'),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.content_paste),
                  title: new Text('Recurring Payments'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
