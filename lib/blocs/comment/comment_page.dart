import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/comment/index.dart';
import 'package:foodieng/widgets/comment.dart';

class CommentPage extends StatefulWidget {
  static const String routeName = '/comment';

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
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
