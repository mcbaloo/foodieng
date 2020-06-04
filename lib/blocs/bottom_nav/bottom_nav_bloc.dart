import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/bottom_nav/index.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  @override
  BottomNavState get initialState => BottomNavInitial();
  int currentIndex = 0;
  @override
  Stream<BottomNavState> mapEventToState(
    BottomNavEvent event,
  ) async* {
    try {
      if (event is ItemTap) {
        this.currentIndex = event.index;
        yield BottomNavChanged(currentIndex: this.currentIndex);
        //yield PageLoading();
      }
      //yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'BottomNavBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
