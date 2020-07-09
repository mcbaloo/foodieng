import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/blocs/library/library_bloc.dart';
import 'package:foodieng/screens/myvideos.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/widgets/recent_player.dart';
import 'package:foodieng/widgets/signin_needed.dart';
import 'package:foodieng/widgets/upload_video.dart';

class Library extends StatefulWidget {
  const Library({Key key}) : super(key: key);
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final LibraryBloc _libraryBloc = LibraryBloc();
  @override
  void initState() {
    super.initState();
    _libraryBloc.add(InitialLibraryEvent());
  }

  @override
  void dispose() {
    super.dispose();
    //_libraryBloc.dispose();
  }

  void _onUploadTap(String userId) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return UploadVideo(
              userId: userId,
            );
          });
        });
    //.whenComplete(() => reloadPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<LibraryBloc, LibraryState>(
          listener: (context, state) {},
          child: BlocBuilder<LibraryBloc, LibraryState>(
            bloc: _libraryBloc,
            builder: (context, state) {
              if (state is LibraryGuest) {
                return Signin();
              }
              if (state is InLibraryState) {
                //if (state is LibraryGuest) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 8),
                        child: Text(
                          "Recent",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Gill",
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      if (state.video.videoList.isNotEmpty)
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16.0, 16.0, 0, 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16)),
                                  width:
                                      MediaQuery.of(context).size.height / 4.5,
                                  child: Column(
                                    children: <Widget>[
                                      RecentPlayer(
                                        url: state
                                            .video.videoList[index].videoUrl,
                                        model: state.video.videoList[index],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: Text(state.video
                                                  .videoList[index].title)),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                                child: Text(state
                                                    .video
                                                    .videoList[index]
                                                    .uploader)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: state.video.videoList.length,
                          ),
                        ),
                      Divider(
                        color: Color(0xffEEEEEE),
                        thickness: 1.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16, 8, 16),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text("History",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                      fontFamily: "Gill")),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16, 8, 16),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.file_download, size: 28),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                children: <Widget>[
                                  Text("Favorites"),
                                  Text("0 Video")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 16, 8, 16),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.video_label),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  FadeRoute(
                                      page: MyVideo(
                                    userId: state.user.userId,
                                  ))),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text("Your Videos"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 16, 8, 16),
                        child: GestureDetector(
                          onTap: () => _onUploadTap(state.user.userId),
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.upload),
                              Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: Text("Share Video"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xffEEEEEE),
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8, bottom: 8, right: 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Viewlists",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Recently added",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 8),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Color(0xff48B589),
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      "New list",
                                      style:
                                          TextStyle(color: Color(0xff48B589)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 12,
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                            "assets/images/food2.jpeg")),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("Spaghetti Bolognaise",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontFamily: "Gill Bold")),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Text(
                                            "Eric Thompson 12 videos",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontFamily: "Gill"),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

              return Center(
                  child: new SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor)));
            },
          ),
        ));

    //Signin(),
  }
}
