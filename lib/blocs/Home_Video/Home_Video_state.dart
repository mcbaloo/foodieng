import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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

class VideoPlaying extends HomeVideoState {
  @override
  String toString() => 'VideoPlaying';
}

class VideoPaused extends HomeVideoState {
  @override
  String toString() => 'VideoPaused';
}

/// Initialized
class HomeVideoUninitialized extends HomeVideoState {
  @override
  String toString() => 'HomeVideoUninitialized';
}

class HomeVideoLoaded extends HomeVideoState {
  final VideoModel videoModel;
  final String type;
  HomeVideoLoaded({@required this.videoModel, @required this.type});
}

class ErrorHomeVideo extends HomeVideoState {
  final String errorMessage;

  ErrorHomeVideo(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorHomeVideo';
}
