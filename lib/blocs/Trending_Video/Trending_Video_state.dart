import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodieng/models/videos.dart';

abstract class TrendingVideoState extends Equatable {
  final List propss;
  TrendingVideoState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class TrendingVideoUnInitialized extends TrendingVideoState {
  TrendingVideoUnInitialized();

  @override
  String toString() => 'TrendingVideoUnInitialized';
}

/// Initialized
class TrendingVideoLoaded extends TrendingVideoState {
  final VideoModel videoModel;
  final int tapIndex;
  TrendingVideoLoaded({@required this.videoModel, @required this.tapIndex});

  @override
  String toString() => 'TrendingVideoLoaded';
}

class ErrorTrendingVideoState extends TrendingVideoState {
  final String errorMessage;

  ErrorTrendingVideoState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorTrendingVideoState';
}
