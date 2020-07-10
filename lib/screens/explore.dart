import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/comment/index.dart';
import 'package:foodieng/blocs/explore/explore_bloc.dart';
import 'package:foodieng/blocs/explore/index.dart';
import 'package:foodieng/models/user_response.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/widgets/comment.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:foodieng/widgets/homevideo.dart';
import 'package:foodieng/widgets/video_player.dart';
import 'package:foodieng/widgets/error.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  void initState() {
    BlocProvider.of<ExploreBloc>(context).add(Fetch());
    super.initState();
  }

  // AutomaticKeepAliveClientMixin
  // @override
  // bool get wantKeepAlive => true;
  void _onCommentTap(String contentId, UserResponse user) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Comment(
              commentId: contentId,
              user: user,
            );
          });
        });
    //.whenComplete(() => reloadPage());
  }

  void reloadPage() {
    BlocProvider.of<ExploreBloc>(context).add(Fetch());
  }

  void sortContent(String type) {
    BlocProvider.of<ExploreBloc>(context).add(GetExploreSearch(type: type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExploreBloc, ExploreState>(
      listener: (context, state) {
        // if (state is CommentClick) {

        // }
      },
      child: BlocBuilder<ExploreBloc, ExploreState>(builder: (context, state) {
        if (state is UnExploreState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: new SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                            backgroundColor: Theme.of(context).primaryColor))),
              ],
            ),
          );
        }
        if (state is ErrorExploreState) {
          return Error(action: () {
            reloadPage();
          });
        }
        if (state is InExploreState) {
          if (state.video.videoList == null) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  header(),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: Text(
                        'No Content at the moment',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                header(),
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
                Flexible(
                  child: ListView.builder(
                    primary: false,
                    itemCount: state.video.videoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          VideoPlayerWidget(
                            url: state.video.videoList[index].videoUrl,
                            model: state.video.videoList[index],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 5.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: RichText(
                                    //softWrap: false,
                                    text: TextSpan(
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Theme.of(context).primaryColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: state.video.videoList[index]
                                                  .uploader,
                                              style: TextStyle(
                                                  //fontWeight: FontWeight.bold,
                                                  fontFamily: "Gill Bold")),
                                          TextSpan(text: "  "),
                                          TextSpan(
                                              text: state.video.videoList[index]
                                                  .description)
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 16),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "View all comments",
                                  style: TextStyle(
                                      fontFamily: "Gill",
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 16.0, top: 2.0),
                          //   child: Row(
                          //     children: <Widget>[
                          //       Expanded(
                          //         child: RichText(

                          //           text: TextSpan(
                          //               style: TextStyle(
                          //                   fontSize: 15,
                          //                   color:
                          //                       Theme.of(context).primaryColor),
                          //               children: <TextSpan>[
                          //                 TextSpan(
                          //                     text: "Anita Baker",
                          //                     style: TextStyle(

                          //                         fontFamily: "Gill Bold")),
                          //                 TextSpan(text: "This is nice.")
                          //               ]),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: CircleAvatar(
                                    radius: padwidget(22, context),
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: Text(state.user.firstName[0]),
                                  )),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    onTap: () =>
                                        // BlocProvider.of<ExploreBloc>(
                                        //         context)
                                        //     .add(CommentClicked()),
                                        _onCommentTap(
                                            state.video.videoList[index]
                                                .contentId,
                                            state.user),
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(FontAwesomeIcons.smile),
                                      hintText: 'Add a comment..',
                                      // errorText: (state is UsernameError)
                                      //     ? state.errorMessage
                                      //     : null,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      }),
    );
  }

  Widget header() => SingleChildScrollView(
        child: Container(
          color: Color(0xffEEEEEE),
          child: Column(
            children: <Widget>[
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => reloadPage(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 6, 8),
                                  child: Icon(
                                    FontAwesomeIcons.fire,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 16, 16, 16),
                                  child: Text(
                                    'Trending',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => sortContent("Recipe"),
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
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 16, 16, 16),
                                  child: Text(
                                    'Recipes',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
