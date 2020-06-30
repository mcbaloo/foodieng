import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieng/blocs/comment/index.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    Key key,
    @required CommentBloc commentBloc,
  })  : _commentBloc = commentBloc,
        super(key: key);

  final CommentBloc _commentBloc;

  @override
  CommentScreenState createState() {
    return CommentScreenState();
  }
}

class CommentScreenState extends State<CommentScreen> {
  CommentScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {}

  void _load() {
    //widget._commentBloc.add(LoadCommentEvent());
  }
}
