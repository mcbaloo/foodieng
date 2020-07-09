import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/Home_Video/index.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';
import 'package:foodieng/blocs/appbar/index.dart';
import 'package:foodieng/blocs/bottom_nav/index.dart';
import 'package:foodieng/blocs/comment/comment_bloc.dart';
import 'package:foodieng/blocs/comment/index.dart';
import 'package:foodieng/blocs/explore/explore_bloc.dart';
import 'package:foodieng/blocs/library/library_bloc.dart';
import 'package:foodieng/blocs/login/login/index.dart';
import 'package:foodieng/screens/account.dart';
import 'package:foodieng/screens/explore.dart';
import 'package:foodieng/screens/library.dart';
import 'package:foodieng/screens/likes.dart';
import 'package:foodieng/screens/login_home.dart';
import 'package:foodieng/screens/trending.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:foodieng/widgets/homevideo.dart';

class Home extends StatefulWidget {
  final bool isLogin;
  Home({Key key, @required this.isLogin}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  BottomNavBloc _bloc = BottomNavBloc();
  //bool isLogin;
  bool showAnimation = true;
  @override
  void initState() {
    super.initState();
    // repository.hasToken().then((value) => this.isLogin = value);
    Future.delayed(Duration(seconds: 5)).then((_) {
      setState(() {
        showAnimation = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _childrenGuest = [
      new HomeVideo(),
      new Trending(),
      new Library(),
    ];
    List<Widget> _childrenIsNotGuest = [
      new LoginHome(),
      new Explore(),
      new Trending(),
      //new Likes(),
      new Library(),
    ];
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppbarBloc>(
            create: (BuildContext context) => AppbarBloc(),
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),
          BlocProvider<HomeVideoBloc>(
            create: (BuildContext context) => HomeVideoBloc(),
          ),
          BlocProvider<TrendingVideoBloc>(
            create: (BuildContext context) => TrendingVideoBloc(),
          ),
          BlocProvider<ExploreBloc>(
            create: (BuildContext context) => ExploreBloc(),
          ),
          BlocProvider<LibraryBloc>(
            create: (BuildContext context) => LibraryBloc(),
          ),
          BlocProvider<CommentBloc>(
            create: (BuildContext context) => CommentBloc(),
          )
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<AppbarBloc, AppbarState>(
                listener: (context, state) {},
              ),
              BlocListener<CommentBloc, CommentState>(
                listener: (context, state) {},
              ),
              BlocListener<HomeVideoBloc, HomeVideoState>(
                listener: (context, state) {},
              ),
            ],
            child:
                BlocBuilder<AppbarBloc, AppbarState>(builder: (context, state) {
              if (state is IsGuest) {
                BlocProvider.of<AppbarBloc>(context).add(AppLoading());
              }
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
                              ? GestureDetector(
                                  onTap: () => Navigator.push(
                                      context, FadeRoute(page: Account())),
                                  child: CircleAvatar(
                                    radius: padwidget(22, context),
                                    backgroundColor: Colors.black,
                                    child: (state.user.profileImage != null)
                                        ? Image(
                                            image: NetworkImage(
                                                state.user.profileImage))
                                        : Text(state.user.firstName[0]),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => Navigator.push(
                                      context, FadeRoute(page: Account())),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 30.0,
                                  ),
                                )),
                    ],
                    elevation: 2,
                  ),
                  //designBar(context),
                  body: BlocBuilder<BottomNavBloc, BottomNavState>(
                      bloc: _bloc,
                      builder: (context, state) {
                        return (widget.isLogin == false)
                            ? _childrenGuest.elementAt(_bloc.currentIndex)
                            : _childrenIsNotGuest.elementAt(_bloc.currentIndex);
                      }),
                  bottomNavigationBar:
                      BlocBuilder<BottomNavBloc, BottomNavState>(
                          bloc: _bloc,
                          builder: (context, state) {
                            return BottomNavigationBar(
                              type: BottomNavigationBarType.fixed,
                              onTap: (index) =>
                                  _bloc.add(ItemTap(index: index)),
                              currentIndex: _bloc.currentIndex,
                              items: (widget.isLogin == false)
                                  ? [
                                      BottomNavigationBarItem(
                                        backgroundColor: Colors.white,
                                        icon: Icon(Icons.home,
                                            size: 25.0,
                                            color: _bloc.currentIndex == 0
                                                ? Color(0xff462618)
                                                : Color(0xFFB4C1C4)),
                                        title: Text("Home",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ),
                                      BottomNavigationBarItem(
                                        backgroundColor: Colors.white,
                                        icon: Icon(FontAwesomeIcons.fire,
                                            size: 25.0,
                                            color: _bloc.currentIndex == 1
                                                ? Color(0xff462618)
                                                : Color(0xFFB4C1C4)),
                                        title: Text("Trending",
                                            style: TextStyle(
                                                color: Color(0xFFB4C1C4))),
                                      ),
                                      BottomNavigationBarItem(
                                        backgroundColor: Colors.white,
                                        icon: Icon(Icons.subscriptions,
                                            size: 25.0,
                                            color: _bloc.currentIndex == 2
                                                ? Color(0xff462618)
                                                : Color(0xFFB4C1C4)),
                                        title: Text("Library",
                                            style: TextStyle(
                                                color: Color(0xFFB4C1C4))),
                                      )
                                    ]
                                  : [
                                      BottomNavigationBarItem(
                                        backgroundColor: Colors.white,
                                        icon: Icon(Icons.home,
                                            size: 25.0,
                                            color: _bloc.currentIndex == 0
                                                ? Color(0xff462618)
                                                : Color(0xFFB4C1C4)),
                                        title: Text("Home",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ),
                                      BottomNavigationBarItem(
                                        backgroundColor: Colors.white,
                                        icon: Icon(
                                          FontAwesomeIcons.compass,
                                          size: 25.0,
                                          color: _bloc.currentIndex == 1
                                              ? Color(0xff462618)
                                              : Color(0xFFB4C1C4),
                                        ),
                                        title: Text("Explore",
                                            style: TextStyle(
                                                color: Color(0xFFB4C1C4))),
                                      ),
                                      BottomNavigationBarItem(
                                          backgroundColor: Colors.white,
                                          icon: Icon(
                                            Icons.add_circle,
                                            size: 25.0,
                                            color: _bloc.currentIndex == 2
                                                ? Color(0xff462618)
                                                : Color(0xFFB4C1C4),
                                          ),
                                          title: Text('Vlog',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor))),
                                      // BottomNavigationBarItem(
                                      //   backgroundColor: Colors.white,
                                      //   icon: new Stack(children: <Widget>[
                                      //     new Icon(
                                      //       Icons.favorite,
                                      //       size: 25.0,
                                      //       color: _bloc.currentIndex == 3
                                      //           ? Color(0xff462618)
                                      //           : Color(0xFFB4C1C4),
                                      //     ),
                                      //     new Positioned(
                                      //       // top: -1.0,
                                      //       // right: -1.0,
                                      //       right: 0,
                                      //       child: new Container(
                                      //         padding: EdgeInsets.all(1),
                                      //         decoration: new BoxDecoration(
                                      //           color: Colors.red,
                                      //           borderRadius:
                                      //               BorderRadius.circular(6),
                                      //         ),
                                      //         constraints: BoxConstraints(
                                      //           minWidth: 12,
                                      //           minHeight: 12,
                                      //         ),
                                      //         child: new Text(
                                      //           '100',
                                      //           style: new TextStyle(
                                      //             color: Colors.white,
                                      //             fontSize: 11,
                                      //           ),
                                      //           textAlign: TextAlign.center,
                                      //         ),
                                      //       ),
                                      //     )
                                      //   ]),
                                      //   title: Text("Likes",
                                      //       style: TextStyle(
                                      //           color: Color(0xFFB4C1C4))),
                                      // ),
                                      BottomNavigationBarItem(
                                        backgroundColor: Colors.white,
                                        icon: Icon(Icons.subscriptions,
                                            size: 25.0,
                                            color: _bloc.currentIndex == 3
                                                ? Color(0xff462618)
                                                : Color(0xFFB4C1C4)),
                                        title: Text("Library",
                                            style: TextStyle(
                                                color: Color(0xFFB4C1C4))),
                                      )
                                    ],
                            );
                          }));
            })
            //ChildA(),
            ));
  }

  //bool get showLogo => isLogin == null || showAnimation;
}
