import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'Send2.dart';

class SendDetailsScreen extends StatefulWidget {
  @override
  _SendDetailsScreenState createState() => _SendDetailsScreenState();
}

class _SendDetailsScreenState extends State<SendDetailsScreen>
    with SingleTickerProviderStateMixin {
  String ammountValue = '0.00';
  bool showAddNote = false;
  bool showPageLoader = false;
  bool showSpinner = false;
  bool showChecked = false;
  AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animationController.addListener(() {
      if (animationController.status.toString() ==
          'AnimationStatus.completed') {
        setState(() {
          showSpinner = false;
          showChecked = true;
        });
        Timer(
          Duration(seconds: 1),
          () => setState(() {
            showPageLoader = false;
            Navigator.of(context).pop();
          }),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _startPayment() {
    setState(() {
      showPageLoader = true;
      showSpinner = true;
      animationController.forward();
    });
  }

  Widget _showPageLoader() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 10,
              sigmaX: 10,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        showSpinner
            ? Align(
                alignment: Alignment.center,
              )
            : Container(),
        showSpinner
            ? Align(
                alignment: Alignment.center,
                child: RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 2.0).animate(animationController),
                  child: Image.asset('assets/images/loading.png'),
                ),
              )
            : Container(),
        showChecked
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/checked.png'),
                    SizedBox(height: 20),
                    Material(
                      child: Text(
                        'Transaction Successful',
                        style: TextStyle(
                            fontFamily: "Questrial-Regular",
                            fontSize: 17,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width: 150,
        child: Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context, false),
                ),
                title: Text('Send to John Walker',
                    style: TextStyle(
                        fontFamily: "Questrial-Regular", color: Colors.black)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'John Walker',
                        style: TextStyle(
                            fontFamily: "Questrial-Regular",
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 25,
                        child: FlatButton(
                          color: Color.fromRGBO(53, 161, 138, 1),
                          textColor: Colors.white,
                          child: Text(
                            "@johnwalker",
                            style: TextStyle(
                                fontFamily: "Questrial-Regular",
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                      fontFamily: "Questrial-Regular",
                                      fontSize: 17),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'EUR',
                                      style: TextStyle(
                                          fontFamily: "Questrial-Regular",
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    InkWell(
                                      child: Text(
                                        this.ammountValue,
                                        style: TextStyle(
                                            fontFamily: "Questrial-Regular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onTap: () async {
                                        var navigationResult =
                                            await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Send2(),
                                            fullscreenDialog: true,
                                          ),
                                        );
                                        setState(() {
                                          this.ammountValue =
                                              navigationResult.toString();
                                          if (navigationResult.toString() !=
                                              '0.0') {
                                            this.showAddNote = true;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(height: 0.1, color: Colors.grey),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Transaction fees',
                                  style: TextStyle(
                                      fontFamily: "Questrial-Regular",
                                      fontSize: 17),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'EUR',
                                      style: TextStyle(
                                          fontFamily: "Questrial-Regular",
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '0.00',
                                      style: TextStyle(
                                          fontFamily: "Questrial-Regular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(height: 0.1, color: Colors.grey),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset('assets/images/activobank.png'),
                                Spacer(flex: 1),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Activo Bank',
                                      style: TextStyle(
                                          fontFamily: "Questrial-Regular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Account 89301-7',
                                      style: TextStyle(
                                          fontFamily: "Questrial-Regular",
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Spacer(flex: 5),
                                Icon(Icons.chevron_right,
                                    color: Colors.grey, size: 40),
                              ],
                            ),
                            SizedBox(height: 1),
                            Divider(height: 0.1, color: Colors.grey),
                            SizedBox(height: 30),
                            Opacity(
                              opacity: this.showAddNote ? 1.0 : 0.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Add Note',
                                    style: TextStyle(
                                        fontFamily: "Questrial-Regular",
                                        fontSize: 17,
                                        color: Color.fromRGBO(53, 161, 138, 1)),
                                  ),
                                  Icon(Icons.chevron_right,
                                      color: Colors.grey, size: 40),
                                ],
                              ),
                            ),
                            SizedBox(height: 1),
                            Opacity(
                              opacity: this.showAddNote ? 1.0 : 0.0,
                              child: Divider(height: 0.1, color: Colors.grey),
                            ),
                            SizedBox(height: 30),
                            Opacity(
                              // opacity: 1.0,
                              opacity: this.showAddNote ? 1.0 : 0.0,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: FlatButton(
                                  color: Color.fromRGBO(53, 161, 138, 1),
                                  textColor: Color.fromRGBO(53, 161, 138, 1),
                                  disabledColor: Colors.grey,
                                  child: Text(
                                    "Send Now",
                                    style: TextStyle(
                                        fontFamily: "Questrial-Regular",
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  onPressed: () => _startPayment(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            showPageLoader ? _showPageLoader() : Container(),
          ],
        ),
      ),
    );
  }
}
