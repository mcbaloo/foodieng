import 'package:flutter/material.dart';
import 'package:foodieng/widgets/appbar.dart';
import 'package:foodieng/widgets/guest_bottom.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Trending extends StatefulWidget {
  Trending({Key key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  List<IconData> _icons = [
    Icons.favorite,
    FontAwesomeIcons.comment,
    FontAwesomeIcons.share,
    FontAwesomeIcons.eye,
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: designBar(context),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Center(
                              child: Icon(
                                Icons.book,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          Text("Articles")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Center(
                              child: Icon(
                                Icons.list,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          Text("Recipes")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Center(
                              child: Icon(
                                Icons.movie,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          Text("Movies")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: MediaQuery.of(context).size.width / 2,
                    //width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height / 3,
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/close.png"),
                      ),
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
                    padding: EdgeInsets.fromLTRB(padwidget(25, context),
                        padwidget(35, context), padwidget(20, context), 0),
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
                          child: rowActivities(_icons[0], "247", context),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: rowActivities(_icons[1], "50", context),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: rowActivities(_icons[2], "60", context),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: rowActivities(_icons[3], "47", context),
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
      ),
      // bottomNavigationBar: guestBottom(context),
    );
  }
}
