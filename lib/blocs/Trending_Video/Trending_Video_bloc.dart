import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';
import 'package:foodieng/utils/vidoesutil.dart';

class TrendingVideoBloc extends Bloc<TrendingVideoEvent, TrendingVideoState> {
  VideoUtils videoUtils = VideoUtils();
  @override
  TrendingVideoState get initialState => TrendingVideoUnInitialized();

  @override
  Stream<TrendingVideoState> mapEventToState(
    TrendingVideoEvent event,
  ) async* {
    try {
      if (event is Fetch) {
        yield TrendingVideoUnInitialized();
        try {
          final videos = await videoUtils.getTrendingContent(type: event.type);
          yield TrendingVideoLoaded(videoModel: videos);
        } catch (_) {
          yield ErrorTrendingVideoState(_);
        }
      }
    } catch (_, stackTrace) {
      yield ErrorTrendingVideoState(_);
    }
  }
}
