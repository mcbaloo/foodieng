import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/comment/comment_bloc.dart';
import 'package:foodieng/blocs/comment/index.dart';
import 'package:foodieng/models/comment.dart';
import 'package:foodieng/models/user_response.dart';
import 'package:foodieng/widgets/error.dart';
import 'package:foodieng/widgets/home_item.dart';
import 'package:foodieng/widgets/loading.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comment extends StatefulWidget {
  final String commentId;
  final UserResponse user;
  Comment({@required this.commentId, @required this.user});

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final _commentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CommentBloc _commentBloc = CommentBloc();
  void initState() {
    _commentBloc.add((LoadCommentEvent(commentId: widget.commentId)));
    _commentController.addListener(_onCommentChanged);
    super.initState();
  }

  void _onCommentChanged() {
    _commentBloc.add(CommentTextChange(text: _commentController.text));
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  reloadPage() {
    _commentBloc.add((LoadCommentEvent(commentId: widget.commentId)));
  }

  void _addComment() {
    if (_formKey.currentState.validate()) {
      _commentBloc.add(AddComment(
          contentId: widget.commentId, comment: _commentController.text));
    }
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CommentBloc();
      },
      child: BlocListener<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is CommentTextError) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('${state.errorMessage}'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 4),
            ));
          }
        },
        child: BlocBuilder<CommentBloc, CommentState>(
          bloc: _commentBloc,
          builder: (context, state) {
            if (state is CommentInitialized) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.15,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverPadding(
                        padding: EdgeInsets.only(top: 32),
                      ),
                      SliverToBoxAdapter(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 20,
                                child: LoadingWidget(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is ErrorCommentState) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Error(action: () {
                  reloadPage();
                }),
              );
            }
            if (state is InCommentState) {
              if (state.comments.commentList.isEmpty) {
                return Container(
                  height: MediaQuery.of(context).size.height / 1.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("No Comment")),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: padwidget(22, context),
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        child: Text(widget.user.firstName[0]),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.text,
                                            autofocus: false,
                                            controller: _commentController,
                                            validator: (String value) {
                                              if (value.trim().isEmpty) {
                                                return 'Text cannot be Empty';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon:
                                                  Icon(FontAwesomeIcons.smile),
                                              hintText: 'Add a comment..',
                                              // errorText: (state is UsernameError)
                                              //     ? state.errorMessage
                                              //     : null,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 10.0, 20.0, 10.0),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32.0),
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.5,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                          backgroundColor: Color(0xffE4E4E4),
                                          child: IconButton(
                                            onPressed: () => _addComment(),
                                            icon: Icon(
                                              Icons.send,
                                              color: Colors.black,
                                            ),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Container(
                                            child: state is InCommentSubmit
                                                ? CircularProgressIndicator(
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                  )
                                                : null),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height / 1.15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Comments",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(FontAwesomeIcons.times),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffE4E4E4),
                      thickness: 1.5,
                    ),
                    Flexible(
                      child: ListView.builder(
                          primary: false,
                          itemCount: state.comments.commentList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return commentBody(
                                state.comments.commentList[index]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: padwidget(22, context),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: (widget.user.profileImage != null)
                                      ? Image(
                                          image: NetworkImage(
                                              widget.user.profileImage))
                                      : Text(widget.user.firstName[0]),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      autofocus: false,
                                      controller: _commentController,
                                      validator: (String value) {
                                        if (value.trim().isEmpty) {
                                          return 'Text cannot be Empty';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon:
                                            Icon(FontAwesomeIcons.smile),
                                        hintText: 'Add a comment..',
                                        // errorText: (state is UsernameError)
                                        //     ? state.errorMessage
                                        //     : null,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 20.0, 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                    backgroundColor: Color(0xffE4E4E4),
                                    child: IconButton(
                                      onPressed: () => _addComment(),
                                      icon: Icon(
                                        Icons.send,
                                        color: Colors.black,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Container(
                                      child: state is InCommentSubmit
                                          ? LoadingWidget()
                                          : null),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            // ignore: unnecessary_statements
            if (state is InCommentSubmit)
              return Container(
                height: MediaQuery.of(context).size.height / 1.15,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverPadding(
                        padding: EdgeInsets.only(top: 32),
                      ),
                      SliverToBoxAdapter(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Column(
                            children: <Widget>[
                              Container(height: 20, child: LoadingWidget()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

            return CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget commentBody(CommentModel model) => Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: (model.commenterImage != null)
                  ? Image(image: NetworkImage(model.commenterImage))
                  : Text(model.commenter[0]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Color(0xffE4E4E4),
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 8, 8, 4),
                        child: Text(
                          model.commenter,
                          style: TextStyle(fontFamily: "Gill Bold"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 6, 8, 8),
                        child: Text(model.comment),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(timeago.format(
                          DateTime.parse(model.dateCreated.toString()),
                          locale: 'en_short')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Like"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Reply"),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
