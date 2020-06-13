import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/explore/explore_bloc.dart';
import 'package:foodieng/blocs/explore/index.dart';
import 'package:foodieng/widgets/comment.dart';
import 'package:foodieng/widgets/home_item.dart';

class Explore extends StatelessWidget {
  Explore({Key key}) : super(key: key);
  final _scalfordkey = new GlobalKey<ScaffoldState>();
  final ExploreBloc _exploreBloc = ExploreBloc();

  @override
  Widget build(BuildContext context) {
    void _onCommentTap() {
      BlocProvider.of<ExploreBloc>(context).add(CommentClicked());
    }

    List<IconData> _icons = [
      Icons.favorite,
      FontAwesomeIcons.comment,
      FontAwesomeIcons.share,
      FontAwesomeIcons.eye,
    ];
    return Scaffold(
        body: BlocListener<ExploreBloc, ExploreState>(
      listener: (context, state) {
        if (state is CommentClick) {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              isScrollControlled: true,
              context: context,
              builder: (builder) {
                return Comment();
              }).whenComplete(() => _exploreBloc.add(BottomSheetClosed()));
        }
      },
      child: BlocBuilder<ExploreBloc, ExploreState>(builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
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
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 6, 8),
                                        child: Icon(
                                          FontAwesomeIcons.fire,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 16, 16, 16),
                                        child: Text(
                                          'Trending',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 6, 8),
                                        child: Icon(
                                          Icons.library_books,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 16, 16, 16),
                                        child: Text(
                                          'Articles',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 6, 8),
                                        child: Icon(
                                          FontAwesomeIcons.list,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 16, 16, 16),
                                        child: Text(
                                          'Recipes',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 6, 8),
                                        child: Icon(
                                          Icons.video_library,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 16, 16, 16),
                                        child: Text(
                                          'Videos',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
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
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 16, 0, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "What's Trending ?",
                              style: TextStyle(
                                  fontFamily: "Gill Bold",
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15),
                            ),
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
                                      backgroundColor:
                                          Theme.of(context).accentColor,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                  height:
                                      MediaQuery.of(context).size.height / 3.5,
                                  //width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image(
                                      width: MediaQuery.of(context).size.width,
                                      //height: MediaQuery.of(context).size.height / 3,
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/default.png"),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: padwidget(20, context),
                                  right: padwidget(12, context),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color:
                                              Theme.of(context).primaryColor),
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
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      rowActivities(_icons[0], "247", context),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: rowActivities(
                                            _icons[1], "50", context),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: rowActivities(
                                            _icons[2], "60", context),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: rowActivities(
                                            _icons[3], "47", context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 5.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: RichText(
                                      //softWrap: false,
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: "Mcbaloo Bruno",
                                                style: TextStyle(
                                                    //fontWeight: FontWeight.bold,
                                                    fontFamily: "Gill Bold")),
                                            TextSpan(
                                                text:
                                                    "You guys need to Try this, A Buritto cake Flavored with Hot Chocolate... Hmmn Yummy!!!")
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, left: 8),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "View all 57 comments",
                                    style: TextStyle(
                                        fontFamily: "Gill",
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 2.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: RichText(
                                      //softWrap: false,
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: "Anita Baker",
                                                style: TextStyle(
                                                    //fontWeight: FontWeight.bold,
                                                    fontFamily: "Gill Bold")),
                                            TextSpan(text: "This is nice.")
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CircleAvatar(
                                    child: Text("A"),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      autofocus: false,
                                      onTap: () =>
                                          // BlocProvider.of<ExploreBloc>(
                                          //         context)
                                          //     .add(CommentClicked()),
                                          _onCommentTap(),
                                      decoration: InputDecoration(
                                        suffixIcon:
                                            Icon(FontAwesomeIcons.smile),
                                        hintText: 'Add a comment..',
                                        // errorText: (state is UsernameError)
                                        //     ? state.errorMessage
                                        //     : null,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 20.0, 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
