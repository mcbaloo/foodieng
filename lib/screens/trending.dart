import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';
import 'package:foodieng/utils/vidoesutil.dart';
import 'package:foodieng/widgets/video_player.dart';
import 'package:foodieng/widgets/error.dart';

class Trending extends StatefulWidget {
  Trending({Key key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  VideoUtils videoUtil = VideoUtils();
  final TrendingVideoBloc _trendingBloc = TrendingVideoBloc();
  void initState() {
    sortContent(type: "Video");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void sortContent({@required String type}) {
    _trendingBloc.add(Fetch(type: type));
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
              //TrendingVideoLoaded loaded = TrendingVideoLoaded();
              return Error(
                action: () {
                  sortContent(type: "Video");
                },
              );
            }
            if (state is TrendingVideoLoaded) {
              if (state.videoModel.videoList == null) {
                return Column(
                  children: <Widget>[
                    header(state),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
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
                );
              }
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                    children: <Widget>[
                      header(state),
                      Flexible(
                        child: ListView.builder(
                          itemCount: state.videoModel.videoList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return VideoPlayerWidget(
                              url: state.videoModel.videoList[index].videoUrl,
                              model: state.videoModel.videoList[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ));
            }
            return header(state);
          },
        ));
  }

  Widget header(TrendingVideoLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => sortContent(type: "Video"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: (state.tapIndex == 1)
                        ? Color(0xff462618)
                        : Color(0xFFB4C1C4),
                    child: Center(
                      child: Icon(
                        Icons.movie,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Text("Videos")
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => sortContent(type: "Recipe"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: (state.tapIndex == 2)
                        ? Color(0xff462618)
                        : Color(0xFFB4C1C4),
                    child: Center(
                      child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Text("Recipes")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
