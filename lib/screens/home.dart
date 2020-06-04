import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/appbar/index.dart';
import 'package:foodieng/blocs/home_bloc.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/models/videos.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/screens/trending.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/utils/vidoesutil.dart';
import 'package:foodieng/widgets/appbar.dart';
import 'package:foodieng/widgets/homevideo.dart';
import 'dart:async';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppbarBloc _bloc = AppbarBloc();
  int _currentIndex = 0;
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppbarBloc>(
            create: (BuildContext context) => AppbarBloc(),
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),
          // BlocProvider<BlocC>(
          //   create: (BuildContext context) => BlocC(),
          // ),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<AppbarBloc, AppbarState>(
                listener: (context, state) {},
              ),
              // BlocListener<BlocB, BlocBState>(
              //   listener: (context, state) {},
              // ),
              // BlocListener<BlocC, BlocCState>(
              //   listener: (context, state) {},
              // ),
            ],
            child:
                BlocBuilder<AppbarBloc, AppbarState>(builder: (context, state) {
              if (state is IsGuest) {
                BlocProvider.of<AppbarBloc>(context).add(AppLoading());
              }
              //print(state);
              return Scaffold(
                  resizeToAvoidBottomPadding: false,
                  backgroundColor: Theme.of(context).accentColor,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    centerTitle: false,
                    iconTheme: new IconThemeData(
                        color: Theme.of(context).primaryColor),
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: Image(
                        image: AssetImage("assets/images/foodieng_logo.png"),
                      ),
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 30.0,
                        ),
                        onPressed: () =>
                            {showSearch(context: context, delegate: null)},
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: (state is ISLoggedIn)
                              ? IconButton(
                                  onPressed: () => {
                                    Navigator.push(
                                        context, FadeRoute(page: Account()))
                                  },
                                  icon: Icon(
                                    Icons.account_circle,
                                    size: 30.0,
                                  ),
                                )
                              : Text(
                                  state.toString(),
                                  style: TextStyle(color: Colors.red),
                                ))
                    ],
                    elevation: 2,
                  ),
                  //designBar(context),
                  body: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                    return (state is LoginInitial)
                        ? Container(
                            child: Center(
                              child: Text("Here"),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: IndexedStack(
                              children: <Widget>[
                                HomeVideo(),
                                Trending(),
                              ],
                              index: _currentIndex,
                            ),
                          );
                  }),
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    onTap: onTappedBar,
                    currentIndex: _currentIndex,
                    //fixedColor: Theme.of(context).primaryColor,
                    items: [
                      BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: Icon(Icons.home,
                            size: 20.0,
                            color: _currentIndex == 0
                                ? Theme.of(context).primaryColor
                                : Color(0xFFB4C1C4)),
                        title: Text("Home",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: Icon(FontAwesomeIcons.fire,
                            size: 20.0,
                            color: _currentIndex == 1
                                ? Theme.of(context).primaryColor
                                : Color(0xFFB4C1C4)),
                        title: Text("Trending",
                            style: TextStyle(color: Color(0xFFB4C1C4))),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.white,
                        icon: Icon(Icons.subscriptions,
                            size: 20.0,
                            color: _currentIndex == 2
                                ? Theme.of(context).primaryColor
                                : Color(0xFFB4C1C4)),
                        title: Text("Library",
                            style: TextStyle(color: Color(0xFFB4C1C4))),
                      )
                    ],
                  ));
            })
            //ChildA(),
            ));
  }
}
