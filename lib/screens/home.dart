import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/widgets/home_item.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<IconData> _icons = [
    Icons.favorite,
    FontAwesomeIcons.comment,
    FontAwesomeIcons.share,
    FontAwesomeIcons.eye,
  ];

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          iconTheme: new IconThemeData(color: Theme.of(context).primaryColor),
          title: SizedBox(
            width: MediaQuery.of(context).size.width / 2.8,
            child: Image(
              fit: BoxFit.cover,
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
        body: Container(
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
                        backgroundImage: AssetImage("assets/images/82.png"),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: Text("Mcbaloo"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 2.0, 8, 0),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/default.png"),
                        )
                      ],
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
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
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
                    padding: EdgeInsets.fromLTRB(padwidget(20, context),
                        padwidget(35, context), padwidget(20, context), 0),
                    child: Text("Jollof Rice Receipe"),
                  )),
                ],
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(padwidget(20, context),
                          padwidget(70, context), padwidget(20, context), 8),
                      child: Text(
                          "Here is the reason why i have been trying to devekop this app. It is mainly because of the fact that flutter is sweet to implement and we will both enjoy it like that. No choice at all"),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    rowActivities(_icons[0], "247", context),
                    rowActivities(_icons[1], "50", context),
                    rowActivities(_icons[2], "60", context),
                    rowActivities(_icons[3], "47", context),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
                size: 20.0,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Home",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                FontAwesomeIcons.fire,
                size: 20.0,
                color: Color(0xff414D55),
              ),
              title:
                  Text("Trending", style: TextStyle(color: Color(0xFFB4C1C4))),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.subscriptions,
                size: 20.0,
                color: Color(0xff414D55),
              ),
              title:
                  Text("Library", style: TextStyle(color: Color(0xFFB4C1C4))),
            )
          ],
        ));
  }
}
