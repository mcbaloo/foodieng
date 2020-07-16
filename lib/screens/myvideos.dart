import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/widgets/loading.dart';
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
    void showAlertDialog(BuildContext context, String content) {
      Widget continueButton = FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          onPressed: () => reloadContent(), //logOut(),
          child: Text("OK"));

      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Message"),
        content: Text('$content'),
        actions: <Widget>[continueButton],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return BlocProvider(
      create: (context) {
        return LibraryBloc();
      },
      child: BlocListener<LibraryBloc, LibraryState>(
        bloc: _libraryBloc,
        listener: (context, state) {
          if (state is DeleteStatus) {
            showAlertDialog(context, state.message.status);
          }
        },
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
              title: Text(
                "My Videos",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Gill Bold'),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                if (state is LibraryLoading)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: new SizedBox(
                            width: 40.0, height: 40.0, child: LoadingWidget())),
                  ),
                if (state is LibraryError)
                  Error(
                    action: () {
                      reloadContent();
                    },
                  ),
                if (state is UserContent)
                  if (state.videos.videoList.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Center(
                        child: Text(
                          'You havent uploaded any video',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Gill'),
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
                            userId: widget.userId,
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
