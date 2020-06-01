import 'package:flutter/material.dart';
import 'package:foodieng/models/videos.dart';
import 'package:foodieng/utils/vidoesutil.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/widgets/loading.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeVideo extends StatefulWidget {
  HomeVideo({Key key}) : super(key: key);

  @override
  _HomeVideoState createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  Future<VideoModel> VideoListFuture;
  VideoUtils videos = new VideoUtils();
  VideoPlayerController _controller;
  void initState() {
    setState(() {
      VideoListFuture = videos.getAllVideos();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VideoModel>(
      future: VideoListFuture,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data.videoList != null) {
              if (snapshot.data.videoList.length > 0) {
                return Row(
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                        itemCount: snapshot.data.videoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (videoItemUi(snapshot.data.videoList[index],
                              context, _controller));
                        },
                      ),
                    )
                  ],
                );
              } else {
                return message("No Data at the moment", Colors.green,
                    MediaQuery.of(context).size.width / 20);
              }
            } else {
              return message("No Data at the moment", Colors.green,
                  MediaQuery.of(context).size.width / 20);
            }
          } else {
            return message("No Data at the moment", Colors.green,
                MediaQuery.of(context).size.width / 20);
          }
        } else if (snapshot.hasError) {
          return message("Something went wrong", Colors.red,
              MediaQuery.of(context).size.width / 20);
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}

Widget message(String mess, Color color, double height) => Center(
      child: Text(
        "Something went wrong.",
        style: TextStyle(
            color: Colors.red, fontSize: height, fontFamily: 'Roboto'),
      ),
    );
Widget videoItemUi(
    VideoModel model, BuildContext context, VideoPlayerController _controller) {
  _controller = VideoPlayerController.network(model.videoUrl)
    ..initialize().then((_) {
      print("when your thumbnail will show");
    });
  List<IconData> _icons = [
    Icons.favorite,
    FontAwesomeIcons.comment,
    FontAwesomeIcons.share,
    FontAwesomeIcons.eye,
  ];
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      //color: Colors.red,
    ),
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  //foregroundColor: Colors.red,
                  radius: padwidget(16, context),
                  backgroundColor: Theme.of(context).primaryColor,
                  //backgroundImage: Text("")
                  child: (model.uploaderImg != null)
                      ? Image(image: NetworkImage(model.uploaderImg))
                      : Text(model.uploader[0]),
                  //Text("A"),
                  //AssetImage("assets/images/82.png"),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                        child: Text(model.uploader),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8, 0),
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
              //height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 1.8,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: VideoPlayer(_controller))),

                  // Image(
                  //   image: AssetImage("assets/images/default.png"),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                  child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                //padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                //padding: EdgeInsets.all(65.0),
                color: Colors.transparent,
                textColor: Colors.white,
                onPressed: () {
                  // Wrap the play or pause in a call to `setState`. This ensures the
                  // correct icon is shown.
                  // setState(() {
                  //   // If the video is playing, pause it.
                  //   if (_controller.value.isPlaying) {
                  //     _controller.pause();
                  //   } else {
                  //     // If the video is paused, play it.
                  //     _controller.play();
                  //   }
                  // });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 70.0,
                ),
              )),
            ),
            Positioned(
              bottom: padwidget(20, context),
              right: padwidget(12, context),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    child: Text(
                      model.duration,
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
                    model.title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:
                      Text(timeago.format(DateTime.parse(model.uploadedDate))),
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
