import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodieng/models/videos.dart';

abstract class HomeVideoState extends Equatable {
  final List propss;
  HomeVideoState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnHomeVideoState extends HomeVideoState {
  UnHomeVideoState();

  @override
  String toString() => 'UnHomeVideoState';
}

/// Initialized
class HomeVideoUninitialized extends HomeVideoState {
  @override
  String toString() => 'HomeVideoUninitialized';
}

class HomeVideoLoaded extends HomeVideoState {
  final VideoModel videoModel;
  HomeVideoLoaded({@required this.videoModel});
}

class ErrorHomeVideo extends HomeVideoState {
  final String errorMessage;

  ErrorHomeVideo(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorHomeVideo';
}
