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
        final videos = await videoUtils.getAllVideos();
        yield HomeVideoLoaded(videoModel: videos);
      }
      //yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_) {
      yield ErrorHomeVideo("An Error Occured");
    }
  }
}
