import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/models/action.dart';
import 'package:foodieng/models/videos.dart';
import 'package:foodieng/utils/vidoesutil.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final VideoModel model;
  final String userId;
  VideoPlayerWidget(
      {Key key, @required this.url, @required this.model, this.userId})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;
  VideoUtils videoUtils = VideoUtils();
  //ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void saveRecentVideo() {
    videoUtils.persistRecent(widget.model);
  }

  List<IconData> _icons = [
    Icons.favorite,
    FontAwesomeIcons.comment,
    FontAwesomeIcons.share,
    FontAwesomeIcons.eye,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        //color: Colors.red,
      ),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              CircleAvatar(
                radius: padwidget(16, context),
                backgroundColor: Theme.of(context).primaryColor,
                child: (widget.model.uploaderImg != null)
                    ? Image(image: NetworkImage(widget.model.uploaderImg))
                    : Text(widget.model.uploader[0]),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 0),
                      child: Text(
                        widget.model.uploader,
                        style: TextStyle(fontFamily: "Gill Bold", fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 2.0, 8, 0),
                      child: Text("Blogger",
                          style: TextStyle(color: Color(0xff989898))),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                flex: 9,
              ),
              Expanded(
                child: PopupMenuButton<actions>(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: actions.delete,
                        child: Row(
                          children: <Widget>[
                            Text("Delete"),
                            Icon(Icons.delete)
                          ],
                        )),
                    PopupMenuItem(value: actions.edit, child: Text("Delete2"))
                  ],
                  onSelected: (value) => _performAction(
                      value, context, widget.userId, widget.model.contentId),
                ),
                // child: Icon(Icons.more_vert),
                flex: 1,
              ),
            ]),
          ),
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: _controller.value.initialized
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AspectRatio(
                              aspectRatio: 1.8,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: VideoPlayer(_controller),
                                  ),
                                  VideoProgressIndicator(_controller,
                                      allowScrubbing: true)
                                ],
                              )),
                        ],
                      )
                    : Text(""),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                  child: FloatingActionButton(
                    heroTag: widget.model.contentId,
                    onPressed: () {
                      if (_controller.value.initialized) {
                        saveRecentVideo();
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      }
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: padwidget(20, context),
                right: padwidget(20, context),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                      child: Text(
                        widget.model.duration,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8, 8.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.model.title,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(timeago
                      .format(DateTime.parse(widget.model.uploadedDate))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                rowActivities(_icons[0], "0", context),
                rowActivities(_icons[1], "0", context),
                rowActivities(_icons[2], "0", context),
                rowActivities(_icons[3], "0", context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

void _deleteVideo(String userId, String contentId, BuildContext context) {
  BlocProvider.of<LibraryBloc>(context)
      .add(DeleteUserContent(userId: userId, contentId: contentId));
}

void _performAction(
    actions action, BuildContext context, String userId, String contentId) {
  switch (action) {
    case actions.delete:
      showAlertDialog(context, userId, contentId);
      break;
    default:
      print("text");
  }
}

void showAlertDialog(BuildContext context, String userId, String contentId) {
  Widget continueButton = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      onPressed: () => _deleteVideo(userId, contentId, context), //logOut(),
      child: Text("Yes"));
  Widget cancelButton = FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      onPressed: () => Navigator.pop(context), //logOut(),
      child: Text("No"));
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.delete),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Delete Item"),
        )
      ],
    ),
    content: Text("Are you sure you want to delete this content?"),
    actions: <Widget>[cancelButton, continueButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
