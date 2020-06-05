import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:foodieng/blocs/Home_Video/index.dart';
import 'package:foodieng/widgets/homevideo.dart';
import 'package:meta/meta.dart';

abstract class HomeVideoEvent extends Equatable {
  @override
  List<Object> get props => [];
  const HomeVideoEvent();
  // Stream<HomeVideoState> applyAsync(
  //     {HomeVideoState currentState, HomeVideoBloc bloc});
}

class Fetch extends HomeVideoEvent {
  //List<Object> get props => [];

  //final int index;
  //ItemTap({@required this.index});
  //List<Object> get props => [index];
  @override
  String toString() => 'Fetch';
  //$index';
}

// class UnHomeVideoEvent extends HomeVideoEvent {
//   @override
//   Stream<HomeVideoState> applyAsync({HomeVideoState currentState, HomeVideoBloc bloc}) async* {
//     yield UnHomeVideoState();
//   }
// }

// class LoadHomeVideoEvent extends HomeVideoEvent {

//   @override
//   Stream<HomeVideoState> applyAsync(
//       {HomeVideoState currentState, HomeVideoBloc bloc}) async* {
//     try {
//       yield UnHomeVideoState();
//       await Future.delayed(Duration(seconds: 1));
//       yield InHomeVideoState('Hello world');
//     } catch (_, stackTrace) {
//       developer.log('$_', name: 'LoadHomeVideoEvent', error: _, stackTrace: stackTrace);
//       yield ErrorHomeVideoState( _?.toString());
//     }
//   }
// }
