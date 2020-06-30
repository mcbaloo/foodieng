import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/models/videos.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final VideoModel model;
  VideoPlayerWidget({Key key, @required this.url, @required this.model})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController _controller;
  //ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
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
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                            style: TextStyle(
                                fontFamily: "Gill Bold", fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 2.0, 8, 0),
                          child: Text("Life Blogger",
                              style: TextStyle(color: Color(0xff989898))),
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
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(timeago
                        .format(DateTime.parse(widget.model.uploadedDate))),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
