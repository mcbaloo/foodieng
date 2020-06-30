import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/Home_Video/index.dart';
import 'package:foodieng/utils/vidoesutil.dart';

class HomeVideoBloc extends Bloc<HomeVideoEvent, HomeVideoState> {
  VideoUtils videoUtils = VideoUtils();
  HomeVideoBloc();
  @override
  HomeVideoState get initialState => HomeVideoUninitialized();

  @override
  Stream<HomeVideoState> mapEventToState(
    HomeVideoEvent event,
  ) async* {
    try {
      if (event is Fetch) {
        yield HomeVideoUninitialized();
        Future.delayed(Duration(seconds: 2));
        final videos = await videoUtils.getAllVideos();
        yield HomeVideoLoaded(videoModel: videos, type: "All Contents");
      }
      if (event is Play) {
        print(event);
        yield VideoPlaying();
      }
      if (event is Pause) {
        yield VideoPaused();
      }
      if (event is FetchReceipe) {
        yield HomeVideoUninitialized();
        Future.delayed(Duration(seconds: 2));
        final videos = await videoUtils.getReceipeContent(type: event.type);
        yield HomeVideoLoaded(videoModel: videos, type: event.type);
      }
      //yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_) {
      yield ErrorHomeVideo("An Error Occured");
    }
  }
}
