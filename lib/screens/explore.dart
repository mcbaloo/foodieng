import 'package:flutter/material.dart';
import 'package:foodieng/blocs/appbar/index.dart';
import 'package:foodieng/widgets/appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:foodieng/widgets/login_bottom_nav.dart';

class Explore extends StatelessWidget {
  const Explore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> _icons = [
      Icons.favorite,
      FontAwesomeIcons.comment,
      FontAwesomeIcons.share,
      FontAwesomeIcons.eye,
    ];
    return Scaffold(
      //appBar: designBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color(0xffEEEEEE),
              child: Column(
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 6, 8),
                                    child: Icon(
                                      FontAwesomeIcons.fire,
                                      size: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 16, 16, 16),
                                    child: Text('Trending'),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 6, 8),
                                    child: Icon(
                                      Icons.library_books,
                                      size: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 16, 16, 16),
                                    child: Text('Articles'),
                                  ),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 6, 8),
                                    child: Icon(
                                      FontAwesomeIcons.list,
                                      size: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 16, 16, 16),
                                    child: Text('Recipes'),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.green),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 6, 8),
                                    child: Icon(
                                      Icons.video_library,
                                      size: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 16, 16, 16),
                                    child: Text('Videos'),
                                  ),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 30, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("What's Trending?"),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 1,
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: MediaQuery.of(context).size.height / 3.5,
                            //width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image(
                                width: MediaQuery.of(context).size.width,
                                //height: MediaQuery.of(context).size.height / 3,
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/default.png"),
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
                                padwidget(25, context),
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
      ),
      bottomNavigationBar: bottomNav(context),
    );
  }
}
