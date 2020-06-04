import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BottomNavEvent extends Equatable {
  @override
  List<Object> get props => [];
  const BottomNavEvent();
}

class CurrentIndexChanged extends BottomNavEvent {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex});
  List<Object> get props => [currentIndex];
  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class ItemTap extends BottomNavEvent {
  //List<Object> get props => [];

  final int index;
  ItemTap({@required this.index});
  List<Object> get props => [index];
  @override
  String toString() => 'ItemTap: $index';
// class UnBottomNavEvent extends BottomNavEvent {
//   @override
//   Stream<BottomNavState> applyAsync({BottomNavState currentState, BottomNavBloc bloc}) async* {
//     yield UnBottomNavState();
//   }
// }

// class LoadBottomNavEvent extends BottomNavEvent {

//   @override
//   Stream<BottomNavState> applyAsync(
//       {BottomNavState currentState, BottomNavBloc bloc}) async* {
//     try {
//       yield UnBottomNavState();
//       await Future.delayed(Duration(seconds: 1));
//       yield InBottomNavState('Hello world');
//     } catch (_, stackTrace) {
//       developer.log('$_', name: 'LoadBottomNavEvent', error: _, stackTrace: stackTrace);
//       yield ErrorBottomNavState( _?.toString());
//     }
//   }
// }
}
