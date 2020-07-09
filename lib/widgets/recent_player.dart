import 'package:flutter/material.dart';
import 'package:foodieng/models/videos.dart';
import 'package:video_player/video_player.dart';

class RecentPlayer extends StatefulWidget {
  final String url;
  final VideoModel model;
  RecentPlayer({Key key, @required this.url, @required this.model})
      : super(key: key);

  @override
  _RecentPlayerState createState() => _RecentPlayerState();
}

class _RecentPlayerState extends State<RecentPlayer> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Stack(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: VideoPlayer(_controller),
                ),
                VideoProgressIndicator(_controller, allowScrubbing: true)
              ],
            ),
            // Image.asset(
            //   "assets/images/default.png",
            //   height: MediaQuery.of(context).size.height / 7,
            //   width: MediaQuery.of(context).size.height / 4.5,
            //   fit: BoxFit.cover,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value != null)
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
                bottom: 10,
                right: 8,
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
                    )))
          ],
        ),
      ),
    );
  }
}
