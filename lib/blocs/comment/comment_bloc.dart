import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/comment/index.dart';
import 'package:foodieng/models/comment.dart';
import 'package:foodieng/utils/comment_util.dart';
import 'package:foodieng/utils/login_util.dart';
import 'package:foodieng/utils/ValidationMixin.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState>
    with ValidationMixin {
  CommentUtil commentUtil = CommentUtil();
  InCommentState cur = InCommentState(comments: null);
  UserRepository userRepository = UserRepository();
  @override
  CommentState get initialState => CommentInitialized();

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is LoadCommentEvent) {
      //
      yield CommentInitialized();
      try {
        final commentObj = await commentUtil.getAllComments(event.commentId);
        yield InCommentState(comments: commentObj);
      } catch (_) {
        yield ErrorCommentState("Error Occured");
      }
    }
    if (event is AddComment) {
      yield InCommentSubmit();
      try {
        final user = await userRepository.getDetails();
        final comment = PostComment(
            comment: event.comment,
            contentId: event.contentId,
            userId: user.userId);
        final response = await commentUtil.addComment(comment);

        if (response.comment != null) {
          final commentObj = await commentUtil.getAllComments(event.contentId);
          yield InCommentState(comments: commentObj);
        } else {
          yield CommentTextError("Comment not submitted. Try again");
        }
      } catch (_) {
        yield ErrorCommentState("Error Occured");
      }
    }
  }
}
