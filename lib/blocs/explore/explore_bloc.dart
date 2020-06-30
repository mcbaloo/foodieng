import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/explore/index.dart';
import 'package:foodieng/utils/login_util.dart';
import 'package:foodieng/utils/vidoesutil.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  VideoUtils videoUtils = VideoUtils();
  UserRepository userRepository = UserRepository();
  @override
  ExploreState get initialState => UnExploreState();

  @override
  Stream<ExploreState> mapEventToState(
    ExploreEvent event,
  ) async* {
    if (event is CommentClicked) {
      //yield UnExploreState();
      yield CommentClick(commnetId: event.commentId);
    }

    if (event is Fetch) {
      yield UnExploreState();
      try {
        final videos = await videoUtils.getAllVideos();
        final user = await userRepository.getDetails();
        yield InExploreState(video: videos, user: user, type: "Trending");
      } catch (_) {
        yield ErrorExploreState("Error Occured");
      }
    }
    if (event is GetExploreSearch) {
      yield UnExploreState();
      try {
        final videos = await videoUtils.getTrendingReceipeContent();
        final user = await userRepository.getDetails();
        yield InExploreState(video: videos, user: user, type: event.type);
      } catch (_) {
        yield ErrorExploreState("Error Occured");
      }
    }
    // } else {
    // if (event is BottomSheetClosed) {
    //   yield UnExploreState();
    // }
  }
}
