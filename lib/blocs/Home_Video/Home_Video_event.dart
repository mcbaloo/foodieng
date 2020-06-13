import 'package:equatable/equatable.dart';

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
