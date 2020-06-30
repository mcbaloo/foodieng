import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/screens/login.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/widgets/guest_bottom.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            FontAwesomeIcons.times,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Account",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  divider(),
                  GestureDetector(
                    onTap: () =>
                        Navigator.push(context, FadeRoute(page: LoginPage())),
                    child: Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.account_circle,
                              size: 30,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          FontAwesomeIcons.solidAddressBook,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Your Channel",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.subscriptions,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Subscriptions",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Settings",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.feedback,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Feedback",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.help,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Help",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          FontAwesomeIcons.signOutAlt,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Sign Out",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: guestBottom(context),
    );
  }
}

Widget divider() => (Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Divider(
        height: 1,
        thickness: 2,
      ),
    ));
