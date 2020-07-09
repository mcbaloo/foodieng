import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/Home_Video/index.dart';
import 'package:foodieng/widgets/video_player.dart';
import 'package:foodieng/widgets/error.dart';

class LoginHome extends StatefulWidget {
  LoginHome();

  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final HomeVideoBloc _homeBloc = HomeVideoBloc();
  void initState() {
    _homeBloc.add(Fetch());
    super.initState();
  }

  void reloadPage() {
    _homeBloc.add(Fetch());
  }

  void getReceipeType(String type) {
    _homeBloc.add(FetchReceipe(type: type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeVideoBloc, HomeVideoState>(
      bloc: _homeBloc,
      builder: (context, state) => Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            if (state is! VideoPlaying)
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => reloadPage(),
                            child: Text(
                              "View All  >>",
                              style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      primary: false,
                      shrinkWrap: true,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => getReceipeType("French Rice"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/french_rice.jpg",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "French Rice",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getReceipeType("Jollof Rice"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/jollof_rice.jpg",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Jollof Rice",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getReceipeType("Pizza"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/pizza.jpg",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Pizza",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getReceipeType("Lemon Chicken"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/lemon_chicken.jpg",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Lemon Chicken",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getReceipeType("Spicy Sausage"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/spicy_sausage.png",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Spicy Sausage & Cabbage Soup",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getReceipeType("Indian Lentil"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/Indian_lentil.jpg",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Indian Lentil",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getReceipeType("Banana Colada"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/banana_colada.jpeg",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Banana Colada",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getReceipeType("Greek Salad"),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/greek_salad.jpg",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        // Add one stop for each color. Stops should increase from 0 to 1
                                        stops: [0.2, 0.7],
                                        colors: [
                                          Color.fromARGB(100, 0, 0, 0),
                                          Color.fromARGB(100, 0, 0, 0),
                                        ],
                                        // stops: [0.0, 0.1],
                                      ),
                                    ),
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.height / 6,
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      padding: EdgeInsets.all(1),
                                      constraints: BoxConstraints(
                                          minHeight: 20, minWidth: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              "Greek Salad",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            if (state is ErrorHomeVideo)
              Flexible(
                child: Error(action: () {
                  reloadPage();
                }),
              ),
            if (state is HomeVideoUninitialized)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Processing .......",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: LinearProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            if (state is HomeVideoLoaded)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Showing",
                      style: TextStyle(fontFamily: "Gill Bold", fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          state.type,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            if (state is HomeVideoLoaded)
              if (state.videoModel.videoList.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "No Content at the Moment",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              else
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
        ),
      ),
    );
  }
}
