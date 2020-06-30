import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

class Play extends HomeVideoEvent {
  @override
  String toString() => 'Play';
}

class Pause extends HomeVideoEvent {
  @override
  String toString() => 'Pause';
}

class FetchReceipe extends HomeVideoEvent {
  //List<Object> get props => [];

  final String type;
  FetchReceipe({@required this.type});
  List<Object> get props => [type];
  @override
  String toString() => 'FetchReceipe';
  //$index';
}
