import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:foodieng/blocs/Trending_Video/index.dart';

abstract class TrendingVideoEvent extends Equatable {
  @override
  List<Object> get props => [];
  const TrendingVideoEvent();
}

class Fetch extends TrendingVideoEvent {
  //List<Object> get props => [];

  final String type;
  Fetch({@required this.type});
  List<Object> get props => [type];
  @override
  String toString() => 'Fetch';
  //$index';
}
