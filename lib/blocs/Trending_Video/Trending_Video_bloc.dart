import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';
import 'package:foodieng/utils/vidoesutil.dart';

class TrendingVideoBloc extends Bloc<TrendingVideoEvent, TrendingVideoState> {
  VideoUtils videoUtils = VideoUtils();
  int index = 1;
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
          switch (event.type) {
            case 'Video':
              //index = 1;
              yield TrendingVideoLoaded(videoModel: videos, tapIndex: index);
              break;
            case 'Recipe':
              yield TrendingVideoLoaded(videoModel: videos, tapIndex: 2);
              break;
            case 'Article':
              yield TrendingVideoLoaded(videoModel: videos, tapIndex: 3);
              break;
            default:
              yield TrendingVideoLoaded(videoModel: videos, tapIndex: 1);
              break;
          }
        } catch (_) {
          yield ErrorTrendingVideoState(_);
        }
      }
    } catch (_, stackTrace) {
      yield ErrorTrendingVideoState("Error");
    }
  }
}
