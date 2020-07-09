import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/appbar/appbar_state.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/screens/home.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/widgets/home_item.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LibraryBloc _libraryBloc = LibraryBloc();

    _libraryBloc.add(InitialLibraryEvent());

    void logOut() {
      _libraryBloc.add(LogOut());
      Navigator.pushAndRemoveUntil(
          context,
          FadeRoute(
              page: Home(
            isLogin: false,
          )),
          (route) => false);
    }

    void showAlertDialog(BuildContext context) {
      Widget cancelButton = FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        child: Text("Cancel"),
        onPressed: () => Navigator.pop(context),
      );

      Widget continueButton = FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          onPressed: () => logOut(),
          child: Text("Yes"));

      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Log Out"),
        content: Text("Are you sure you want to log out?"),
        actions: <Widget>[cancelButton, continueButton],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    SystemChrome.setEnabledSystemUIOverlays([]);
    return BlocProvider<LibraryBloc>(
        create: (context) {
          return LibraryBloc();
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            body: BlocListener<LibraryBloc, LibraryState>(
              listener: (context, state) {
                if (state is Relogin) {}
              },
              child: BlocBuilder<LibraryBloc, LibraryState>(
                  bloc: _libraryBloc,
                  builder: (context, state) => SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
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
                                  if (state is InLibraryState)
                                    Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      18, 8, 8, 8),
                                              child: CircleAvatar(
                                                radius: padwidget(22, context),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                child: (state.user
                                                            .profileImage !=
                                                        null)
                                                    ? Image(
                                                        image: NetworkImage(
                                                            state.user
                                                                .profileImage))
                                                    : Text(state
                                                        .user.firstName[0]),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16.0, 0, 0, 0),
                                              child: Text(
                                                state.user.firstName,
                                                style: TextStyle(
                                                    fontFamily: "Gill Bold",
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16.0, 4, 0, 0),
                                              child: Text(
                                                state.user.email,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Gill'),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  if (state is LibraryGuest)
                                    GestureDetector(
                                      onTap: () => Navigator.push(context,
                                          FadeRoute(page: LoginPage())),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
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
                                  if (state is InLibraryState)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                  if (state is InLibraryState)
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
                                  if (state is! IsGuest)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                  if (state is! IsGuest)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                  if (state is! IsGuest)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                  if (state is InLibraryState)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Icon(
                                            FontAwesomeIcons.signOutAlt,
                                            size: 30,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => showAlertDialog(context),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              "Sign Out",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
            )));
  }
}

Widget divider() => (Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Divider(
        height: 1,
        thickness: 2,
      ),
    ));
