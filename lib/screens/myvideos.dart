import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/widgets/video_player.dart';
import 'package:foodieng/widgets/error.dart';

class MyVideo extends StatefulWidget {
  final String userId;
  MyVideo({@required this.userId});

  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  LibraryBloc _libraryBloc = LibraryBloc();
  void initState() {
    reloadContent();
    super.initState();
  }

  void reloadContent() {
    _libraryBloc.add(LoadUserContent(userId: widget.userId));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LibraryBloc();
      },
      child: BlocListener<LibraryBloc, LibraryState>(
        bloc: _libraryBloc,
        listener: (context, state) {},
        child: BlocBuilder<LibraryBloc, LibraryState>(
          bloc: _libraryBloc,
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 3,
              leading: IconButton(
                color: Theme.of(context).primaryColor,
                iconSize: MediaQuery.of(context).size.width / 12,
                onPressed: () => Navigator.pop(context, false),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Dispalying your Contents",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (state is LibraryLoading)
                  Center(
                      child: new SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: CircularProgressIndicator(
                              backgroundColor:
                                  Theme.of(context).primaryColor))),
                if (state is LibraryError)
                  Error(
                    action: () {
                      reloadContent();
                    },
                  ),
                if (state is UserContent)
                  if (state.videos.videoList.isEmpty)
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
                    )
                  else
                    Flexible(
                      child: ListView.builder(
                        itemCount: state.videos.videoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return VideoPlayerWidget(
                            url: state.videos.videoList[index].videoUrl,
                            model: state.videos.videoList[index],
                          );
                        },
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
