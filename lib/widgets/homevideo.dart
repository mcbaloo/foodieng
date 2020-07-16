import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/Home_Video/Home_Video_bloc.dart';
import 'package:foodieng/blocs/Home_Video/index.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_bloc.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_event.dart';
import 'package:foodieng/blocs/auth/auth_bloc/auth_bloc_state.dart';
import 'package:foodieng/screens/login_home.dart';
import 'package:foodieng/utils/login_util.dart';
import 'package:foodieng/utils/vidoesutil.dart';
import 'package:foodieng/widgets/error.dart';
import 'package:foodieng/widgets/loading.dart';
import 'package:foodieng/widgets/video_player.dart';

class HomeVideo extends StatefulWidget {
  HomeVideo({Key key}) : super(key: key);

  @override
  _HomeVideoState createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  VideoUtils videoUtil = VideoUtils();
  UserRepository repository = UserRepository();
  final HomeVideoBloc _homeBloc = HomeVideoBloc();
  AuthBlocBloc _authBlocBloc;
  void initState() {
    _homeBloc.add(Fetch());
    BlocProvider.of<AuthBlocBloc>(context).add(AppStarted());
    super.initState();
  }

  reloadPage() {
    _homeBloc.add(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeVideoBloc>(
          create: (BuildContext context) => HomeVideoBloc(),
        ),
        BlocProvider<AuthBlocBloc>(
          create: (BuildContext context) => AuthBlocBloc(repository),
        )
      ],
      child: BlocBuilder<HomeVideoBloc, HomeVideoState>(
        bloc: _homeBloc,
        builder: (context, state) {
          if (state is HomeVideoUninitialized) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: new SizedBox(
                          width: 40.0, height: 40.0, child: LoadingWidget())),
                ],
              ),
            );
          }
          if (state is ErrorHomeVideo) {
            return Error(action: () {
              reloadPage();
            });
          }
          if (state is HomeVideoLoaded) {
            if (state.videoModel.videoList == null) {
              return Center(
                child: Text(
                  'No Content at the moment',
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                ),
              );
            }
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 0, left: 8),
                  child: BlocBuilder<AuthBlocBloc, AuthBlocState>(
                    bloc: _authBlocBloc,
                    builder: (context, state) {
                      if (state is AuthAuthenticated) {
                        return LoginHome();
                      } else {
                        return Container(
                          child: null,
                        );
                      }
                    },
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: ListView.builder(
                      primary: false,
                      itemCount: state.videoModel.videoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return VideoPlayerWidget(
                          url: state.videoModel.videoList[index].videoUrl,
                          model: state.videoModel.videoList[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text(""),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Widget message(String mess, Color color, double height) => Center(
      child: Text(
        "Something went wrong.",
        style: TextStyle(
            color: Colors.red, fontSize: height, fontFamily: 'Roboto'),
      ),
    );
