import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/explore/index.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  @override
  ExploreState get initialState => UnExploreState();

  @override
  Stream<ExploreState> mapEventToState(
    ExploreEvent event,
  ) async* {
    if (event is CommentClicked) {
      yield UnExploreState();
      yield CommentClick();
      print(state.toString());
    }
    // } else {
    if (event is BottomSheetClosed) {
      yield UnExploreState();
    }
  }
}
