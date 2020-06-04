import 'package:flutter/material.dart';
import 'package:foodieng/blocs/appbar/index.dart';
import 'package:foodieng/widgets/appbar.dart';
import 'package:foodieng/widgets/login_bottom_nav.dart';

class Likes extends StatefulWidget {
  Likes({Key key}) : super(key: key);

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: designBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: Text("A"),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Tito Marie and Anita Baker just liked your video."),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(context),
    );
  }
}
