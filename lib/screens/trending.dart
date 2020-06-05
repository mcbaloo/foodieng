import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';
import 'package:foodieng/utils/vidoesutil.dart';
import 'package:foodieng/widgets/appbar.dart';
import 'package:foodieng/widgets/guest_bottom.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/widgets/homevideo.dart';
import 'package:video_player/video_player.dart';

class Trending extends StatefulWidget {
  Trending({Key key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  VideoUtils videoUtil = VideoUtils();
  final TrendingVideoBloc _trendingBloc = TrendingVideoBloc();
  VideoPlayerController _controller;
  void initState() {
    print("here");
    _trendingBloc.add(Fetch(type: "video"));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  Widget build(BuildContext context) {
    return BlocListener<TrendingVideoBloc, TrendingVideoState>(
        listener: (context, state) {},
        child: BlocBuilder<TrendingVideoBloc, TrendingVideoState>(
          bloc: _trendingBloc,
          builder: (context, state) {
            if (state is TrendingVideoUnInitialized) {
              return Center(
                  child: new SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor)));
            }
            if (state is ErrorTrendingVideoState) {
              return Column(
                children: <Widget>[
                  header(),
                  Center(
                    child: Text(
                      'An Error Occureds',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ),
                ],
              );
            }
            if (state is TrendingVideoLoaded) {
              if (state.videoModel.videoList.isEmpty) {
                return Column(
                  children: <Widget>[
                    header(),
                    Center(
                      child: Text(
                        'No Content at the moment',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                );
              }
              return Scaffold(
                  body: Column(
                children: <Widget>[
                  header(),
                  Flexible(
                    child: ListView.builder(
                      itemCount: state.videoModel.videoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return (videoItemUi(state.videoModel.videoList[index],
                            context, _controller));
                      },
                    ),
                  ),
                ],
              ));
            }
            return header();
          },
        ));
  }
}

Widget header() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff767261),
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
                backgroundColor: Color(0xff767261),
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
                backgroundColor: Color(0xff767261),
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
  );
}
