import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/comment/index.dart';
import 'package:foodieng/blocs/explore/index.dart';
import 'package:foodieng/widgets/comment.dart';

class ExplorePage extends StatefulWidget {
  static const String routeName = '/explore';

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return CommentBloc();
        },
        child: Comment(
          commentId: "",
        ),
      ),
    );
  }
}
