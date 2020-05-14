import 'package:flutter/material.dart';
import 'package:foodieng/widgets/appbar.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:foodieng/widgets/login_bottom_nav.dart';

class LoginHome extends StatefulWidget {
  LoginHome({Key key}) : super(key: key);

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  List<IconData> _icons = [
    Icons.favorite,
    FontAwesomeIcons.comment,
    FontAwesomeIcons.share,
    FontAwesomeIcons.eye,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          iconTheme: new IconThemeData(color: Theme.of(context).primaryColor),
          title: SizedBox(
            width: MediaQuery.of(context).size.width / 2.8,
            child: Image(
              image: AssetImage("assets/images/foodieng_logo.png"),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {showSearch(context: context, delegate: null)},
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Icon(Icons.account_circle),
            )
          ],
          elevation: 2,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "View All >>",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            //color: Color(0xff414D55),
                            borderRadius: BorderRadius.circular(16)),
                        child: GridTile(
                          child: Image(
                            fit: BoxFit.fitHeight,
                            colorBlendMode: BlendMode.softLight,
                            image: AssetImage("assets/images/bowl.png"),
                          ),
                          footer: GridTileBar(
                            title: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "Werey",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                              child: Text("Flowing"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: GridTile(
                          child: Image(
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.softLight,
                            image: AssetImage("assets/images/chicken.png"),
                          ),
                          footer: GridTileBar(
                            title: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "Werey",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                              child: Text("Flowing"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: GridTile(
                          child: Image(
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.softLight,
                            image: AssetImage("assets/images/cooking.png"),
                          ),
                          footer: GridTileBar(
                            title: Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                              child: Text(
                                "Werey",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                              child: Text("Flowing"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: GridTile(
                          child: Image(
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.softLight,
                            image: AssetImage("assets/images/basin.png"),
                          ),
                          footer: GridTileBar(
                            title: Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                              child: Text(
                                "Werey",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 10),
                              child: Text("Flowing"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                radius: padwidget(16, context),
                                backgroundColor: Theme.of(context).accentColor,
                                backgroundImage:
                                    AssetImage("assets/images/82.png"),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0, 8, 0),
                                      child: Text("Mcbaloo"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 2.0, 8, 0),
                                      child: Text("Life Blogger"),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                                flex: 9,
                              ),
                              Expanded(
                                child: Icon(Icons.more_vert),
                                flex: 1,
                              ),
                            ]),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              //width: 10,
                              fit: BoxFit.contain,
                              image: AssetImage("assets/images/default.png"),
                            ),
                          ),
                          Positioned(
                            bottom: padwidget(20, context),
                            right: padwidget(12, context),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Theme.of(context).primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 4.0, 8.0, 4.0),
                                  child: Text(
                                    "3:14",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                padwidget(15, context),
                                padwidget(35, context),
                                padwidget(20, context),
                                0),
                            child: Text("Jollof Rice Receipe"),
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      rowActivities(_icons[0], "247", context),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      rowActivities(_icons[1], "50", context),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      rowActivities(_icons[2], "60", context),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      rowActivities(_icons[3], "47", context),
                                ),
                              ],
                            ),
                            Text("View More")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: bottomNav(context));
  }
}
