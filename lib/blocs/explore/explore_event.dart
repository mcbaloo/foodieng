import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:foodieng/blocs/explore/index.dart';

abstract class ExploreEvent extends Equatable {
  List<Object> get props => [];
  const ExploreEvent();
}

class CommentClicked extends ExploreEvent {
  @override
  String toString() => 'CommentClicked';
}

class BottomSheetClosed extends ExploreEvent {}
